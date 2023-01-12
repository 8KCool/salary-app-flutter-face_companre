

import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/globalkeys.dart';

void updateUserDetails(details) async{
  SharedPreferences shared_User = await SharedPreferences.getInstance();
  String user = jsonEncode(details);
  shared_User.setString('user_details', user);
}

Future<Map<String, dynamic>> getUserDetails() async{
  SharedPreferences shared_User = await SharedPreferences.getInstance();
  String userMap = await shared_User.getString('user_details')!;
  String userS = (userMap==null)?'':userMap;
  // log('this is uer'+userMap!);
  // if(userMap==null){
  //     return 0.toString();
  // }
  // else{
  // userMap;
  //  log('this is one '+userS);
  Map<String , dynamic> user = jsonDecode(userS) as  Map<String, dynamic>;
  // log('this is '+user['user_id']);
  return user;//.toString();
  // }
}

Future getCurrentUserId() async{
  SharedPreferences shared_User = await SharedPreferences.getInstance();
  print('1');
  String? userMap = await shared_User.getString('user_details');
  print('2');
  String userS = (userMap==null)?'':userMap;
  print('3');
  // log('this is uer'+userMap!);
  // if(userMap==null){
  //     return 0.toString();
  // }
  // else{
  // userMap;
  //  log('this is one '+userS);
  Map<String , dynamic> user = jsonDecode(userS) as  Map<String, dynamic>;
  print('4');
  // log('this is '+user['user_id']);
  return user['id'].toString();//.toString();
  // }
}
void updateUserId(id) async{
  // await FlutterSession().set("user_id", id);
}

Future isUserLoggedIn() async{
  // log("checking 124");
  // // SharedPreferences? sharedUser = null;
  final  sharedUser = await SharedPreferences.getInstance();
  //
  // return false;


  String? user = await sharedUser.getString('user_details');
  log(user.toString());
  // var d = jsonDecode(user);
  if(user==null){
    return false;
  }
  else{
    return true;
    log('user is already logged in '+user);
  }
  // await FlutterSession().get("user_details", details);
}

Future logout() async{

  print("logout()");
  globalCount = 0;
  SharedPreferences shared_User = await SharedPreferences.getInstance();
  await shared_User.clear();
  return true;
}