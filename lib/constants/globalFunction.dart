import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/globalkeys.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/Login_process/enter_phone_number.dart';
import 'package:salaryredesign/services/api_urls.dart';
import 'package:salaryredesign/services/auth.dart';
import 'package:salaryredesign/services/local_services.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/showSnackbar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../../constants/colors.dart';
import '../../constants/globalFunction.dart';
import '../../constants/sized_box.dart';
import '../../providers/clock.dart';
import '../../providers/newProvider.dart';
import '../../widgets/CustomLoader.dart';

String message='';
bool isConnected=false;
checkInternet(BuildContext context)async{
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
      isConnected=true;
      // getDashboard();
    }
  } on SocketException catch (_) {
    print('not connected');
    message='Check your internet connection';
    // showSnackbar(context, 'Check your internet connection');

    _showMyDialog(context);

  }
}
Future<void> _showMyDialog(BuildContext context) async {
  // await Future.delayed(Duration(seconds: 2));

  return showDialog<void>(
    context: context,
    // barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // title: const Text('Alert'),
        content: SingleChildScrollView(
          child: ListBody(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Image.asset(MyImages.cancel,width: 70,height: 70,),
              Icon(
                Icons.warning_amber_outlined,
                color: Colors.yellow,
                size: 80,
              ),
              vSizedBox2,
              Text(
                '${message.toString()}',
                textAlign: TextAlign.center,
              ),
              vSizedBox,

              TextButton(
                child: const Text('OK'),
                onPressed: () {

                  Navigator.of(context).pop();
                  checkInternet(context);
                  // push(context: context, screen: TabsPage());
                },
              ),
            ],
          ),
        ),
      );
    },
  );




}
// late WebViewController _controller;
// late WebViewController _controller1;
// late WebViewController _controller2;


String? myCookies;
// late  WebViewController myController;
late  WebViewController globalCommonController;
late  WebViewController globalSettingController;
late  WebViewController globalmyAccountController;
// late ;


