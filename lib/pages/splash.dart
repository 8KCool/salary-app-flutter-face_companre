import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/constans.dart';
import 'package:salaryredesign/constants/globalkeys.dart';
import 'package:salaryredesign/pages/webviewPages/new_web_view_tab.dart';

import 'package:salaryredesign/pages/welcome.dart';
import 'package:salaryredesign/widgets/showSnackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../constants/colors.dart';

import '../constants/globalFunction.dart';
import '../functions/navigation_functions.dart';
import '../modals/userData.dart';
import '../providers/clock.dart';
import '../providers/newProvider.dart';
import '../services/api_urls.dart';
import '../services/auth.dart';
import '../services/webservices.dart';
import 'Login_process/enter_phone_number.dart';

import 'dart:convert' as convert;

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
  Future<bool> getDashboard()async{


   try{
     var res = await Webservices.getData(ApiUrls.getNewProfile,context);
     log('res from new api ------1-----${res.body}');


     var jsonResponse = convert.jsonDecode(res.body);
     if(jsonResponse['status'].toString()!='0'){
       log('res from new api -------2----${jsonResponse['data']}');
       Provider.of<PermissionModal>(context, listen: false).getPermission(jsonResponse['data']);
       return true;
       // Provider.of<PermissionModal>(context, listen: false).load=false;
     }
     else{

       Provider.of<PermissionModal>(context, listen: false).load=false;
       // showSnackbar(context, 'Check your internet connection');
     }
   }catch(e){
     print('Error in catch block 4354 $e');
   }
   return false;

  }
  test()async{
    // await logout();
    // print("provider---------------"+Provider.of<GlobalModal>(context, listen: false).userData.toString());
    // print("provider---------------"+Provider.of<GlobalModal>(context, listen: false).userData.toString());
    try{
      Future.delayed(Duration(seconds: 2)).then((value) async {
        try{
          await Provider.of<GlobalModal>(context, listen: false).getLocation();

        }catch(err){
          print('err from location ---------------$err');
          showSnackbar(context, err.toString());
        }
        SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
        log('token from session ----${sharedPreferences.getString('userData')}');

        if (sharedPreferences.getString('userData') != null) {
          Map userMap = jsonDecode(sharedPreferences.getString('userData')!);
          // showSnackbar(context, 'userMap ${userMap}');
          log('token from session -----${userMap}');


          Map<String,dynamic>data={};
          Provider.of<GlobalModal>(context, listen: false).userData = UserModal.fromJson(userMap);

          // globalCount++;
          // if(user!=null){
          var res = await Webservices.postData(apiUrl: ApiUrls.getUser, body: data, context: context);
          // showSnackbar(context, 'res from postdata api${res}');
          print('I am the response ---manish  ${res}');
          globalHeaders={'Authorization': 'Bearer ${await Provider.of<GlobalModal>(context, listen: false).userData!.token}',};
          log('global header assign by ankita in splash screen-------------------$globalHeaders');

          // if(res['status'].toString()=='true'){
          await Provider.of<GlobalModal>(context, listen: false).addUserDetail(userMap,context);
          bool dashResult = await getDashboard();
          if(dashResult){
            log('dkljslfkj--------${userMap['client_emp'].toString()}');
            // if(userMap['client_emp'].toString()=='null'){








            // showSnackbar(context, 'userMap  client_emp ${userMap['client_emp'].toString()}');
            //
            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            //     TabsPage()), (Route<dynamic> route) => false);
            usertoken='${await Provider.of<GlobalModal>(context, listen: false).userData!.token}';
            print('call-------1---setWebWiewController ${usertoken}');
            // globalCommonController = await setWebWiewController('${ApiUrls.siteBaseUrl}staff/dashboard');
            // globalSettingController = await setWebWiewController('${ApiUrls.siteBaseUrl}staff/dashboard',);
            // globalmyAccountController = await setWebWiewController('${ApiUrls.siteBaseUrl}staff/dashboard');
            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            //     Tabbarscreen(key:MyGlobalKeys.tabbarKey,)), (Route<dynamic> route) => false);



            ///
            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            //         HomePage()), (Route<dynamic> route) => false);
            ///
            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            //     ManishHomePage()), (Route<dynamic> route) => false);
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                NewTabScreen()), (Route<dynamic> route) => false);
            ///
            // await setWebWiewController('${ApiUrls.siteBaseUrl}staff/dashboard');
            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            //     Tabbarscreen(key:MyGlobalKeys.tabbarKey,)), (Route<dynamic> route) => false);
            ///
            // }
            // else{
            //   // showSnackbar(context, 'login as a company owner');
            //   usertoken='${await Provider.of<GlobalModal>(context, listen: false).userData!.token}';
            //   print('call-------2---setWebWiewController');
            //
            //   await setWebWiewController(context,'${ApiUrls.siteBaseUrl}staff/dashboard',globalSettingController);
            //   await setWebWiewController(context,'${ApiUrls.siteBaseUrl}staff/dashboard',globalmyAccountController);
            //
            //
            //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            //       Tabbarscreen(key:MyGlobalKeys.tabbarKey,)), (Route<dynamic> route) => false);
            // }
            // }
            // else{
            //   print('There is some error in logging in');
            //   sharedPreferences.clear();
            //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            //       Enter_Phone_Number()), (Route<dynamic> route) => false);
            // }


          }else{
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                Enter_Phone_Number()), (Route<dynamic> route) => false);
          }
        }
        else{
          // showSnackbar(context, 'new user');
          // push(context: context, screen: Enter_Phone_Number());
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              Enter_Phone_Number()), (Route<dynamic> route) => false);
          // String? isVisit =( await SharedPreferences.getInstance()).getString('is_visit');
          // print('isVisit------------------${isVisit}');
          // if(isVisit==null){
          //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          //       Welcome_Page()), (Route<dynamic> route) => false);
          // }
          // else{
          //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          //       Enter_Phone_Number()), (Route<dynamic> route) => false);
          // }


        }

      });
    }  catch(e){
      showSnackbar(context, e.toString());
    }
    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    //          Enter_Phone_Number()), (Route<dynamic> route) => false);
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
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: MyColors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(
                    0.0,
                    0.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                ),
              ]
          ),
          child: Image.asset(
            'assets/images/logo-new.png',
            width: MediaQuery.of(context).size.width - 300,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
