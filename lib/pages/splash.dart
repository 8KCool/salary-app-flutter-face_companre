import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/globalkeys.dart';
import 'package:salaryredesign/pages/tab_pages/bottom_tab.dart';

import 'package:salaryredesign/pages/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../constants/colors.dart';

import '../functions/navigation_functions.dart';
import '../modals/userData.dart';
import '../providers/clock.dart';
import '../services/api_urls.dart';
import '../services/auth.dart';
import '../services/webservices.dart';


class SplashScreen extends StatefulWidget {
  static const id = 'splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  temp()async{
    print('1');
    String? userData =( await SharedPreferences.getInstance()).getString('user_details');
    print('2');
    print(userData);
  }

  @override
  void initState() {
    // TODO: implement initState
    // interval();
    super.initState();
    // temp();
    test();
    // checkStatus();



  }
  test()async{
    // await logout();
    // print("provider---------------"+Provider.of<GlobalModal>(context, listen: false).userData.toString());
    // print("provider---------------"+Provider.of<GlobalModal>(context, listen: false).userData.toString());

    Future.delayed(Duration(seconds: 2)).then((value) async {
      await Provider.of<GlobalModal>(context, listen: false).getLocation();
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      print(sharedPreferences.getString('userData'));
      if (sharedPreferences.getString('userData') != null) {
        Map userMap = jsonDecode(sharedPreferences.getString('userData')!);
        Map<String,dynamic>data={};
        UserModal? user = await Provider.of<GlobalModal>(context, listen: false).userData;

        // if(user!=null){
          var res = await Webservices.postData(apiUrl: ApiUrls.getUser, body: data, context: context);
          if(res['status'].toString()==true);
          await Provider.of<GlobalModal>(context, listen: false).addUserDetail(userMap,context);

          log('dkljslfkj--------${userMap['client_emp'].toString()}');
          if(userMap['client_emp'].toString()=='null'){

            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                TabsPage()), (Route<dynamic> route) => false);
          }
          else{
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                TabsPage()), (Route<dynamic> route) => false);
          }
        // }

        // else{
        //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        //       Welcome_Page()), (Route<dynamic> route) => false);
        // }


      }
      else{
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            Welcome_Page()), (Route<dynamic> route) => false);
      }

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if(timer!=null) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Center(
        child: Image.asset(
          'assets/images/splash-logo.png',
          width: MediaQuery.of(context).size.width - 120,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
