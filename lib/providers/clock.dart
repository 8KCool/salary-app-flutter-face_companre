

import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:salaryredesign/modals/userData.dart';
import 'package:salaryredesign/services/local_services.dart';

class GlobalModal extends ChangeNotifier {
  /// Internal, private state of the cart.
 String clock='';
 bool isShow=false;
 bool load=false;
 UserModal? userData;
 // List<UserModel> userdata = [];
 addTime(){
  int min=00;
  int sec=00;
  Timer timer =Timer.periodic(new Duration(seconds: 1), (timer) {

   sec++;
   if(sec==60){
    sec=00;
    min++;
   }
   String sec1='';
   if(sec<10){
    sec1='0'+sec.toString();
   }else{
    sec1=sec.toString();
   }
   clock= '0${min}:${sec1}';
   // debugPrint("Print after 1 seconds ------------$clock");
   // debugPrint(timer.tick.toString());
   if(clock=='02:00'){
    isShow=true;
    sec=00;
    min=00;
    timer.cancel();
   }
   notifyListeners();

  });



 }
 addUserDetail(Map userMap , BuildContext context){
  print('object-----------258 ${userMap}');
  MyLocalServices.updateSharedPreferences(userMap,context);
  notifyListeners();
 }
 loadingShow(){
  load=true;
  notifyListeners();
 }
 loadingHide(){
  load=false;
  notifyListeners();
 }


}
