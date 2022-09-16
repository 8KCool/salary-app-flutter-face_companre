

import 'dart:async';
import 'dart:collection';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:salaryredesign/modals/location.dart';
import 'package:salaryredesign/modals/userData.dart';
import 'package:salaryredesign/services/local_services.dart';

import '../functions/location.dart';
import '../modals/branch.dart';
import '../services/api_urls.dart';
import '../services/webservices.dart';
import 'dart:convert' as convert;

class GlobalModal extends ChangeNotifier {
  /// Internal, private state of the cart.
 String clock='';
 bool isShow=false;
 bool load=false;
 UserModal? userData;
 LocationModal? location;
 List<BranchModal> branch=[];
 Map branchPermission={};
 Timer? timer;
 // List<UserModel> userdata = [];
 startTimer(){
  int min=00;
  int sec=00;
   timer =Timer.periodic(new Duration(seconds: 1), (timer) {

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

 cancelTimer(){
  if(timer!=null){
   timer?.cancel();
  }
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
getLocation() async {
  load=true;
  try{
   var res = await determinePosition();
   print('drfs---------F1233--' + res.toString());
   var address =
   await getAddressFromLatLng(res.latitude, res.longitude);
   print("123--------------" + address.toString());
   location = LocationModal(Lat: res.latitude, Lng: res.longitude, addressString: address);
   load=false;
   notifyListeners();
  }catch(e){
   print('error in location ()------------$e');
  }

}
getBranch(context)async{
 branch=[];
 load=true;
 var res =await Webservices.getData(ApiUrls.listBranch, context);
 load=false;
 log('res from api listBranch ---------------${res.body}');
 var result=res.body;
 log('result-----1--${result}');
 var result1= convert.jsonDecode(result);
 log('result-----2--${result1["data"]}');
 branchPermission=result1['permission'];
 for (var i=0 ; i<result1['data'].length;i++){
  // result1['data'][i]['manager_name']='manager_name';
branch.add(BranchModal.fromJson(result1['data'][i]));
  // branch=BranchModal(result1['data'][i] ,result1['permission'], branchPermissions: result1['permission']);
 }
 notifyListeners();
}

}
