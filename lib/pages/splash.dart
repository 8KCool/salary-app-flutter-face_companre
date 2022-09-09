import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/pages/tab_pages/bottom_tab.dart';
import 'package:salaryredesign/pages/tab_pages/new_tab.dart';
import 'package:salaryredesign/pages/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../constants/colors.dart';

import '../functions/navigation_functions.dart';
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
    //await logout();
  // print("provider---------------"+Provider.of<GlobalModal>(context, listen: false).userData.toString());

  Future.delayed(Duration(seconds: 2)).then((value) async {
    SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    print(sharedPreferences.getString('userData'));
    if (sharedPreferences.getString('userData') != null) {
      Map userMap = jsonDecode(sharedPreferences.getString('userData')!);
      Map<String,dynamic>data={};

      // var res = await Webservices.postData(apiUrl: ApiUrls.getUser, body: data, context: context);
      // if(res['status'].toString()==true);
      await Provider.of<GlobalModal>(context, listen: false).addUserDetail(userMap,context);

      log('dkljslfkj--------${userMap['client_emp'].toString()}');
      if(userMap['client_emp'].toString()=='null'){

        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            TabsPage()), (Route<dynamic> route) => false);
      }
      else{
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            newTabsPage()), (Route<dynamic> route) => false);
      }


    }
    else{
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            Welcome_Page()), (Route<dynamic> route) => false);
    }

   // if(await Provider.of<GlobalModal>(context, listen: false).userData!=null){
   //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
   //       newTabsPage()), (Route<dynamic> route) => false);
   // }
   // else{
   //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
   //       Welcome_Page()), (Route<dynamic> route) => false);
   // }

    // push(context: context, screen: Welcome_Page());
  });
}
  // checkStatus()async{
  //
  //   if(await isUserLoggedIn()) {
  //     Map<String,dynamic> request={
  //       "user_id":await getCurrentUserId()
  //     };
  //     print("user_id"+request.toString());
  //     try{
  //
  //
  //
  //       timer =  Timer.periodic(Duration(seconds: 3), (timer) {
  //         Webservices.getMap(ApiUrls.interval,request:request).then((value)async{
  //           print('the status is ${value}');
  //
  //           updateUserDetails(value);
  //           // cres['']ount=
  //           if(value['email_verified'].toString()=='1'){
  //             if(value['user_type'].toString()=='1'){
  //               pushReplacement(context: context, screen: Sup_bottom_nav(key: MyGlobalKeys.tabBarKey2));
  //             } else {
  //               Navigator.pushNamedAndRemoveUntil(context, MyStatefulWidget.id, (route) => false);
  //             }
  //
  //             timer.cancel();
  //           }
  //           else if(value['email_verified'].toString()=='0'){
  //             print("000");
  //             pushReplacement(context: context, screen: PendingScreen());
  //           }
  //           else if(value['data']['email_verified'].toString()=='0'){
  //           }
  //         });
  //       });
  //     }catch(e){
  //       print('Error in catch block 237 $e');
  //       pushReplacement(context: context, screen: WelcomeScreen());
  //     }
  //
  //
  //   }
  //   else{
  //     pushReplacement(context: context, screen: WelcomeScreen());
  //   }
  //
  // }
  // interval()async{
  //   // Timer timer = new Timer(new Duration(seconds: 5), () async{
  //   Timer.periodic(new Duration(seconds: 5), (timer) async{
  //     debugPrint(timer.tick.toString());
  //
  //     if(await isUserLoggedIn()){
  //       Map data ={
  //         'user_id':await getCurrentUserId()
  //       };
  //       var res = await getData(data, 'interval_api', 0, 0);
  //       // print('res from interval -${res}');
  //       count=0;//int.parse(res['unreadNotification'].toString());
  //       // print('count -${count.toString()}');
  //       setState((){});
  //     }
  //     else{}
  //   });
  //
  // }
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
          'assets/images/slider2.png',
          width: MediaQuery.of(context).size.width - 120,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
