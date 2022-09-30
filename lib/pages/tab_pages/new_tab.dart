import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:salaryredesign/pages/mark_attendance/mark_attendance.dart';
import 'package:salaryredesign/pages/my_profile.dart';
import 'package:salaryredesign/pages/tab_pages/dashboard.dart';
import '../../constants/colors.dart';
import '../../constants/image_urls.dart';
import '../../providers/clock.dart';
import '../settings/settings_page.dart';

/// This is the stateful widget that the main application instantiates.
class newTabsPage extends StatefulWidget {
  static const String id="new_tab";
  const newTabsPage({Key? key}) : super(key: key);

  @override
  State<newTabsPage> createState() => _newTabsPageState();
}

/// This is the private State class that goes with TabsPage.
class _newTabsPageState extends State<newTabsPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold
  );
  static List<Widget> _widgetOptions = <Widget>[
    MyPorfile_Page(),
    Mark_Attendance_Page(),
    MyPorfile_Page(),
    Settings_Page(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }
  getLocation() async {
    await Provider.of<GlobalModal>(context, listen: false).getLocation();
    await Provider.of<GlobalModal>(context, listen: false)
        .getDepartment(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: MyColors.primaryColor,
          // boxShadow: [
          //   boxShadowtop
          // ]
        ),
        // height: 60,
        child: BottomNavigationBar(
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
              label: 'Profile',
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
          currentIndex: _selectedIndex,
          selectedItemColor: MyColors.primaryColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
