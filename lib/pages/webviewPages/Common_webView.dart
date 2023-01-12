import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/pages/mark_attendance/mark_attendance.dart';
import 'package:salaryredesign/pages/tab_pages/dashboard.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../../constants/colors.dart';
import '../../constants/globalkeys.dart';
import '../../constants/image_urls.dart';
import '../../constants/sized_box.dart';
import '../../functions/navigation_functions.dart';
import '../../providers/clock.dart';
import '../../providers/newProvider.dart';
import '../../services/api_urls.dart';
import '../../services/auth.dart';
import '../../services/local_services.dart';
import '../../widgets/appbar.dart';
import '../../widgets/showSnackbar.dart';
import '../Login_process/enter_phone_number.dart';
import '../attendance/attendance_step1.dart';
import '../notificationPage.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WebViewController myController;
  bool load=false;
  Map<int, GlobalKey> navigatorKeys = {
    0: GlobalKey(),
    1: GlobalKey(),
    2: GlobalKey(),
  };
  List BottomTab=[
    {'id':'1','icon':'${MyImages.home_icon}','Text':'Dashboard','isSelected':true,'url':'${ApiUrls.baseUrl}staff/dashboard'},

    {'id':'2','icon':'${MyImages.fingerprint_icon}','Text':'Mark Attendance','isSelected':false,'url':'${ApiUrls.baseUrl}staff/salaryprocess'},
    {'id':'3','icon':'${MyImages.profile_icon}','Text':'My Account','isSelected':false,'url':'${ApiUrls.baseUrl}staff/my_account'},
    {'id':'4','icon':'${MyImages.setting_icon}','Text':'Settings','isSelected':false,'url':'${ApiUrls.baseUrl}staff/setting'},
  ];
  int selectIndex=0;
  WebViewCookieManager cookieManager = WebViewCookieManager();
  webViewInitilization()async{
    load=true;
    setState(() {

    });
    cookieManager.setCookie(
      WebViewCookie(
        name: 'web_app',
        value: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMGE0ZmQxNmE5MTE3NjgxMWVlZTA2NjU2NjZiZWY5ZTYyNjBmN2JjZTRjM2FiZGM5MGZkOTI5YWU3NTU4MmY4MDZkMjdhMGVkYmZjOTYyNjYiLCJpYXQiOjE2NzI5MTIzMTguMDU3NDQyOTAzNTE4Njc2NzU3ODEyNSwibmJmIjoxNjcyOTEyMzE4LjA1NzQ0NDA5NTYxMTU3MjI2NTYyNSwiZXhwIjoxNzA0NDQ4MzE4LjA1NDU4Njg4NzM1OTYxOTE0MDYyNSwic3ViIjoiMjI4Iiwic2NvcGVzIjpbXX0.uq1f0TOzFdQS8lg-BosrCei3zhMcb2_WeIsmFpkdirNFF0YG0oYYWoIAL1X86gTGJTboM7spllB6c4j7Pa3eRc88gDJM6xW19BOMTLXimxMRjXE5s4buUPefuylj4X53ibMqKDabGq8yIsYbGLwbWe59hxg29JakBQLoqRqCv7UrTDnEC6SB5WWgXizQneVwyS9lgbZuIIJkZiK6A8x55CJRn-hyE_Mz9mvnAplZFlDU2u1kSJuwPOQJMJwMZwQ44hhNIW00833gzmEFaN0-4cXRw54gFbp_hUtVDiMVStCI1ss3zAmJBElklVoKoSDQTsDyjCViT-wPBehW8Kr5_Gt6sjspAJFZ6joU4wJXyypNyI9YnPb-dPyeTeCeN0g1jIEbC9KgLAh_66OI5nm2Lw086VJQcrv4TKbznOpPvt-1OXGHeoRQ1uSSeWJpECoBU-ZOOQrFgGKpc1p7gdKKPnMNpD-aLvMcVd_OkjNvZV4oDrbnIFDsCDiGlCyksjeUOCCghD9jZagXGkFYM7JnJ1_n5sTuFinwJ5EIYL8YafPl2gvFZ_IRfCT2xGY4KmYcAvSxKYTbXdIC-ZVpc9PmVmLrT6dFFxEIDaN6NOnKw2t2Q-_WNfiqal8nj3GR8PLrJ4Zr7I0pI478s3N8rSxUXZ-944HXgXz2qhwREKPrnXc',
        domain: 'app.swipebox.in',
        path: '/staff/openweb',
        ///eyJpdiI6Ik1iNFZCRjZxeUdDMEUzRm9jUFdJNnc9PSIsInZhbHVlIjoibTZOVFMvZWZBMzdvbnBVM0k0YVFiMDNlNnN4U3lta0JXZG42RHlScy9tRkErOUY0bDdMbWNzNWpJMzdhclIvaWRDOHhhaGJndTVKZ1B0a0NxQjVZWnFyemlydm1BcG1iMk5EMjQxbTRUU3h0SC9WNU1pYlBKaGk1Kzh5QlRIa1oiLCJtYWMiOiIwZWQ3ZmJmZjk2NjZhNjI1MDgzOTA0ZjAyMWUxZDc2M2ZiOTAzZWNhYmU4MjliZTFkNjQwZWM5ZjgyMTBjNWIzIiwidGFnIjoiIn0%3D
      ),
    );
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},

      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
    WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    // controller.

    myController =  controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
    // ..clearLocalStorage()


      ..clearCache()

      ..setNavigationDelegate(
        NavigationDelegate(

          onProgress: (int progress) {

          },
          onPageStarted: (String url) {
            // print('urlllllll--------------${widget.url}');

          },
          onPageFinished: (String url) {
            getCookies('cookies after finished');

            // debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
            Page resource error:
            code: ${error.errorCode}
            description: ${error.description}
            errorType: ${error.errorType}
            isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            print('requested url is ${request.url}');
            // if(request.url.contains(other))

            if(request.url.startsWith('${ApiUrls.baseUrl}staff/login')){
              Navigator.popUntil(MyGlobalKeys.navigatorKey.currentContext!, (route) => route.isFirst);
              sharedPreference.clear();
              showSnackbar(MyGlobalKeys.navigatorKey.currentContext!, 'Session Expired');
              pushReplacement(context: MyGlobalKeys.navigatorKey.currentContext!, screen: Enter_Phone_Number());
              return NavigationDecision.prevent;
            }
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
        ),

      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )

    // ..loadRequest(Uri.parse('${ApiUrls.baseUrl}staff/openweb?redirect_url=${ApiUrls.baseUrl}staff/dashboard'));//${ApiUrls.baseUrl}staff/openweb?redirect_url=
      ..loadRequest(Uri.parse('${ApiUrls.baseUrl}staff/dashboard'));


    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    getCookies('cookies after initialization');
    load=false;
    setState(() {

    });
  }
  @override
  void initState() {
    webViewInitilization();
    super.initState();
  }
  getCookies(msg)async{
    var cookies = await myController.runJavaScriptReturningResult(
      'document.cookie',
    );
    print("${msg}-zz---${cookies}");
  }
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF3F4F6),
        appBar: appBar(

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
            actions: [
              GestureDetector(
                  onTap: () => push(context: context, screen: NotificationPage1()),
                  child: Icon(Icons.notifications_outlined)
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.help_outline_outlined,
                ),
              ),

            ]),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            // if(load)
            if(selectIndex!=0)
              Expanded(child: WebViewWidget(controller:myController)),
            if(selectIndex==0)
              // Expanded(child: Dashboard_Page()),
            if(selectIndex==1)
              Expanded(child: CheckAttStatusPage(navigatorKey: navigatorKeys[1]!,)),
            Container(
              padding: EdgeInsets.all(16),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // for(int i=0;i<BottomTab.length;i++)

                  GestureDetector(
                    behavior:HitTestBehavior.opaque,
                    onTap:(){
                      selectIndex=0;
                      myController.loadRequest(Uri.parse('${ApiUrls.baseUrl}staff/dashboard'));
                      setState(() {

                      });
                    },
                    child: Column(
                      children: [
                        Image.asset(MyImages.home_icon,
                          color:selectIndex==0?MyColors.primaryColor: MyColors.bottommenucolor,
                          height: 24,
                        ),
                        Text('Dashboard',style: TextStyle( color:selectIndex==0?MyColors.primaryColor: MyColors.bottommenucolor,fontSize: 12),)
                      ],
                    ),
                  ),
                  // if( Provider.of<GlobalModal>(context,listen: false).userData!.userId!=1)
                  GestureDetector(
                    behavior:HitTestBehavior.opaque,
                    onTap:(){
                      selectIndex=1;
                      myController.loadRequest(Uri.parse('${ApiUrls.baseUrl}staff/dashboard'));
                      setState(() {

                      });
                    },
                    child: Column(
                      children: [
                        Image.asset(MyImages.fingerprint_icon,
                          color:selectIndex==1?MyColors.primaryColor: MyColors.bottommenucolor,
                          height: 24,
                        ),
                        Text('Mark Attendance',style: TextStyle( color:selectIndex==1?MyColors.primaryColor: MyColors.bottommenucolor,fontSize: 12),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    behavior:HitTestBehavior.opaque,
                    onTap:(){
                      selectIndex=2;
                      myController.loadRequest(Uri.parse('${ApiUrls.baseUrl}staff/my_account'));
                      setState(() {

                      });
                    },
                    child: Column(
                      children: [
                        Image.asset(MyImages.profile_icon,
                          color:selectIndex==2?MyColors.primaryColor: MyColors.bottommenucolor,
                          height: 24,
                        ),
                        Text('My Account',style: TextStyle( color:selectIndex==2?MyColors.primaryColor: MyColors.bottommenucolor,fontSize: 12),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    behavior:HitTestBehavior.opaque,
                    onTap:(){
                      selectIndex=3;
                      myController.loadRequest(Uri.parse('${ApiUrls.baseUrl}staff/setting'));
                      setState(() {

                      });
                    },
                    child: Column(
                      children: [
                        Image.asset(MyImages.setting_icon,
                          color:selectIndex==3?MyColors.primaryColor: MyColors.bottommenucolor,
                          height: 24,
                        ),
                        Text('Setting',style: TextStyle( color:selectIndex==3?MyColors.primaryColor: MyColors.bottommenucolor,fontSize: 12),)
                      ],
                    ),
                  ),
                  // GestureDetector(
                  //     behavior:HitTestBehavior.opaque,
                  //     onTap:(){
                  //       myController.loadRequest(Uri.parse('${ApiUrls.baseUrl}staff/attendance-detail'));
                  //     },
                  //     child: Icon(Icons.margin)),
                  // GestureDetector(
                  //     behavior:HitTestBehavior.opaque,
                  //     onTap:(){
                  //       myController.loadRequest(Uri.parse('${ApiUrls.baseUrl}staff/salaryprocess'));
                  //     },
                  //     child: Icon(Icons.heart_broken_rounded)),
                ],
              ),
            )
          ],
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
        )
    );
  }
}
