import 'dart:convert' as convert;
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:salaryredesign/pages/Login_process/enter_phone_number.dart';
import 'package:salaryredesign/providers/clock.dart';
import 'package:salaryredesign/services/api_urls.dart';
import 'package:salaryredesign/services/webservices.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/globalkeys.dart';
import '../functions/navigation_functions.dart';
import '../modals/userData.dart';
import '../widgets/showSnackbar.dart';


// UserModal? userData;
late SharedPreferences sharedPreference;
class MyLocalServices{
  static UserModal updateSharedPreferences(Map userMap,BuildContext context){


    String userDataString  = convert.jsonEncode(userMap);
    print('updating sharedpreference : $userDataString');
    sharedPreference.setString('userData', userDataString);
    Provider.of<GlobalModal>(context, listen: false).userData = UserModal.fromJson(userMap);
    return Provider.of<GlobalModal>(context,listen: false).userData!;
  }

  // static Future<UserModal> updateSharedPreferencesFromServer(String userId)async{
  //
  //
  //   Map userMap = await Webservices.getMap(ApiUrls.Getuserlogindetail + '$userId');
  //   // return updateSharedPreferences(userMap);
  //   // retur
  // }

  static void logout(){
    sharedPreference.clear();
    // userData = null;
    sharedPreference.setString('is_visit', 'true');

    Navigator.popUntil(MyGlobalKeys.navigatorKey.currentContext!, (route) => route.isFirst);
    pushReplacement(context: MyGlobalKeys.navigatorKey.currentContext!, screen: Enter_Phone_Number(),);

  }

}