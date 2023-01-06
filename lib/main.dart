import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/globalkeys.dart';
import 'package:salaryredesign/pages/employee/my_profile.dart';
import 'package:salaryredesign/pages/employer_settings_page.dart';
import 'package:salaryredesign/pages/monthly_wise_employee.dart';
import 'package:salaryredesign/pages/process_salary.dart';
import 'package:salaryredesign/pages/settings/leave_setting.dart';
import 'package:salaryredesign/pages/settings/policies.dart';
import 'package:salaryredesign/pages/settings/settings_page.dart';
import 'package:salaryredesign/pages/settings/weekoff_management.dart';
import 'package:salaryredesign/pages/splash.dart';
import 'package:salaryredesign/pages/tab_pages/bottom_tab.dart';
import 'package:salaryredesign/pages/temp/tab_page_man.dart';
import 'package:salaryredesign/pages/view_salary_detail.dart';
import 'package:salaryredesign/pages/weekly_wise_employee.dart';
import 'package:salaryredesign/pages/welcome.dart';
import 'package:salaryredesign/providers/attendanceCalendar.dart';
import 'package:salaryredesign/providers/clock.dart';
import 'package:salaryredesign/providers/newProvider.dart';
import 'package:salaryredesign/services/local_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:camera/camera.dart';
List<CameraDescription> cameras = <CameraDescription>[];
// List<CameraDescription> frontCamera = <CameraDescription>[];
CameraDescription? frontCamera ;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();

    for (int i=0;i<cameras.length;i++){
      if(cameras[i].lensDirection==CameraLensDirection.front){
        frontCamera=cameras[i];
      }
    }
    print('cameras------------$cameras');
  } on CameraException catch (e) {
    print('------------$e');
    // _logError(e.code, e.description);
  }
  sharedPreference = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GlobalModal(),),
        ChangeNotifierProvider(
          create: (context) => PermissionModal(),),
        ChangeNotifierProvider(
          create: (context) => AttendanceCalendarModal(),),
      ],
      child: const MyApp(),

    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SWIPEBOX',
      debugShowCheckedModeBanner: false,
      navigatorKey: MyGlobalKeys.navigatorKey,
      theme: ThemeData(
        fontFamily: 'regular',
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
      home: SplashScreen()
      // home: ManishHomePage()
      // home: TabsPage()
    );
  }
}


