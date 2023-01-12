


import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/pages/temp/settings_page.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import '../../constants/colors.dart';
import '../../constants/globalFunction.dart';
import '../../constants/globalkeys.dart';
import '../../constants/image_urls.dart';
import '../../constants/sized_box.dart';
import '../../functions/navigation_functions.dart';
import '../../providers/attendanceCalendar.dart';
import '../../providers/clock.dart';
import '../../providers/newProvider.dart';
import '../../services/api_urls.dart';
import '../../services/auth.dart';
import '../../widgets/CustomLoader.dart';
import '../../widgets/appbar.dart';
import '../Login_process/enter_phone_number.dart';
import '../attendance/attendance_step1.dart';
import '../notificationPage.dart';
import '../tab_pages/dashboard.dart';
import '../tabbarscreen.dart';
import '../temp/dashboard_page.dart';
import '../temp/my_account_page.dart';






class NewTabScreen extends StatefulWidget {
  const NewTabScreen({Key? key}) : super(key: key);

  @override
  State<NewTabScreen> createState() => NewTabScreenState();
}


enum TabType{
  dashboard,myaccount,settings, defaultType
}



WebViewCookieManager cookieManager = WebViewCookieManager();
class NewTabScreenState extends State<NewTabScreen> {
  late WebViewController dashboardController;
  bool load=true;
  TabType selectedTab  = TabType.myaccount;
  int selectIndex=0;


