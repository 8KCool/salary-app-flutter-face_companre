

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/pages/attendance/attendance_step1.dart';
import 'package:salaryredesign/pages/employee/employee_dshboard.dart';
import 'package:salaryredesign/pages/settings/settings_page.dart';

import '../constants/colors.dart';
import '../constants/image_urls.dart';
import '../providers/clock.dart';

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
  int _selectedIndex = 0;
  int _current = 0;
  int _pageIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      _pageIndex = index;
      print('_selectedIndex on change tab-----------$_selectedIndex');

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


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !await Navigator.maybePop(
            navigatorKeys[_pageIndex]!.currentState!.context);
      },
      child: Scaffold(
        body: Stack(
          children: [
            IndexedStack(
              index: _pageIndex,
              children: <Widget>[
                Employee_dashboard_Page(),
                CheckAttStatusPage(navigatorKey: navigatorKeys[1]!,),
                Settings_Page()
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
            // BottomNavigationBarItem(
            //   label: 'Profile',
            //   // activeIcon: Icon(Icons.home, size: 30,color: themecolor,),
            //   icon: ImageIcon(
            //     AssetImage(MyImages.profile_icon),
            //     color: MyColors.bottommenucolor,
            //     size: 24,
            //   ),
            //   activeIcon: Stack(
            //     children: <Widget>[
            //       // Icon(Icons.shopping_cart, size: 30, color: themecolor,),
            //       ImageIcon(
            //         AssetImage(MyImages.profile_icon),
            //         color: MyColors.primaryColor,
            //         size: 24,
            //       ),
            //     ],
            //   ),
            // ),
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
            onTap: (int index) {
              setState(
                    () {
                      onItemTapped(index);
                  // _pageIndex = index;
                },
              );
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
