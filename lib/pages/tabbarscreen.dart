

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/pages/attendance/attendance_step1.dart';
import 'package:salaryredesign/pages/employee/employee_dshboard.dart';
import 'package:salaryredesign/pages/employee/my_profile.dart';
import 'package:salaryredesign/pages/settings/settings_page.dart';
import 'package:salaryredesign/pages/tab_pages/dashboard.dart';
import 'package:salaryredesign/pages/webviewPages/myAcoount_webview.dart';
import 'package:salaryredesign/pages/webviewPages/setting_webview.dart';
import 'package:salaryredesign/pages/webviewPages/webview.dart';

import '../constants/colors.dart';
import '../constants/globalkeys.dart';
import '../constants/globalFunction.dart';
import '../constants/image_urls.dart';
import '../constants/sized_box.dart';
import '../functions/navigation_functions.dart';
import '../providers/clock.dart';
import '../providers/newProvider.dart';
import '../services/api_urls.dart';
import '../services/auth.dart';
import '../widgets/appbar.dart';
import 'Login_process/enter_phone_number.dart';
import 'notificationPage.dart';

final tabbarKey = GlobalKey<TabbarscreenState>();

const double playerMinHeight = 70;
const double playerMaxHeight = 810;
const miniplayerPercentageDeclaration = 0.2;
ValueNotifier<double?> currentlyPlaying = ValueNotifier(null);
Map<int, GlobalKey> navigatorKeys = {
  0: GlobalKey(),
  1: GlobalKey(),
  2: GlobalKey(),
};
class Tabbarscreen extends StatefulWidget {

  Tabbarscreen({required Key key}) : super(key: key);

  @override
  State<Tabbarscreen> createState() => TabbarscreenState();
}

class TabbarscreenState extends State<Tabbarscreen> {



  // ValueNotifier<double> playerExpandProgress = ValueNotifier(70);