  webViewInitialization()async{

    String url = '${ApiUrls.siteBaseUrl}';
    String? manishToken = Provider.of<GlobalModal>(MyGlobalKeys.navigatorKey.currentContext!, listen: false).userData?.token;
    print('the token mmmm is ${manishToken}');
    globalHeaders = {
      'Authorization': 'Bearer $manishToken',
      // 'Accept': 'application/json'
    };

      late final PlatformWebViewControllerCreationParams params;
      if (WebViewPlatform.instance is WebKitWebViewPlatform) {
        params = WebKitWebViewControllerCreationParams(
          allowsInlineMediaPlayback: true,
          mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
        );
      } else {
        params = const PlatformWebViewControllerCreationParams();
      }
      print('Initializing dashboard controller');
      dashboardController =
      WebViewController.fromPlatformCreationParams(params);
      await dashboardController.setJavaScriptMode(JavaScriptMode.unrestricted);
      await dashboardController.setBackgroundColor(const Color(0x00000000));
      await dashboardController.enableZoom(false);
      // await controller.clearCache();
      await dashboardController
          .setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if(progress==100){
            }
            print('The page is loading $progress');
            // debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
            // MyGlobalKeys.dashboardPageNewState.currentState?.isLoad.value=true;
          },
          onPageFinished: (String url) {
            print('on page finished----manish $url');
            // MyGlobalKeys.dashboardPageNewState.currentState?.isLoad.value=false;
          },
          onWebResourceError: (WebResourceError error) {
            // print('the web resource rrorrrrr ${error.errorType} ${WebResourceErrorType.}');
            print('the web resource rrorrrrr ${error.errorCode}');
            print('the web resource rrorrrrr ${error.description}');

          },
          onNavigationRequest: (NavigationRequest request) {

            print('requested url is ${request.url}');
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            if(request.url.contains('${ApiUrls.baseUrl}staff/dashboard')){
              dashboardController.runJavaScript("window.open('${ApiUrls.webBaseUrl}my_account')");
              return NavigationDecision.prevent;
            }
            // debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
        ),

      );
      await dashboardController
          .addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          print('the on message received is called');

        },
      );
      log('the headddddddddddddd ${url} : url} and ${globalHeaders}');
      await dashboardController.loadRequest(Uri.parse(url,), headers: globalHeaders,method: LoadRequestMethod.get,);

      // #docregion platform_features
      if (dashboardController.platform is AndroidWebViewController) {
        AndroidWebViewController.enableDebugging(true);

        (dashboardController.platform as AndroidWebViewController)
            .setMediaPlaybackRequiresUserGesture(false);
      }
      await Future.delayed(Duration(seconds: 2));

    setState((){
      load = false;
    });
  }

  @override
  void initState() {
    webViewInitialization();
    super.initState();
  }


  int index = 0;



  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
       if(selectIndex==0){
         if(MyGlobalKeys.dashboardPageNewState.currentState?.isWeb.value==true){
           MyGlobalKeys.dashboardPageNewState.currentState?.isWeb.value=false;
           return false;
         }
         return true;
       }
       else{
         if(MyGlobalKeys.dashboardPageNewState.currentState?.isLoad.value == true){
           MyGlobalKeys.dashboardPageNewState.currentState?.isLoad.value = false;
           return false;
         }
         if(await dashboardController.canGoBack()){
           print(' i am here 8.......');
           String currentUrl = (await dashboardController.currentUrl())??'';
           print(' i am here 1.......$currentUrl');
           if(currentUrl.contains('${ApiUrls.baseUrl}my_account')){
             print(' i am here 7.......');
             if(selectIndex==2){
               print(' i am here 6.5.......');
               return false;

             }else{
               print(' i am here 6.......');
               dashboardController.goBack();

             }
           }else{
             dashboardController.goBack();
           }
         }else{
           print(' i am here 5.......');
           if(selectIndex==0){
             print(' i am here 4.......');
             return true;
           }else{
             print(' i am here 3.......');
             selectIndex = 0;
             if(MyGlobalKeys.dashboardPageNewState.currentState?.isWeb.value==true){
               MyGlobalKeys.dashboardPageNewState.currentState?.isWeb.value=false;
             }
             print(' i am here 2.......');
             return false;
           }
         }

       }
       print(' i am here 1.......');
       return false;
      },

      child: Scaffold(
        key: scaffoldKey,
        appBar:  appBar(

          context: context,
          title: '${Provider.of<PermissionModal>(context, listen: true).dashboardMenuPermission['company_name']??'${Provider.of<GlobalModal>(context, listen: false).userData!.companyName}'}',
          titleColor:Colors.black,
          implyLeading: false,
          titlecenter: false,
          leading: GestureDetector(
            onTap: ()async{
              scaffoldKey.currentState?.openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          appBarColor: MyColors.white,
          // titleColor: Colors.white,
        ),
        drawer: Drawer(
            width: MediaQuery.of(context).size.width-100,

            child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);

                  showDialog(context: context, builder: (context1) {
                    return AlertDialog(

                      title: Text('Logout',),
                      content: Text('Are you sure, want to logout?'),
                      actions: [
                        TextButton(
                            onPressed: () async {
                              await logout();
                              // Navigator.of(context).pushReplacementNamed('/pre-login');
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) =>
                                      Enter_Phone_Number()), (
                                  Route<dynamic> route) => false);
                            }, child: Text('logout')),
                        TextButton(onPressed: () async {
                          Navigator.pop(context1);
                        }, child: Text('cancel')
                        ),
                      ],
                    );
                  });
                  // push(context: context, screen: Welcome_Page());

                },
                child: Column(
                  children: [
                    Container(
                        height: 200,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Image.asset('assets/images/Vector (3).png',height: 30,width: 30,),
                            hSizedBox,
                            Text('Logout',style: TextStyle(fontSize: 16),),
                          ],
                        )),
                  ],
                ))// Populate the Drawer in the next step.
        ),
        body:load?CustomLoader(): Column(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            // if(load)
            Expanded(
              // child: getTab(selectedTab),
              child:  IndexedStack(
                index: index,
                children: <Widget>[
                  DashboardPageNew(controller: dashboardController, key: MyGlobalKeys.dashboardPageNewState,),
                  if( Provider.of<GlobalModal>(context,listen: false).userData!.userId!=1)
                    CheckAttStatusPage(navigatorKey: navigatorKeys[1]!,),
                ],
              ),
            ),
            Container(
              height: 68,
              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    behavior:HitTestBehavior.opaque,
                    onTap:(){
                      selectIndex = 0;
                      setState(() {

                      });
                      MyGlobalKeys.dashboardPageNewState.currentState?.isWeb.value = false;
                      print('dashboard clicked ${MyGlobalKeys.dashboardPageNewState.currentState?.isWeb.value}');
                    },
                    child: Column(
                      children: [
                        ImageIcon(
                          AssetImage(MyImages.home_icon),
                          color:selectIndex==0?MyColors.primaryColor: MyColors.bottommenucolor,
                          size: 23,
                        ),
                        Text('Dashboard',style: TextStyle( color:selectIndex==0?MyColors.primaryColor: MyColors.bottommenucolor,fontSize: 11),)

                      ],
                    ),),

                  if( Provider.of<GlobalModal>(context,listen: false).userData!.userId!=1)

                    GestureDetector(
                      behavior:HitTestBehavior.opaque,
                      onTap:(){
                        selectIndex=1;
                        index = Provider.of<GlobalModal>(context,listen: false).userData!.userId!=1?1:0;
                        print('going to the dashboard');
                        setState(() {
                          selectedTab = TabType.dashboard;
                        });
                        print('going to the dashboard ${selectedTab}');
                        // myAccountController.loadRequest(Uri.parse('${ApiUrls.baseUrl}staff/setting'));
                      },
                      child: Column(
                        children: [
                          ImageIcon(
                            AssetImage(MyImages.fingerprint_icon),
                            color:selectIndex==1?MyColors.primaryColor: MyColors.bottommenucolor,
                            size: 23,
                          ),
                          Text('Mark Attendance',style: TextStyle( color:selectIndex==1?MyColors.primaryColor: MyColors.bottommenucolor,fontSize: 11),)

                        ],
                      ),),
                  GestureDetector(
                    behavior:HitTestBehavior.opaque,
                    onTap:()async{
                      if(MyGlobalKeys.dashboardPageNewState.currentState?.isLoad.value==true){
                        print('is load is true');
                        return;
                      }
                      selectIndex = 2;
                      setState(() {

                      });
                      print('my account clicked');
                      // MyGlobalKeys.dashboardPageNewState.currentState?.isLoad.value=true;
                      // MyGlobalKeys.dashboardPageNewState.currentState?.isLoad.value = true;
                      dashboardController.runJavaScript("window.open('${ApiUrls.webBaseUrl}my_account')");
                        MyGlobalKeys.dashboardPageNewState.currentState?.isWeb.value = true;
                      // dashboardController.loadRequest(Uri.parse('${ApiUrls.webBaseUrl}my_account'));
                      // dashboardController.setNavigationDelegate(NavigationDelegate(onPageFinished:(str){
                      //   MyGlobalKeys.dashboardPageNewState.currentState?.isWeb.value = true;
                      //   MyGlobalKeys.dashboardPageNewState.currentState?.isLoad.value=false;
                      //   isWebView=true;}));
                    },
                    child: Column(
                      children: [
                        ImageIcon(
                          AssetImage(MyImages.profile_icon),
                          color:selectIndex==2?MyColors.primaryColor: MyColors.bottommenucolor,
                          size: 23,
                        ),
                        Text('My Account',style: TextStyle( color:selectIndex==2?MyColors.primaryColor: MyColors.bottommenucolor,fontSize: 11),)

                      ],
                    ),),
                  GestureDetector(
                    behavior:HitTestBehavior.opaque,
                    onTap:()async{
                      if(MyGlobalKeys.dashboardPageNewState.currentState?.isLoad.value==true){
                        print('is load is true');
                        return;
                      }
                      selectIndex = 3;
                      // MyGlobalKeys.dashboardPageNewState.currentState?.isLoad.value=true;
                      setState(() {

                      });
                      print('my account clicked');
                      // MyGlobalKeys.dashboardPageNewState.currentState?.isLoad.value = true;
                      await dashboardController.runJavaScript("window.open('${ApiUrls.webBaseUrl}setting')");
                      print('now doneeeeeeee');
                      MyGlobalKeys.dashboardPageNewState.currentState?.isWeb.value = true;
                      // dashboardController.loadRequest(Uri.parse('${ApiUrls.webBaseUrl}setting'));
                      // dashboardController.setNavigationDelegate(NavigationDelegate(onPageFinished:(str){
                      //   MyGlobalKeys.dashboardPageNewState.currentState?.isWeb.value = true;
                      //   MyGlobalKeys.dashboardPageNewState.currentState?.isLoad.value=false;
                      //   isWebView=true;}));
                    },
                    child: Column(
                      children: [
                        ImageIcon(
                          AssetImage(MyImages.setting_icon),
                          color:selectIndex==3?MyColors.primaryColor: MyColors.bottommenucolor,
                          size: 23,
                        ),
                        Text('Setting',style: TextStyle( color:selectIndex==3?MyColors.primaryColor: MyColors.bottommenucolor,fontSize: 11),)

                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}