Future<WebViewController> setManishController( String url  ) async{
  print('setWebWiewController() called');
  // print('token in global()---------------${usertoken}');
  // String requestUrl='${ApiUrls.siteBaseUrl}staff/openweb?redirect_url=${url}';
  // String requestUrl='https://app.swipebox.in/api/Webapp?redirect_url=${url}';
  String requestUrl='${url}';
  // WebViewCookieManager cookieManager = WebViewCookieManager();
  // String? manishToken = Provider.of<GlobalModal>(MyGlobalKeys.navigatorKey.currentContext!, listen: false).userData?.token;
  // print('the token mmmm is ${manishToken}');
  // if(isConnected)
  //
  //   await cookieManager.setCookie(
  //     WebViewCookie(
  //       name: 'web_app',
  //       value: '${manishToken??''}',
  //       domain: 'app.swipebox.in',
  //       path: '/',
  //       // path: '/staff/openweb',
  //       ///eyJpdiI6Ik1iNFZCRjZxeUdDMEUzRm9jUFdJNnc9PSIsInZhbHVlIjoibTZOVFMvZWZBMzdvbnBVM0k0YVFiMDNlNnN4U3lta0JXZG42RHlScy9tRkErOUY0bDdMbWNzNWpJMzdhclIvaWRDOHhhaGJndTVKZ1B0a0NxQjVZWnFyemlydm1BcG1iMk5EMjQxbTRUU3h0SC9WNU1pYlBKaGk1Kzh5QlRIa1oiLCJtYWMiOiIwZWQ3ZmJmZjk2NjZhNjI1MDgzOTA0ZjAyMWUxZDc2M2ZiOTAzZWNhYmU4MjliZTFkNjQwZWM5ZjgyMTBjNWIzIiwidGFnIjoiIn0%3D
  //     ),
  //   );
  // print('url---------------${widget.url}');
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
  // WebViewController myController =
  controller
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
  // ..clearLocalStorage()
  //
  //
  //   ..clearCache()



    ..setNavigationDelegate(
      NavigationDelegate(

        onProgress: (int progress) {
          if(progress==100){


          }
          // debugPrint('WebView is loading (progress : $progress%)');
        },
        onPageStarted: (String url) {
          // debugPrint('Page started loading: $url');

          // Provider.of<GlobalModal>(context, listen: false).loadingshow();
          // setState(() {
          //   load=true;
          // });
        },

        onPageFinished: (String url) {
          print('on page finished----manish $url');
          getCookies('cookies after finished',controller);


          // Hide();
          if(url=='https://app.swipebox.in/staff/login'){

          }

          // Provider.of<GlobalModal>(context, listen: false).loadingHide();
          // setState(() {
          //   load=false;
          // });
          // setdata();
          // debugPrint('Page finished loading: $url');
        },
        onWebResourceError: (WebResourceError error) {
          //   debugPrint('''
          //   Page resource error:
          //   code: ${error.errorCode}
          //   description: ${error.description}
          //   errorType: ${error.errorType}
          //   isForMainFrame: ${error.isForMainFrame}
          // ''');
        },
        onNavigationRequest: (NavigationRequest request) {
          // print('requested url is ${request.url}');
          // // if(request.url.contains(other))
          //
          // if(request.url.startsWith('https://app.swipebox.in/staff/login')){
          //   Navigator.popUntil(MyGlobalKeys.navigatorKey.currentContext!, (route) => route.isFirst);
          //   sharedPreference.clear();
          //   showSnackbar(MyGlobalKeys.navigatorKey.currentContext!, 'Session Expired');
          //   pushReplacement(context: MyGlobalKeys.navigatorKey.currentContext!, screen: Enter_Phone_Number());
          //   return NavigationDecision.prevent;
          // }
          if (request.url.startsWith('https://www.youtube.com/')) {
            // debugPrint('blocking navigation to ${request.url}');
            return NavigationDecision.prevent;
          }
          // debugPrint('allowing navigation to ${request.url}');
          return NavigationDecision.navigate;
        },
      ),

    )
    ..addJavaScriptChannel(
      'Toaster',
      onMessageReceived: (JavaScriptMessage message) {
        print('the on message received is called');
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text(message.message)),
        // );
      },
    );
  // ..loadRequest(Uri.parse(myCookies==null?requestUrl:url))


  log('the headddddddddddddd https://app.swipebox.in/api/getUser and ${globalHeaders}');
  log('the headddddddddddddd $requestUrl : url} and ${globalHeaders}');
  // await controller.loadRequest(Uri.parse('https://app.swipebox.in/api/Webapp'), headers: globalHeaders,method: LoadRequestMethod.get,);
  await controller.loadRequest(Uri.parse(requestUrl,), headers: globalHeaders,method: LoadRequestMethod.get,);
  //https://app.swipebox.in/staff/openweb?redirect_url=
    // ..loadRequest(Uri.parse(url));//https://app.swipebox.in/staff/openweb?redirect_url=


  // #docregion platform_features
  if (controller.platform is AndroidWebViewController) {
    AndroidWebViewController.enableDebugging(true);
    (controller.platform as AndroidWebViewController)
        .setMediaPlaybackRequiresUserGesture(false);
  }
  getCookies('cookies after initialization in m controller ${controller}', controller);
  return controller;
}
///
// Future setWebWiewController( String url  ) async{
//   print('setWebWiewController() called');
//
//
//   // Provider.of(context).
//   String? manishToken = Provider.of<GlobalModal>(MyGlobalKeys.navigatorKey.currentContext!, listen: false).userData?.token;
//
//   print('the token is $manishToken');
//   String requestUrl='${ApiUrls.siteBaseUrl}staff/openweb?redirect_url=${url}';
//   WebViewCookieManager cookieManager = WebViewCookieManager();
//
//
//   if(isConnected)
//
//   await cookieManager.setCookie(
//     WebViewCookie(
//       name: 'web_app',
//       value: '${manishToken??''}',
//       domain: 'app.swipebox.in',
//       path: '/staff/openweb',
//       ///eyJpdiI6Ik1iNFZCRjZxeUdDMEUzRm9jUFdJNnc9PSIsInZhbHVlIjoibTZOVFMvZWZBMzdvbnBVM0k0YVFiMDNlNnN4U3lta0JXZG42RHlScy9tRkErOUY0bDdMbWNzNWpJMzdhclIvaWRDOHhhaGJndTVKZ1B0a0NxQjVZWnFyemlydm1BcG1iMk5EMjQxbTRUU3h0SC9WNU1pYlBKaGk1Kzh5QlRIa1oiLCJtYWMiOiIwZWQ3ZmJmZjk2NjZhNjI1MDgzOTA0ZjAyMWUxZDc2M2ZiOTAzZWNhYmU4MjliZTFkNjQwZWM5ZjgyMTBjNWIzIiwidGFnIjoiIn0%3D
//     ),
//   );
//   // print('url---------------${widget.url}');
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
//   WebViewController myController =  controller
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
//           if(progress==100){
//
//
//           }
//           // debugPrint('WebView is loading (progress : $progress%)');
//         },
//         onPageStarted: (String url) {
//           // debugPrint('Page started loading: $url');
//
//           // Provider.of<GlobalModal>(context, listen: false).loadingshow();
//           // setState(() {
//           //   load=true;
//           // });
//         },
//         onPageFinished: (String url) {
//           print('on page finished----manish $url');
//           getCookies('cookies after finished',controller);
//
//
//           // Hide();
//           if(url=='https://app.swipebox.in/staff/login'){
//
//           }
//
//           // Provider.of<GlobalModal>(context, listen: false).loadingHide();
//           // setState(() {
//           //   load=false;
//           // });
//           // setdata();
//           // debugPrint('Page finished loading: $url');
//         },
//         onWebResourceError: (WebResourceError error) {
//           //   debugPrint('''
//           //   Page resource error:
//           //   code: ${error.errorCode}
//           //   description: ${error.description}
//           //   errorType: ${error.errorType}
//           //   isForMainFrame: ${error.isForMainFrame}
//           // ''');
//         },
//         onNavigationRequest: (NavigationRequest request) {
//           print('requested url is ${request.url}');
//           // if(request.url.contains(other))
//
//           // if(request.url.startsWith('https://app.swipebox.in/staff/login')){
//           //   Navigator.popUntil(MyGlobalKeys.navigatorKey.currentContext!, (route) => route.isFirst);
//           //   sharedPreference.clear();
//           //   showSnackbar(MyGlobalKeys.navigatorKey.currentContext!, 'Session Expired');
//           //   pushReplacement(context: MyGlobalKeys.navigatorKey.currentContext!, screen: Enter_Phone_Number());
//           //   return NavigationDecision.prevent;
//           // }
//           if(request.url.startsWith('https://app.swipebox.in/staff/login')){
//             Navigator.popUntil(MyGlobalKeys.navigatorKey.currentContext!, (route) => route.isFirst);
//             sharedPreference.clear();
//             showSnackbar(MyGlobalKeys.navigatorKey.currentContext!, 'Session Expired');
//             pushReplacement(context: MyGlobalKeys.navigatorKey.currentContext!, screen: Enter_Phone_Number());
//             return NavigationDecision.prevent;
//           }
//           if (request.url.startsWith('https://www.youtube.com/')) {
//             // debugPrint('blocking navigation to ${request.url}');
//             return NavigationDecision.prevent;
//           }
//           // debugPrint('allowing navigation to ${request.url}');
//           return NavigationDecision.navigate;
//         },
//       ),
//
//     )
//     ..addJavaScriptChannel(
//       'Toaster',
//       onMessageReceived: (JavaScriptMessage message) {
//         print('the on message received is called');
//         // ScaffoldMessenger.of(context).showSnackBar(
//         //   SnackBar(content: Text(message.message)),
//         // );
//       },
//     )
//     ..loadRequest(Uri.parse(myCookies==null?requestUrl:url));//https://app.swipebox.in/staff/openweb?redirect_url=
//     // ..loadRequest(Uri.parse(url));
//
//
//   // #docregion platform_features
//   if (controller.platform is AndroidWebViewController) {
//     AndroidWebViewController.enableDebugging(true);
//     (controller.platform as AndroidWebViewController)
//         .setMediaPlaybackRequiresUserGesture(false);
//   }
//   getCookies('cookies after initialization', myController);
//   // return myController;
// }

