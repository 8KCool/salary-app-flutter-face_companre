import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/pages/temp/settings_page.dart';
import '../../constants/colors.dart';
import '../../constants/globalFunction.dart';
import '../../constants/global_data.dart';
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
import '../temp/dashboard_page.dart';
import '../temp/my_account_page.dart';
import '../temp/other_web_view_page.dart';
import 'package:permission_handler/permission_handler.dart';

class NewTabScreen extends StatefulWidget {
  const NewTabScreen({Key? key}) : super(key: key);

  @override
  State<NewTabScreen> createState() => NewTabScreenState();
}

enum TabType { dashboard, myaccount, settings, defaultType }

// WebViewCookieManager cookieManager = WebViewCookieManager();
class NewTabScreenState extends State<NewTabScreen> {
  TabType selectedTab = TabType.myaccount;
  int selectIndex = 0;
  bool dashBoardloadStopped = false;
  bool load = false;
  int setting_open = 0;
  int account_open = 0;

  webViewInitialization() async {
    String? manishToken = Provider.of<GlobalModal>(
            MyGlobalKeys.navigatorKey.currentContext!,
            listen: false)
        .userData
        ?.token;
    print('the token mmmm is ${manishToken}');
    globalHeaders = {
      'Authorization': 'Bearer $manishToken',
      // 'Accept': 'application/json'
    };
    // if(isConnected)

    // await cookieManager.clearCookies();

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
    // ${ApiUrls.baseUrl}staff/openweb

    // dashboardController = await setManishController('${ApiUrls.siteBaseUrl}');
    // await Future.delayed(Duration(seconds: 2));
    // // optionViewController = await setManishController('${ApiUrls.siteBaseUrl}');
    // // dashboardController = await setManishController('${ApiUrls.baseUrl}staff/dashboard');
    // myAccountController = await setManishController('${ApiUrls.webBaseUrl}my_account');
    // await Future.delayed(Duration(seconds: 2));
    // settingController = await setManishController('${ApiUrls.webBaseUrl}setting');
    // setState((){
    //   load = false;
    // });
  }

  requestAllPermissions()async{
    try{
      print('${await Permission.camera.request()}');
      print('the media library request is .....${await Permission.mediaLibrary.request()}');
      print('the media library request is ${await Permission.manageExternalStorage.request()}');

      Permission.camera.request();
      Permission.mediaLibrary.request();
      Permission.manageExternalStorage.request();
      Permission.audio.request();
      Permission.videos.request();
      Permission.microphone.request();




    }catch(e){
      print('hello world');
    }
  }
  @override
  void initState() {
    // requestAllPermissions();
    webViewInitialization();
    super.initState();
  }

  int index = 0;

