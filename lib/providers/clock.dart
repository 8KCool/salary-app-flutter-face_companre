import 'dart:async';
import 'dart:collection';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:salaryredesign/constants/globalkeys.dart';
import 'package:salaryredesign/modals/department.dart';
import 'package:salaryredesign/modals/location.dart';
import 'package:salaryredesign/modals/userData.dart';
import 'package:salaryredesign/services/local_services.dart';

import '../functions/location.dart';
import '../modals/branch.dart';
import '../modals/shift.dart';
import '../services/api_urls.dart';
import '../services/webservices.dart';
import 'dart:convert' as convert;

class GlobalModal extends ChangeNotifier {
  /// Internal, private state of the cart.
  String clock = '';
  bool isShow = false;
  bool load = false;
  UserModal? userData;
  LocationModal? location;
  List<BranchModal> branch = [];
  List<ShiftModal> shift = [];
  List<DepartmentModal> department = [];
 Map usersDep={};
  Map shiftPermission = {};
  Map branchPermission = {};
  Map departmentPermission = {};
  List departmentBranch = [];
  List departmentBranchAll = [];

  List departmentUsers = [];

  Timer? timer;
  // List<UserModel> userdata = [];
  startTimer() {
    int min = 00;
    int sec = 00;
    timer = Timer.periodic(new Duration(seconds: 1), (timer) {
      sec++;
      if (sec == 60) {
        sec = 00;
        min++;
      }
      String sec1 = '';
      if (sec < 10) {
        sec1 = '0' + sec.toString();
      } else {
        sec1 = sec.toString();
      }
      clock = '0${min}:${sec1}';
      // debugPrint("Print after 1 seconds ------------$clock");
      // debugPrint(timer.tick.toString());
      if (clock == '02:00') {
        isShow = true;
        sec = 00;
        min = 00;
        timer.cancel();
      }
      notifyListeners();
    });
  }

  cancelTimer() {
    if (timer != null) {
      timer?.cancel();
    }
  }

  addUserDetail(Map userMap, BuildContext context) {
    print('object-----------258 ${userMap}');
    MyLocalServices.updateSharedPreferences(userMap, context);
    notifyListeners();
  }

  loadingShow() {
    load = true;
    notifyListeners();
  }

  loadingHide() {
    load = false;
    notifyListeners();
  }

  getLocation() async {
    load = true;
    try {
      var res = await determinePosition();
      print('drfs---------F1233--' + res.toString());
      var address = await getAddressFromLatLng(res.latitude, res.longitude);
      print("123--------------" + address.toString());
      location = LocationModal(
          Lat: res.latitude, Lng: res.longitude, addressString: address);
      load = false;
      notifyListeners();
    } catch (e) {
      print('error in location ()------------$e');
    }
  }

  getBranch(context) async {
    branch = [];
    load = true;
    var res = await Webservices.getData(ApiUrls.listBranch, context);
    load = false;
    log('res from api listBranch ---------------${res.body}');
    var result = res.body;
    log('result-----1--${result}');
    var result1 = convert.jsonDecode(result);
    log('result-----2--${result1["data"]}');
    branchPermission = result1['permission'];
    for (var i = 0; i < result1['data'].length; i++) {
      // result1['data'][i]['manager_name']='manager_name';
      branch.add(BranchModal.fromJson(result1['data'][i]));
      // branch=BranchModal(result1['data'][i] ,result1['permission'], branchPermissions: result1['permission']);
    }
    notifyListeners();
  }

  getShift(context) async {
    shift = [];
    load = true;
    var res = await Webservices.getData(ApiUrls.listShift, context);
    load = false;
    log('res from api listBranch ---------------${res.body}');
    var result = res.body;
    log('result-----1--${result}');
    var result1 = convert.jsonDecode(result);
    log('result-----2--${result1["data"]}');
    shiftPermission = result1['permission'];
    for (var i = 0; i < result1['data'].length; i++) {
      // result1['data'][i]['manager_name']='manager_name';
      shift.add(ShiftModal.fromJson(result1['data'][i]));
      // branch=BranchModal(result1['data'][i] ,result1['permission'], branchPermissions: result1['permission']);
    }
    notifyListeners();
  }

  getDepartment(context) async {
    department = [];
    departmentUsers=[];
    load = true;
    var res = await Webservices.getData(ApiUrls.listDepartment, context);
    load = false;
    log('res from api listBranch ---------------${res.body}');
    var result = res.body;
    log('result-----1--${result}');

    var result1 = convert.jsonDecode(result);
    log('result-----2--${result1['data']['department']}');
    departmentPermission = result1['permission'];
    departmentBranch =[];
    for(int i=0; i<result1['data']['Branch'].length;i++){
      if(i==0){

        departmentBranchAll.add({"id":"","name":"All",});
      }
      departmentBranch.add(result1['data']['Branch'][i]);
      departmentBranchAll.add(result1['data']['Branch'][i]);

    }
    departmentUsers=result1['user'];
    log('result-----2--${result1['user']}');
    for (var i = 0; i < departmentUsers.length; i++) {
      if(usersDep[departmentUsers[i]['department_id']]==null){
        usersDep[departmentUsers[i]['department_id']]=[];
      }
      usersDep[departmentUsers[i]['department_id']].add(departmentUsers[i]);



    }


    print('departmentUsers id group ___________${usersDep}');

    for (var i = 0; i < result1['data']['department'].length; i++) {
      result1['data']['department'][i]['users']=usersDep[result1['data']['department'][i]['id']];
      department.add(DepartmentModal.fromJson(result1['data']['department'][i]));
      log(department.toString());
    }
// log(department.toString());

    notifyListeners();
  }
}



// for (var i = 0; i < result1['data']['department'].length; i++) {
// // result1['data']['department'][i]['images']=[];
// // log("123456789---------"+result1['data']['department'][i]['images'].toString());
// // for (var j = 0; j < departmentUsers.length; j++) {
// //   if (result1['data']['department'][i]['id'] ==
// //       departmentUsers[j]['department_id']) {
// //     log("-----------2---------"+result1['data']['department'][i]['images'].toString());
// //
// //     // if(departmentUsers[i]['avatar']!=null){
// //       log("-----------3---------"+result1['data']['department'][i]['images'].toString());
// //
// //       result1['data']['department'][i]['images'].add(
// //         result1['image_path'] + departmentUsers[i]['avatar']);
// //     log('departmrj');
// //     log(result1['data']['department'].toString());
// //   // }
// // }
// //
// // }
//
// department.add(DepartmentModal.fromJson(result1['data']['department'][i]));// branch=BranchModal(result1['data'][i] ,result1['permission'], branchPermissions: result1['permission']);
// }

