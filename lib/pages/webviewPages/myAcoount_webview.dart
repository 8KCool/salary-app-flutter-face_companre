
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/globalkeys.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../../constants/colors.dart';
import '../../constants/sized_box.dart';
import '../../providers/clock.dart';
import '../../providers/newProvider.dart';
import '../../services/api_urls.dart';
import '../../services/auth.dart';
import '../../widgets/appbar.dart';
import '../Login_process/enter_phone_number.dart';
class MyAccountWebViewPage extends StatefulWidget {
  const MyAccountWebViewPage({Key? key}) : super(key: key);

  @override
  State<MyAccountWebViewPage> createState() => _MyAccountWebViewPageState();
}

class _MyAccountWebViewPageState extends State<MyAccountWebViewPage> {
  late WebViewController globalmyAccountController;
  // late WebViewController controller;
  bool load=false;
  WebViewCookieManager cookieManager = WebViewCookieManager();
  @override
  void initState() {
    // print('hjelddfldgfgfdgfg');
    // mainUrl=widget.url;
    // getToken();
    // // TODO: implement initState
    // if(isConnected){
    //
    // }

    cookieManager.setCookie(
      WebViewCookie(
        name: 'web_app',
        value: '${usertoken}',
        domain: 'app.swipebox.in',
        path: '/staff/openweb',
        ///eyJpdiI6Ik1iNFZCRjZxeUdDMEUzRm9jUFdJNnc9PSIsInZhbHVlIjoibTZOVFMvZWZBMzdvbnBVM0k0YVFiMDNlNnN4U3lta0JXZG42RHlScy9tRkErOUY0bDdMbWNzNWpJMzdhclIvaWRDOHhhaGJndTVKZ1B0a0NxQjVZWnFyemlydm1BcG1iMk5EMjQxbTRUU3h0SC9WNU1pYlBKaGk1Kzh5QlRIa1oiLCJtYWMiOiIwZWQ3ZmJmZjk2NjZhNjI1MDgzOTA0ZjAyMWUxZDc2M2ZiOTAzZWNhYmU4MjliZTFkNjQwZWM5ZjgyMTBjNWIzIiwidGFnIjoiIn0%3D
      ),
    );
    // print('url---------------${widget.url}');
    // if(widget.isTab!=null){
    //   print('isTab---------------${widget.isTab}');
    //
    //   isBack=false;
    // }
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

    globalmyAccountController =  controller
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

      ..loadRequest(Uri.parse("${ApiUrls.siteBaseUrl}staff/my_account"));//https://app.swipebox.in/staff/openweb?redirect_url=


    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    getCookies('cookies after initialization');
    super.initState();
    // setdata();
    // #docregion platform_features

  }
  getCookies(msg)async{
    var cookies = await globalmyAccountController.runJavaScriptReturningResult(
      'document.cookie',
    );
    print("${msg}----${cookies}");
  }
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,

        appBar: appBar(
          context: context,
          title: '${Provider.of<PermissionModal>(context, listen: true).dashboardMenuPermission['company_name']??'${Provider.of<GlobalModal>(context, listen: false).userData!.companyName}'}',
          titleColor:Colors.black,
          implyLeading:false,
          titlecenter: false,

          leading:GestureDetector(
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
        body: Stack(
          children: [
            WebViewWidget(
              controller: globalmyAccountController,)
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
