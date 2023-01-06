// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:salaryredesign/constants/globalkeys.dart';
// import 'package:salaryredesign/services/auth.dart';
// import 'package:salaryredesign/widgets/appbar.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter_android/webview_flutter_android.dart';
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
//
// import '../../constants/colors.dart';
// import '../../constants/globalFunction.dart';
// import '../../constants/sized_box.dart';
// import '../../providers/clock.dart';
// import '../../providers/newProvider.dart';
// import '../../widgets/CustomLoader.dart';
// import '../Login_process/enter_phone_number.dart';
// class WebViewPage extends StatefulWidget {
//   final String url;
//   final String token;
//   final bool? isTab;
//   const WebViewPage({Key? key,required this.url,this.isTab,required this.token}) : super(key: key);
//
//
//
//   @override
//   State<WebViewPage> createState() => _WebViewPageState();
// }
//
// class _WebViewPageState extends State<WebViewPage> {
//    late WebViewController commonController;
//    // late WebViewController controller;
//    bool load=false;
//   WebViewCookieManager cookieManager = WebViewCookieManager();
//
//
//
//   Future<void> _onSetCookie() async {
//     await cookieManager.setCookie(
//        WebViewCookie(
//         name: 'web_app',
//         value: '${await Provider.of<GlobalModal>(context, listen: false).userData!.token}',
//         domain: 'app.swipebox.in',
//         path: '/',
// ///eyJpdiI6Ik1iNFZCRjZxeUdDMEUzRm9jUFdJNnc9PSIsInZhbHVlIjoibTZOVFMvZWZBMzdvbnBVM0k0YVFiMDNlNnN4U3lta0JXZG42RHlScy9tRkErOUY0bDdMbWNzNWpJMzdhclIvaWRDOHhhaGJndTVKZ1B0a0NxQjVZWnFyemlydm1BcG1iMk5EMjQxbTRUU3h0SC9WNU1pYlBKaGk1Kzh5QlRIa1oiLCJtYWMiOiIwZWQ3ZmJmZjk2NjZhNjI1MDgzOTA0ZjAyMWUxZDc2M2ZiOTAzZWNhYmU4MjliZTFkNjQwZWM5ZjgyMTBjNWIzIiwidGFnIjoiIn0%3D
//       ),
//     );
//     print('cookies----------------${cookieManager}');
//     // await webViewController.loadRequest(Uri.parse(
//     //   'https://httpbin.org/anything',
//     // ));
//   }
//   String token='';
//   // String mainUrl='';
//   // String redirectUrl='';
//
//    getToken()async{
//
//     token=await Provider.of<GlobalModal>(context, listen: false).userData!.token;
//    }
//    Hide()async{
//      try{
//        print('try ---Hide-----------');
//
//        await Provider.of<GlobalModal>(context, listen: false).loadingHide();
//      }catch(err){
//        print('catch ---Hide--------${err}---');
//
//        await Future.delayed(Duration(milliseconds: 200));
//        Hide();
//      }
//    }
//    show()async{
//      try{
//        print('try ---show-----------');
//         Provider.of<GlobalModal>(context, listen: false).load=true;
//      }catch(err){
//        print('try ---err----------${err}-');
//
//        // await Future.delayed(Duration(milliseconds: 200));
//        // show();
//      }
//    }
//   setdata()async{
//     print('id-------------------${await Provider.of<PermissionModal>(context, listen: false).dashboardMenuPermission['id']}');
//     await _onSetCookie();
//     await commonController.loadRequest(Uri.parse(
//         widget.url
//         ));
// print('widget.urlwidget.url---------------${widget.url}');
//   }
//   bool isBack=true;
//    cleardata()async{
//      await commonController.clearCache();
//      await commonController.clearLocalStorage();
//      final bool hadCookies = await cookieManager.clearCookies();
//
//    }
//    @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }
//
//   @override
//   void initState() {
//
//     print('hjelddfldgfgfdgfg');
//     mainUrl=widget.url;
//     getToken();
//     // TODO: implement initState
//     if(isConnected){
//
//     }
//
//     cookieManager.setCookie(
//       WebViewCookie(
//         name: 'web_app',
//         value: '${widget.token}',
//         domain: 'app.swipebox.in',
//         path: '/staff/openweb',
//         ///eyJpdiI6Ik1iNFZCRjZxeUdDMEUzRm9jUFdJNnc9PSIsInZhbHVlIjoibTZOVFMvZWZBMzdvbnBVM0k0YVFiMDNlNnN4U3lta0JXZG42RHlScy9tRkErOUY0bDdMbWNzNWpJMzdhclIvaWRDOHhhaGJndTVKZ1B0a0NxQjVZWnFyemlydm1BcG1iMk5EMjQxbTRUU3h0SC9WNU1pYlBKaGk1Kzh5QlRIa1oiLCJtYWMiOiIwZWQ3ZmJmZjk2NjZhNjI1MDgzOTA0ZjAyMWUxZDc2M2ZiOTAzZWNhYmU4MjliZTFkNjQwZWM5ZjgyMTBjNWIzIiwidGFnIjoiIn0%3D
//       ),
//     );
//     print('url---------------${widget.url}');
//     if(widget.isTab!=null){
//       print('isTab---------------${widget.isTab}');
//
//       isBack=false;
//     }
//     late final PlatformWebViewControllerCreationParams params;
//     if (WebViewPlatform.instance is WebKitWebViewPlatform) {
//       params = WebKitWebViewControllerCreationParams(
//         allowsInlineMediaPlayback: true,
//         mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
//
//       );
//     } else {
//       params = const PlatformWebViewControllerCreationParams();
//     }
//
//     final WebViewController controller =
//     WebViewController.fromPlatformCreationParams(params);
//     // #enddocregion platform_features
//
//     // controller.
//
//     commonController =  controller
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       // ..clearLocalStorage()
//
//
//       ..clearCache()
//
//       ..setNavigationDelegate(
//         NavigationDelegate(
//
//           onProgress: (int progress) {
//
//           },
//           onPageStarted: (String url) {
//             print('urlllllll--------------${widget.url}');
//
//           },
//           onPageFinished: (String url) {
//             getCookies('cookies after finished');
//
//             // debugPrint('Page finished loading: $url');
//           },
//           onWebResourceError: (WebResourceError error) {
//             debugPrint('''
//             Page resource error:
//             code: ${error.errorCode}
//             description: ${error.description}
//             errorType: ${error.errorType}
//             isForMainFrame: ${error.isForMainFrame}
//           ''');
//           },
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               debugPrint('blocking navigation to ${request.url}');
//               return NavigationDecision.prevent;
//             }
//             debugPrint('allowing navigation to ${request.url}');
//             return NavigationDecision.navigate;
//           },
//         ),
//
//       )
//       ..addJavaScriptChannel(
//         'Toaster',
//         onMessageReceived: (JavaScriptMessage message) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(message.message)),
//           );
//         },
//       )
//
//       ..loadRequest(Uri.parse(myCookies==null?requestUrl:mainUrl));//https://app.swipebox.in/staff/openweb?redirect_url=
//
//
//     // #docregion platform_features
//     if (controller.platform is AndroidWebViewController) {
//       AndroidWebViewController.enableDebugging(true);
//       (controller.platform as AndroidWebViewController)
//           .setMediaPlaybackRequiresUserGesture(false);
//     }
//     getCookies('cookies after initialization');
//     super.initState();
//      // setdata();
//     // #docregion platform_features
//
//   }
//    getCookies(msg)async{
//     var cookies = await commonController.runJavaScriptReturningResult(
//       'document.cookie',
//     );
//     print("${msg}----${cookies}");
//   }
//    var scaffoldKey = GlobalKey<ScaffoldState>();
//
//    @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//
//       appBar: appBar(
//           context: context,
//           title: '${Provider.of<PermissionModal>(context, listen: true).dashboardMenuPermission['company_name']??'${Provider.of<GlobalModal>(context, listen: false).userData!.companyName}'}',
//           titleColor:Colors.black,
//           implyLeading:isBack?true:false,
//           titlecenter: false,
//
//           leading:isBack?Container():GestureDetector(
//             onTap: ()async{
//               scaffoldKey.currentState?.openDrawer();
//             },
//             child: Icon(
//               Icons.menu,
//               color: Colors.black,
//             ),
//           ),
//           appBarColor: MyColors.white,
//           // titleColor: Colors.white,
//          ),
//       // AppBar(title: const Text('Flutter Simple Example'),actions: [
//       //   GestureDetector(
//       //     onTap:()async{
//       //       var cookies = await _controller.runJavaScriptReturningResult(
//       //         'document.cookie',
//       //       );
//       //       print(cookies);
//       //       await _controller.runJavaScriptReturningResult(
//       //         'document.cookie = "laravel_session; expires=2023-01-03T09:58:59.411Z; domain=app.swipebox.in; path=/; value=eyJpdiI6Ik1iNFZCRjZxeUdDMEUzRm9jUFdJNnc9PSIsInZhbHVlIjoibTZOVFMvZWZBMzdvbnBVM0k0YVFiMDNlNnN4U3lta0JXZG42RHlScy9tRkErOUY0bDdMbWNzNWpJMzdhclIvaWRDOHhhaGJndTVKZ1B0a0NxQjVZWnFyemlydm1BcG1iMk5EMjQxbTRUU3h0SC9WNU1pYlBKaGk1Kzh5QlRIa1oiLCJtYWMiOiIwZWQ3ZmJmZjk2NjZhNjI1MDgzOTA0ZjAyMWUxZDc2M2ZiOTAzZWNhYmU4MjliZTFkNjQwZWM5ZjgyMTBjNWIzIiwidGFnIjoiIn0%3D"',
//       //       );
//       //       // name: 'laravel_session',
//       //       // value: 'eyJpdiI6Ik1iNFZCRjZxeUdDMEUzRm9jUFdJNnc9PSIsInZhbHVlIjoibTZOVFMvZWZBMzdvbnBVM0k0YVFiMDNlNnN4U3lta0JXZG42RHlScy9tRkErOUY0bDdMbWNzNWpJMzdhclIvaWRDOHhhaGJndTVKZ1B0a0NxQjVZWnFyemlydm1BcG1iMk5EMjQxbTRUU3h0SC9WNU1pYlBKaGk1Kzh5QlRIa1oiLCJtYWMiOiIwZWQ3ZmJmZjk2NjZhNjI1MDgzOTA0ZjAyMWUxZDc2M2ZiOTAzZWNhYmU4MjliZTFkNjQwZWM5ZjgyMTBjNWIzIiwidGFnIjoiIn0%3D',
//       //       // domain: 'app.swipebox.in',
//       //       // path: '/',
//       //       cookies = await _controller.runJavaScriptReturningResult(
//       //         'document.cookie',
//       //       );
//       //       log("cookies---------------909\n${cookies}");
//       //     },
//       //       child: Icon(Icons.add))
//       // ],),
//       body: Stack(
//         children: [
//           WebViewWidget(
//             controller: commonController,
//
//
//
//           ),
//
//             // Consumer<GlobalModal>(
//             //   builder: (context, global, child) {
//             //     if(global.load)
//             //     return Positioned(child: CustomLoader());
//             //     return Container();
//             //   }
//             // )
//         ],
//       ),
//       // Consumer<GlobalModal>(
//       //   builder: (child,global,context) {
//       //     return
//       //   }
//       // ),
//         drawer: Drawer(
//             width: MediaQuery.of(context).size.width-100,
//
//             child: GestureDetector(
//                 onTap: (){
//                   Navigator.pop(context);
//
//                   showDialog(context: context, builder: (context1) {
//                     return AlertDialog(
//
//                       title: Text('Logout',),
//                       content: Text('Are you sure, want to logout?'),
//                       actions: [
//                         TextButton(
//                             onPressed: () async {
//                               await logout();
//                               // Navigator.of(context).pushReplacementNamed('/pre-login');
//                               Navigator.of(context).pushAndRemoveUntil(
//                                   MaterialPageRoute(builder: (context) =>
//                                       Enter_Phone_Number()), (
//                                   Route<dynamic> route) => false);
//                             }, child: Text('logout')),
//                         TextButton(onPressed: () async {
//                           Navigator.pop(context1);
//                         }, child: Text('cancel')
//                         ),
//                       ],
//                     );
//                   });
//                   // push(context: context, screen: Welcome_Page());
//
//                 },
//                 child: Column(
//                   children: [
//                     Container(
//                         height: 200,
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         child: Row(
//                           children: [
//                             Image.asset('assets/images/Vector (3).png',height: 30,width: 30,),
//                             hSizedBox,
//                             Text('Logout',style: TextStyle(fontSize: 16),),
//                           ],
//                         )),
//                   ],
//                 ))// Populate the Drawer in the next step.
//         )
//     );
//   }
// }