///
// setWebWiewController1(BuildContext context, String url){
//   mainUrl=url;
//   requestUrl='${ApiUrls.siteBaseUrl}staff/openweb?redirect_url=${url}';
//   if(isConnected)
//
//     cookieManager.setCookie(
//       WebViewCookie(
//         name: 'web_app',
//         value: '${usertoken}',
//         domain: 'app.swipebox.in',
//         path: '/staff/openweb',
//         ///eyJpdiI6Ik1iNFZCRjZxeUdDMEUzRm9jUFdJNnc9PSIsInZhbHVlIjoibTZOVFMvZWZBMzdvbnBVM0k0YVFiMDNlNnN4U3lta0JXZG42RHlScy9tRkErOUY0bDdMbWNzNWpJMzdhclIvaWRDOHhhaGJndTVKZ1B0a0NxQjVZWnFyemlydm1BcG1iMk5EMjQxbTRUU3h0SC9WNU1pYlBKaGk1Kzh5QlRIa1oiLCJtYWMiOiIwZWQ3ZmJmZjk2NjZhNjI1MDgzOTA0ZjAyMWUxZDc2M2ZiOTAzZWNhYmU4MjliZTFkNjQwZWM5ZjgyMTBjNWIzIiwidGFnIjoiIn0%3D
//       ),
//     );
//   // print('url---------------${widget.url}');
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
//   _controller1 =  controller
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
//           if(progress==100){
//
//
//           }
//           // debugPrint('WebView is loading (progress : $progress%)');
//         },
//         onPageStarted: (String url) {
//           // debugPrint('Page started loading: $url');
//
//           // Provider.of<GlobalModal>(context, listen: false).loadingshow();
//           // setState(() {
//           //   load=true;
//           // });
//         },
//         onPageFinished: (String url) {
//           getCookies('cookies after finished');
//
//
//           // Hide();
//           if(url=='https://app.swipebox.in/staff/login'){
//
//           }
//
//           // Provider.of<GlobalModal>(context, listen: false).loadingHide();
//           // setState(() {
//           //   load=false;
//           // });
//           // setdata();
//           // debugPrint('Page finished loading: $url');
//         },
//         onWebResourceError: (WebResourceError error) {
//           //   debugPrint('''
//           //   Page resource error:
//           //   code: ${error.errorCode}
//           //   description: ${error.description}
//           //   errorType: ${error.errorType}
//           //   isForMainFrame: ${error.isForMainFrame}
//           // ''');
//         },
//         onNavigationRequest: (NavigationRequest request) {
//           if (request.url.startsWith('https://www.youtube.com/')) {
//             // debugPrint('blocking navigation to ${request.url}');
//             return NavigationDecision.prevent;
//           }
//           // debugPrint('allowing navigation to ${request.url}');
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
//     ..loadRequest(Uri.parse(myCookies==null?requestUrl:mainUrl));//https://app.swipebox.in/staff/openweb?redirect_url=
//
//
//   // #docregion platform_features
//   if (controller.platform is AndroidWebViewController) {
//     AndroidWebViewController.enableDebugging(true);
//     (controller.platform as AndroidWebViewController)
//         .setMediaPlaybackRequiresUserGesture(false);
//   }
//   getCookies('cookies after initialization');
// }


