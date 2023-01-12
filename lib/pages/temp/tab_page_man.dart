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
import '../../functions/navigation_functions.dart';
import '../../providers/attendanceCalendar.dart';
import '../../providers/clock.dart';
import '../../providers/newProvider.dart';
import '../../services/api_urls.dart';
import '../../widgets/CustomLoader.dart';
import '../../widgets/appbar.dart';
import '../notificationPage.dart';
import '../tab_pages/dashboard.dart';
import '../tabbarscreen.dart';
import 'my_account_page.dart';



void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => GlobalModal(),),
      ChangeNotifierProvider(
        create: (context) => PermissionModal(),),
      ChangeNotifierProvider(
        create: (context) => AttendanceCalendarModal(),),
    ],
    child: const MyApp(),

  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const ManishHomePage(),
    );
  }
}


class ManishHomePage extends StatefulWidget {
  const ManishHomePage({Key? key}) : super(key: key);

  @override
  State<ManishHomePage> createState() => ManishHomePageState();
}


enum TabType{
  dashboard,myaccount,settings, defaultType
}
WebViewCookieManager cookieManager = WebViewCookieManager();
class ManishHomePageState extends State<ManishHomePage> {
  // late WebViewController myController;
  late WebViewController dashboardController;
  late WebViewController myAccountController;
  late WebViewController settingController;
  bool load=true;
  // WebViewCookieManager cookieManager = WebViewCookieManager();
  TabType selectedTab  = TabType.myaccount;


  webViewInitialization()async{

    String? manishToken = Provider.of<GlobalModal>(MyGlobalKeys.navigatorKey.currentContext!, listen: false).userData?.token;
    print('the token mmmm is ${manishToken}');
    globalHeaders = {
      'Authorization': 'Bearer $manishToken',
      // 'Accept': 'application/json'
    };
    if(isConnected)

      await cookieManager.clearCookies();

    // await cookieManager.setCookie(
    //   WebViewCookie(
    //     name: 'web_app',
    //     value: '${manishToken??''}',
    //     domain: 'app.swipebox.in',
    //     path: '/',
    //     // path: '/staff/openweb',
    //     ///eyJpdiI6Ik1iNFZCRjZxeUdDMEUzRm9jUFdJNnc9PSIsInZhbHVlIjoibTZOVFMvZWZBMzdvbnBVM0k0YVFiMDNlNnN4U3lta0JXZG42RHlScy9tRkErOUY0bDdMbWNzNWpJMzdhclIvaWRDOHhhaGJndTVKZ1B0a0NxQjVZWnFyemlydm1BcG1iMk5EMjQxbTRUU3h0SC9WNU1pYlBKaGk1Kzh5QlRIa1oiLCJtYWMiOiIwZWQ3ZmJmZjk2NjZhNjI1MDgzOTA0ZjAyMWUxZDc2M2ZiOTAzZWNhYmU4MjliZTFkNjQwZWM5ZjgyMTBjNWIzIiwidGFnIjoiIn0%3D
    //   ),
    // );
    dashboardController = await setManishController('${ApiUrls.siteBaseUrl}');
    myAccountController = await setManishController('${ApiUrls.webBaseUrl}my_account');
    settingController = await setManishController('${ApiUrls.webBaseUrl}setting');
    setState((){
      load = false;
    });
  }

  @override
  void initState() {
    webViewInitialization();
    super.initState();
  }
  // getCookies(msg)async{
  //   var cookies = await myAccountController.runJavaScriptReturningResult(
  //     'document.cookie',
  //   );
  //   print("${msg}-zz---${cookies}");
  // }


  getTab(TabType tab){
    print('the tab type is $tab');
    switch(tab){

      case TabType.myaccount: return WebViewWidget(controller:myAccountController);
      case TabType.settings: return WebViewWidget(controller:settingController);
      case TabType.dashboard: return WebViewWidget(controller:settingController);
      default: return Container();
    }
  }

  int index = 0;