  checkInternet() async {
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

  backFunction() async {
    if (await dashBoardViewController!.canGoBack()) {
      await dashBoardViewController!.goBack();
      backFunction();
    } else if (await accountViewController!.canGoBack()) {
      await accountViewController!.goBack();
      backFunction();
    } else if (await settingViewController!.canGoBack()) {
      await settingViewController!.goBack();
      backFunction();
    } else {
      print('successfully removed state');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (index == 0) {
          // print("can go back2222");
          // if(dashBoardViewController!=null){
          //    if(await dashBoardViewController!.canGoBack()){
          //      await dashBoardViewController!.goBack();
          //    }
          //    else{
          //
          //      print("exit ");
          //    }
          // }
          return true;
        } else if (selectedTab == TabType.myaccount) {
          try {
            if (accountViewController != null) {
              if (await accountViewController!.canGoBack()) {
                await accountViewController!.goBack();
              }
            }
          } catch (e) {
            print('Error in catch block $e');
          }
          return false;
        } else if (selectedTab == TabType.settings) {
          try {
            if (settingViewController != null) {
              if (await settingViewController!.canGoBack()) {
                await settingViewController!.goBack();
              }
            }
          } catch (e) {
            print('Error in catch block $e');
          }
          return false;
        } else {
          return false;
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: appBar(
          context: context,
          title:
              '${Provider.of<PermissionModal>(context, listen: true).dashboardMenuPermission['company_name'] ?? '${Provider.of<GlobalModal>(context, listen: false).userData!.companyName}'}',
          titleColor: Colors.black,
          implyLeading: false,
          titlecenter: false,
          leading: GestureDetector(
            onTap: () async {
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
            width: MediaQuery.of(context).size.width - 100,
            child: Column(
              children: [
                vSizedBox6,
                GestureDetector(
                  onTap: () {

                    Navigator.pop(context);
                    push(context: context, screen: OtherWebViewPage(url: 'https://swipebox.in/about.html',));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Image.asset(MyImages.aboutIcon),
                        hSizedBox,
                        Text(
                          'About Us',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                vSizedBox2,
                GestureDetector(
                  onTap: () {

                    Navigator.pop(context);
                    push(context: context, screen: OtherWebViewPage(url: 'https://swipebox.in/privacy-policy.html',));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                       Image.asset(MyImages.termsIcon),
                        hSizedBox,
                        Text(
                          'Privacy Policy',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                vSizedBox2,
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    push(context: context, screen: OtherWebViewPage(url: 'https://swipebox.in/terms-and-conditions.html',));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Image.asset(MyImages.termsIcon),
                        hSizedBox,
                        Text(
                          'Terms and Conditions',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                vSizedBox2,
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);

                      showDialog(
                          context: context,
                          builder: (context1) {
                            return AlertDialog(
                              title: Text(
                                'Logout',
                              ),
                              content: Text('Are you sure, want to logout?'),
                              actions: [
                                TextButton(
                                    onPressed: () async {
                                      await logout();
                                      // Navigator.of(context).pushReplacementNamed('/pre-login');
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Enter_Phone_Number()),
                                          (Route<dynamic> route) => false);
                                    },
                                    child: Text('logout')),
                                TextButton(
                                    onPressed: () async {
                                      Navigator.pop(context1);
                                    },
                                    child: Text('cancel')),
                              ],
                            );
                          });
                      // push(context: context, screen: Welcome_Page());
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/Vector (3).png',
                              height: 30,
                              width: 30,
                            ),
                            hSizedBox,
                            Text(
                              'Logout',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ))),
              ],
            ) // Populate the Drawer in the next step.
            ),
        body: load
            ? CustomLoader()
            : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // if(load)
                  Expanded(
                    // child: getTab(selectedTab),
                    child: IndexedStack(
                      index: index,
                      children: <Widget>[
                        DashboardPageNew(
                            key: MyGlobalKeys.dashboardPageNewState,
                            loadStop: (a, b) {
                              print("load stop-----");
                              print(b);
                              dashBoardloadStopped = true;
                              setState(() {});
                            }),
                        if (Provider.of<GlobalModal>(context, listen: false)
                                .userData!
                                .userId !=
                            1)
                          CheckAttStatusPage(),
                        if (dashBoardloadStopped == true) MyAccountPage(),
                        if (dashBoardloadStopped == true) SettingsPage(),
                      ],
                    ),
                  ),
                  Container(
                    height: 68,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () async {
                            selectIndex = 0;
                            index = 0;
                            MyGlobalKeys.dashboardPageNewState.currentState!.isWeb.value = false;
                            await backFunction();
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
                                AssetImage(MyImages.home_icon),
                                color: selectIndex == 0
                                    ? MyColors.primaryColor
                                    : MyColors.bottommenucolor,
                                size: 23,
                              ),
                              Text(
                                'Dashboard',
                                style: TextStyle(
                                    color: selectIndex == 0
                                        ? MyColors.primaryColor
                                        : MyColors.bottommenucolor,
                                    fontSize: 11),
                              )
                            ],
                          ),
                        ),
                        if (Provider.of<GlobalModal>(context, listen: false)
                                .userData!
                                .userId !=
                            1)
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () async {
                              selectIndex = 1;
                              await backFunction();
                              index = Provider.of<GlobalModal>(context,
                                              listen: false)
                                          .userData!
                                          .userId !=
                                      1
                                  ? 1
                                  : 0;
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
                                  color: selectIndex == 1
                                      ? MyColors.primaryColor
                                      : MyColors.bottommenucolor,
                                  size: 23,
                                ),
                                Text(
                                  'Mark Attendance',
                                  style: TextStyle(
                                      color: selectIndex == 1
                                          ? MyColors.primaryColor
                                          : MyColors.bottommenucolor,
                                      fontSize: 11),
                                )
                              ],
                            ),
                          ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () async {
                            await backFunction();
                            index =
                                Provider.of<GlobalModal>(context, listen: false)
                                            .userData!
                                            .userId !=
                                        1
                                    ? 2
                                    : 1;
                            selectIndex = 2;
                            print(
                                'going to the my account from ${selectedTab}');

                            setState(() {
                              selectedTab = TabType.myaccount;
                            });

                            // if(account_open==0){
                            //   if(settingViewController!=null)
                            //   settingViewController!.loadUrl(urlRequest: URLRequest(url:Uri.parse('${ApiUrls.webBaseUrl}setting')));
                            //   account_open=1;
                            // }

                            print('In to the dashboard ${selectedTab}');

                            // myAccountController.loadRequest(Uri.parse('${ApiUrls.baseUrl}staff/attendance-detail'));
                          },
                          child: Column(
                            children: [
                              ImageIcon(
                                AssetImage(MyImages.profile_icon),
                                color: selectIndex == 2
                                    ? MyColors.primaryColor
                                    : MyColors.bottommenucolor,
                                size: 23,
                              ),
                              Text(
                                'My Account',
                                style: TextStyle(
                                    color: selectIndex == 2
                                        ? MyColors.primaryColor
                                        : MyColors.bottommenucolor,
                                    fontSize: 11),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () async {
                            index =
                                Provider.of<GlobalModal>(context, listen: false)
                                            .userData!
                                            .userId !=
                                        1
                                    ? 3
                                    : 2;
                            selectIndex = 3;
                            print('going to the settings from ${selectedTab}');
                            setState(() {
                              selectedTab = TabType.settings;
                            });
                            //                   if(setting_open==0){
                            // if(accountViewController!=null)
                            // accountViewController!.loadUrl(urlRequest: URLRequest(url:Uri.parse('${ApiUrls.webBaseUrl}my_account')));
                            // setting_open=1;
                            // }

                            print('infowider settings from ${selectedTab}');
                            // myAccountController.loadRequest(Uri.parse('${ApiUrls.baseUrl}staff/salaryprocess'));
                          },
                          child: Column(
                            children: [
                              ImageIcon(
                                AssetImage(MyImages.setting_icon),
                                color: selectIndex == 3
                                    ? MyColors.primaryColor
                                    : MyColors.bottommenucolor,
                                size: 23,
                              ),
                              Text(
                                'Setting',
                                style: TextStyle(
                                    color: selectIndex == 3
                                        ? MyColors.primaryColor
                                        : MyColors.bottommenucolor,
                                    fontSize: 11),
                              )
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