// setWebWiewController2(BuildContext context, String url){
//   mainUrl=url;
//   requestUrl='${ApiUrls.siteBaseUrl}staff/openweb?redirect_url=${url}';
//   if(isConnected)
//     print("user token ----------global -----------${usertoken}");
//
//     cookieManager.setCookie(
//       WebViewCookie(
//         name: 'web_app',
//         value: '${usertoken}',
//         domain: 'app.swipebox.in',
//         path: '/staff/openweb',
//         ///eyJpdiI6Ik1iNFZCRjZxeUdDMEUzRm9jUFdJNnc9PSIsInZhbHVlIjoibTZOVFMvZWZBMzdvbnBVM0k0YVFiMDNlNnN4U3lta0JXZG42RHlScy9tRkErOUY0bDdMbWNzNWpJMzdhclIvaWRDOHhhaGJndTVKZ1B0a0NxQjVZWnFyemlydm1BcG1iMk5EMjQxbTRUU3h0SC9WNU1pYlBKaGk1Kzh5QlRIa1oiLCJtYWMiOiIwZWQ3ZmJmZjk2NjZhNjI1MDgzOTA0ZjAyMWUxZDc2M2ZiOTAzZWNhYmU4MjliZTFkNjQwZWM5ZjgyMTBjNWIzIiwidGFnIjoiIn0%3D
//       ),
//     );
//   // print('url---------------${widget.url}');
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
//   _controller =  controller
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
//           if(progress==100){
//
//
//           }
//           // debugPrint('WebView is loading (progress : $progress%)');
//         },
//         onPageStarted: (String url) {
//           // debugPrint('Page started loading: $url');
//
//           // Provider.of<GlobalModal>(context, listen: false).loadingshow();
//           // setState(() {
//           //   load=true;
//           // });
//         },
//         onPageFinished: (String url) {
//           getCookies('cookies after finished');
//
//
//           // Hide();
//           if(url=='https://app.swipebox.in/staff/login'){
//
//           }
//
//           // Provider.of<GlobalModal>(context, listen: false).loadingHide();
//           // setState(() {
//           //   load=false;
//           // });
//           // setdata();
//           // debugPrint('Page finished loading: $url');
//         },
//         onWebResourceError: (WebResourceError error) {
//           //   debugPrint('''
//           //   Page resource error:
//           //   code: ${error.errorCode}
//           //   description: ${error.description}
//           //   errorType: ${error.errorType}
//           //   isForMainFrame: ${error.isForMainFrame}
//           // ''');
//         },
//         onNavigationRequest: (NavigationRequest request) {
//           if (request.url.startsWith('https://www.youtube.com/')) {
//             // debugPrint('blocking navigation to ${request.url}');
//             return NavigationDecision.prevent;
//           }
//           // debugPrint('allowing navigation to ${request.url}');
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
//     ..loadRequest(Uri.parse(myCookies==null?requestUrl:mainUrl));//https://app.swipebox.in/staff/openweb?redirect_url=
//
//
//   // #docregion platform_features
//   if (controller.platform is AndroidWebViewController) {
//     AndroidWebViewController.enableDebugging(true);
//     (controller.platform as AndroidWebViewController)
//         .setMediaPlaybackRequiresUserGesture(false);
//   }
//   getCookies('cookies after initialization');
// }


getCookies(msg, WebViewController controller)async{
  var cookies = await controller.runJavaScriptReturningResult(
    'document.cookie',
  );
  if(cookies==null){
    print('the cookies are null 1111 $cookies');
  }else{
    print('the cookies are null 1112 ${cookies.runtimeType}');
  }

  if(cookies.toString()!='null'){
    myCookies=cookies.toString();
  }
  if(myCookies!=null){
    print('the cookie is $myCookies');
    try{
      // MyGlobalKeys.manishHomePageKey.currentState!.myAccountController.runJavaScriptReturningResult
    }catch(e){
      print('Error in catch block 747 $e');
    }
  }


  print("${msg}--abcdefgh--${cookies}");
}