  checkInternet()async{

    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      print('not connected');
    }
  }
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        if(index==0){
          return true;
        }else if (index==1){
          try{
            await myAccountController.goBack();
          }catch(e){
            print('Error in catch block $e');
          }
          return false;
        }else if (index==2){
          try{
            await settingController.goBack();
          }catch(e){
            print('Error in catch block $e');
          }
          return false;
        }else{
          return false;
        }
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
        body:load?CustomLoader(): Column(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            // if(load)
            Expanded(
              // child: getTab(selectedTab),
              child:  IndexedStack(
                index: index,
                children: <Widget>[
                  // Dashboard_Page(),
                  MyAccountPage(controller: myAccountController),
                  SettingsPage(controller: settingController),

                ],
              ),
            ),
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    behavior:HitTestBehavior.opaque,
                    onTap:(){
                      index = 0;
                      print('going to the dashboard');
                      setState(() {
                        selectedTab = TabType.dashboard;
                      });
                      print('going to the dashboard ${selectedTab}');
                      // myAccountController.loadRequest(Uri.parse('${ApiUrls.baseUrl}staff/setting'));
                    },
                    child: ImageIcon(
                      AssetImage(MyImages.home_icon),
                      color: MyColors.bottommenucolor,
                      size: 24,
                    ),),
                  GestureDetector(
                    behavior:HitTestBehavior.opaque,
                    onTap:()async{
                      index = 1;
                      print('going to the my account from ${selectedTab}');

                      setState(() {
                        selectedTab = TabType.myaccount;

                      });
                      print('In to the dashboard ${selectedTab}');
                      // myAccountController.loadRequest(Uri.parse('${ApiUrls.baseUrl}staff/attendance-detail'));
                    },
                    child: ImageIcon(
                      AssetImage(MyImages.profile_icon),
                      color: MyColors.bottommenucolor,
                      size: 24,
                    ),),
                  GestureDetector(
                    behavior:HitTestBehavior.opaque,
                    onTap:()async{
                      index = 2;
                      print('going to the settings from ${selectedTab}');
                      setState(() {
                        selectedTab = TabType.settings;
                      });
                      print('infowider settings from ${selectedTab}');
                      // myAccountController.loadRequest(Uri.parse('${ApiUrls.baseUrl}staff/salaryprocess'));
                    },
                    child: ImageIcon(
                      AssetImage(MyImages.setting_icon),
                      color: MyColors.bottommenucolor,
                      size: 24,
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

// webViewInitilization({bool isFirst = true})async{
//   load=true;
//   setState(() {
//
//   });
//   cookieManager.setCookie(
//     WebViewCookie(
//       name: 'web_app',
//       value: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMGE0ZmQxNmE5MTE3NjgxMWVlZTA2NjU2NjZiZWY5ZTYyNjBmN2JjZTRjM2FiZGM5MGZkOTI5YWU3NTU4MmY4MDZkMjdhMGVkYmZjOTYyNjYiLCJpYXQiOjE2NzI5MTIzMTguMDU3NDQyOTAzNTE4Njc2NzU3ODEyNSwibmJmIjoxNjcyOTEyMzE4LjA1NzQ0NDA5NTYxMTU3MjI2NTYyNSwiZXhwIjoxNzA0NDQ4MzE4LjA1NDU4Njg4NzM1OTYxOTE0MDYyNSwic3ViIjoiMjI4Iiwic2NvcGVzIjpbXX0.uq1f0TOzFdQS8lg-BosrCei3zhMcb2_WeIsmFpkdirNFF0YG0oYYWoIAL1X86gTGJTboM7spllB6c4j7Pa3eRc88gDJM6xW19BOMTLXimxMRjXE5s4buUPefuylj4X53ibMqKDabGq8yIsYbGLwbWe59hxg29JakBQLoqRqCv7UrTDnEC6SB5WWgXizQneVwyS9lgbZuIIJkZiK6A8x55CJRn-hyE_Mz9mvnAplZFlDU2u1kSJuwPOQJMJwMZwQ44hhNIW00833gzmEFaN0-4cXRw54gFbp_hUtVDiMVStCI1ss3zAmJBElklVoKoSDQTsDyjCViT-wPBehW8Kr5_Gt6sjspAJFZ6joU4wJXyypNyI9YnPb-dPyeTeCeN0g1jIEbC9KgLAh_66OI5nm2Lw086VJQcrv4TKbznOpPvt-1OXGHeoRQ1uSSeWJpECoBU-ZOOQrFgGKpc1p7gdKKPnMNpD-aLvMcVd_OkjNvZV4oDrbnIFDsCDiGlCyksjeUOCCghD9jZagXGkFYM7JnJ1_n5sTuFinwJ5EIYL8YafPl2gvFZ_IRfCT2xGY4KmYcAvSxKYTbXdIC-ZVpc9PmVmLrT6dFFxEIDaN6NOnKw2t2Q-_WNfiqal8nj3GR8PLrJ4Zr7I0pI478s3N8rSxUXZ-944HXgXz2qhwREKPrnXc',
//       domain: 'app.swipebox.in',
//       path: '/staff/openweb',
//       ///eyJpdiI6Ik1iNFZCRjZxeUdDMEUzRm9jUFdJNnc9PSIsInZhbHVlIjoibTZOVFMvZWZBMzdvbnBVM0k0YVFiMDNlNnN4U3lta0JXZG42RHlScy9tRkErOUY0bDdMbWNzNWpJMzdhclIvaWRDOHhhaGJndTVKZ1B0a0NxQjVZWnFyemlydm1BcG1iMk5EMjQxbTRUU3h0SC9WNU1pYlBKaGk1Kzh5QlRIa1oiLCJtYWMiOiIwZWQ3ZmJmZjk2NjZhNjI1MDgzOTA0ZjAyMWUxZDc2M2ZiOTAzZWNhYmU4MjliZTFkNjQwZWM5ZjgyMTBjNWIzIiwidGFnIjoiIn0%3D
//     ),
//   );
//   late final PlatformWebViewControllerCreationParams params;
//   if (WebViewPlatform.instance is WebKitWebViewPlatform) {
//     params = WebKitWebViewControllerCreationParams(
//       allowsInlineMediaPlayback: true,
//       mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
//
//     );
//   } else {
//     params = const PlatformWebViewControllerCreationParams();
//   }
//
//   final WebViewController controller =
//   WebViewController.fromPlatformCreationParams(params);
//   // #enddocregion platform_features
//
//   // controller.
//
//   myController =  controller
//     ..setJavaScriptMode(JavaScriptMode.unrestricted)
//     ..setBackgroundColor(const Color(0x00000000))
//   // ..clearLocalStorage()
//
//
//     ..clearCache()
//
//     ..setNavigationDelegate(
//       NavigationDelegate(
//
//         onProgress: (int progress) {
//
//         },
//         onPageStarted: (String url) {
//           // print('urlllllll--------------${widget.url}');
//
//         },
//         onPageFinished: (String url) {
//           getCookies('cookies after finished');
//
//           // debugPrint('Page finished loading: $url');
//         },
//         onWebResourceError: (WebResourceError error) {
//           debugPrint('''
//           Page resource error:
//           code: ${error.errorCode}
//           description: ${error.description}
//           errorType: ${error.errorType}
//           isForMainFrame: ${error.isForMainFrame}
//         ''');
//         },
//         onNavigationRequest: (NavigationRequest request) {
//           if (request.url.startsWith('https://www.youtube.com/')) {
//             debugPrint('blocking navigation to ${request.url}');
//             return NavigationDecision.prevent;
//           }
//           debugPrint('allowing navigation to ${request.url}');
//           return NavigationDecision.navigate;
//         },
//       ),
//
//     )
//     ..addJavaScriptChannel(
//       'Toaster',
//       onMessageReceived: (JavaScriptMessage message) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(message.message)),
//         );
//       },
//     )
//
//     ..loadRequest(Uri.parse('${ApiUrls.baseUrl}staff/openweb?redirect_url=ApiUrls.baseUrlstaff/dashboard'));//${ApiUrls.baseUrl}staff/openweb?redirect_url=
//
//
//   // #docregion platform_features
//
//
//   if (controller.platform is AndroidWebViewController) {
//     AndroidWebViewController.enableDebugging(true);
//     (controller.platform as AndroidWebViewController)
//         .setMediaPlaybackRequiresUserGesture(false);
//   }
//   getCookies('cookies after initialization');
//   load=false;
//   setState(() {
//
//   });
// }
}