  // double percentage = 100;
  double playerMinHeight = 70;
  double playerMaxHeight = 810;
  double miniplayerPercentageDeclaration = 0.2;
  String url = 'https://www.saareymusic.com/admin/upload/thumbnail/1650931180m.png';
  // int _selectedIndex = 0;
  int _current = 0;
  int _pageIndex = 0;
  String token='';
  void onItemTapped(int index) {
    setState(() {
      _pageIndex = index;
      // print('_selectedIndex on change tab-----------$_selectedIndex');

    });
  }
  @override
  List home1 = [
    {
      "banner":
          "https:\/\/www.saareymusic.com\/admin\/upload\/thumbnail\/17652042071623647129m.png",
      "type": "playlist",
      "text": "Raags to help you sleep",
      "font_color": "#FFFFFF",
      "content_id": "126"
    },
    {
      "banner":
          "https:\/\/www.saareymusic.com\/admin\/upload\/thumbnail\/17652042071623647129m.png",
      "type": "playlist",
      "text": "Raags to help you sleep",
      "font_color": "#FFFFFF",
      "content_id": "126"
    }
  ];
  checkInternet()async{

    token= '${await Provider.of<GlobalModal>(context, listen: false).userData!.token}';
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
    }
  } on SocketException catch (_) {
    print('not connected');
  }
}
@override
  void initState() {
    // TODO: implement initState
checkInternet();

    super.initState();
  }


  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !await Navigator.maybePop(
            navigatorKeys[_pageIndex]!.currentState!.context);
      },
      child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF3F4F6),
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
        body: Stack(
          children: [
            IndexedStack(
              index: _pageIndex,
              children: <Widget>[
                // Dashboard_Page(),
                // Employee_dashboard_Page(),
                if( Provider.of<GlobalModal>(context,listen: false).userData!.userId!=1)
                CheckAttStatusPage(navigatorKey: navigatorKeys[1]!,),
                // MyPorfile_Page(),
                // WebViewPage(url:'${Provider.of<PermissionModal>(context, listen: false).dashboardMenuPermission['myaccounturl'].toString()}' ,
                //   token: '${usertoken}',
                //   isTab:false,
                // ),
                MyAccountWebViewPage(),
                SettingWebViewPage(),
                // WebViewPage(url:'${Provider.of<PermissionModal>(context, listen: false).dashboardMenuPermission['settingurl'].toString()}' ,
                //
                //   isTab:false,
                //   token: '${usertoken}',
                //
                // ),
                // Container(),
                // WebViewPage(url: Provider.of<PermissionModal>(context, listen: false).dashboardMenuPermission['settingurl'].toString(),
                //   isTab:false,)
                // Settings_Page()settingurl
                // Homescreen(navigatorKey: navigatorKeys[0]!,),
                // Favouritescreen(navigatorKey: navigatorKeys[1]!,),
                // Notificationscreen(navigatorKey: navigatorKeys[2]!,),
                // Rewardscreen(navigatorKey: navigatorKeys[3]!,),
                // Morescreen(navigatorKey: navigatorKeys[4]!,),
              ],
            ),

          ],
        ),
        bottomNavigationBar:BottomNavigationBar(
          backgroundColor: MyColors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          elevation: 0,

          unselectedFontSize: 12,
          selectedLabelStyle: TextStyle(fontFamily: 'medium'),
          unselectedLabelStyle: TextStyle(fontFamily: 'medium'),
          unselectedItemColor: MyColors.bottommenucolor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(MyImages.home_icon),
                color: MyColors.bottommenucolor,
                size: 24,
              ),
              activeIcon:ImageIcon(
                AssetImage(MyImages.home_icon),
                color: MyColors.primaryColor,
                size: 24,
              ),
              // activeIcon: Icon(Icons.home, size: 30,color: themecolor,),
              // icon: Icon(Icons.home, size: 30,color: Colors.black,),
              label: 'Dashboard',
            ),
            if( Provider.of<GlobalModal>(context,listen: false).userData!.userId!=1)
              BottomNavigationBarItem(
                label: 'Mark Attendance',
                // activeIcon: Icon(Icons.home, size: 30,color: themecolor,),
                icon: ImageIcon(
                  AssetImage(MyImages.fingerprint_icon),
                  color: MyColors.bottommenucolor,
                  size: 24,
                ),
                activeIcon: ImageIcon(
                  AssetImage(MyImages.fingerprint_icon),
                  color: MyColors.primaryColor,
                  size: 24,
                ),
              ),
            BottomNavigationBarItem(
              label: 'My Account',
              // activeIcon: Icon(Icons.home, size: 30,color: themecolor,),
              icon: ImageIcon(
                AssetImage(MyImages.profile_icon),
                color: MyColors.bottommenucolor,
                size: 24,
              ),
              activeIcon: Stack(
                children: <Widget>[
                  // Icon(Icons.shopping_cart, size: 30, color: themecolor,),
                  ImageIcon(
                    AssetImage(MyImages.profile_icon),
                    color: MyColors.primaryColor,
                    size: 24,
                  ),
                ],
              ),
            ),
            BottomNavigationBarItem(
              // icon: Icon(Icons.school, size: 30, color: Colors.black,),
              icon: ImageIcon(
                AssetImage(MyImages.setting_icon),
                color: MyColors.bottommenucolor,
                size: 24,
              ),
              activeIcon: ImageIcon(
                AssetImage(MyImages.setting_icon),
                color: MyColors.primaryColor,
                size: 24,
              ),
              label: 'Settings',
              backgroundColor: Colors.white,
            ),

          ],
          currentIndex: _pageIndex,
          selectedItemColor: MyColors.primaryColor,
            onTap: (int index)async {
              // if( Provider.of<GlobalModal>(context,listen: false).userData!.userId!=1){
              //   if(index==2){
              //     await setWebWiewController(context,Provider.of<PermissionModal>(context, listen: false).dashboardMenuPermission['myaccounturl'].toString(),globalmyAccountController);
              //   }
              //   else if (index==3){
              //     await setWebWiewController(context,Provider.of<PermissionModal>(context, listen: false).dashboardMenuPermission['settingurl'].toString(),globalSettingController);
              //   }
              // }
              // else{
              //   if(index==1){
              //     await setWebWiewController(context,Provider.of<PermissionModal>(context, listen: false).dashboardMenuPermission['myaccounturl'].toString(),globalmyAccountController);
              //   }
              //   else if (index==2){
              //     await setWebWiewController(context,Provider.of<PermissionModal>(context, listen: false).dashboardMenuPermission['settingurl'].toString(),globalSettingController);
              //   }
              // }
              onItemTapped(index);



              // _controller.loadRequest(Uri.parse(Provider.of<PermissionModal>(context, listen: false).dashboardMenuPermission['myaccounturl'].toString()));

              // _pageIndex = index;
              setState(() {},);
            },
        )
        // BottomNavigationBar(
        //   backgroundColor: MyColors.white,
        //   type: BottomNavigationBarType.fixed,
        //   showSelectedLabels: true,
        //   showUnselectedLabels: true,
        //   selectedFontSize: 10,
        //   elevation: 0,
        //   unselectedFontSize: 10,
        //   selectedLabelStyle: TextStyle(fontFamily: 'medium'),
        //   unselectedLabelStyle: TextStyle(fontFamily: 'medium'),
        //   unselectedItemColor: Color(0xff545454).withOpacity(0.40),
        //   items: <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: ImageIcon(
        //         AssetImage('assets/images/home.png'),
        //         color: MyColors.black,
        //         size: 20,
        //       ),
        //       // icon: Icon(Icons.),
        //       activeIcon: ImageIcon(
        //         AssetImage('assets/images/home-active.png'),
        //         color: MyColors.black,
        //         size: 20,
        //       ),
        //       label: '',
        //       backgroundColor: MyColors.primaryColor,
        //     ),
        //     BottomNavigationBarItem(
        //       label: '',
        //       icon: Stack(
        //         children: [
        //           ImageIcon(
        //             AssetImage('assets/images/mymusic.png'),
        //             color: MyColors.black,
        //             size: 20,
        //           ),
        //         ],
        //       ),
        //       activeIcon: Stack(
        //         children: <Widget>[
        //           ImageIcon(
        //             AssetImage('assets/images/mymusic-active.png'),
        //             color: MyColors.black,
        //             size: 20,
        //           ),
        //         ],
        //       ),
        //     ),
        //     BottomNavigationBarItem(
        //       label: '',
        //       icon: Stack(
        //         children: [
        //           Icon(
        //             Icons.notifications_none_sharp,
        //             color: MyColors.white,
        //           ),
        //         ],
        //       ),
        //       activeIcon: Stack(
        //         children: <Widget>[
        //           Icon(
        //             Icons.notifications,
        //             color: MyColors.black,
        //           ),
        //         ],
        //       ),
        //     ),
        //     BottomNavigationBarItem(
        //       label: '',
        //       icon: Stack(
        //         children: [
        //           ImageIcon(
        //             AssetImage('assets/images/giftt.png'),
        //             color: MyColors.black,
        //             size: 20,
        //           ),
        //         ],
        //       ),
        //       activeIcon: Stack(
        //         children: <Widget>[
        //           ImageIcon(
        //             AssetImage('assets/images/newgg.png'),
        //             color: MyColors.black,
        //             size: 20,
        //           ),
        //         ],
        //       ),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Padding(
        //         padding: const EdgeInsets.all(0),
        //         child: ImageIcon(
        //           AssetImage('assets/images/more.png'),
        //           color: MyColors.black,
        //           size: 20,
        //         ),
        //       ),
        //       activeIcon: Padding(
        //         padding: EdgeInsets.all(0),
        //         child: ImageIcon(
        //           AssetImage('assets/images/more-active.png'),
        //           color: MyColors.black,
        //           size: 20,
        //         ),
        //       ),
        //       label: '',
        //       backgroundColor: MyColors.primaryColor,
        //     ),
        //   ],
        //   currentIndex: _selectedIndex,
        //   selectedItemColor: MyColors.primaryColor,
        //   onTap: (int index) {
        //     setState(
        //           () {
        //         _pageIndex = index;
        //       },
        //     );
        //   },
        //   // onTap: _onItemTapped,
        // ),
      ),
    );
  }

  percentageFromValueInRange({required final double min, max, value}) {
    return (value - min) / (max - min);
  }
}
