import 'dart:async';
import 'dart:collection';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/globalkeys.dart';



import '../functions/location.dart';
import '../modals/branch.dart';
import '../modals/department.dart';
import '../modals/employee_attendance.dart';
import '../modals/holiday.dart';
import '../modals/location.dart';
import '../modals/shift.dart';
import '../modals/userData.dart';
import '../modals/weekOffList.dart';
import '../services/api_urls.dart';
import '../services/local_services.dart';
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
  List<HolidayModal> holiday = [];
  List<WeekOffListModal> weekOff = [];
  List<EmployeeAttendance> attanceList=[];
  EmployeeAttendance? empAttend;

  List holidayBranch=[];
  Map holidayData={};

  Map usersDep={};
  Map dep={};
  Map brnc={};
  Map attendancedata={};
  bool branchLoaded=false;
  Map holidaybranch={};
  List holidaybranchDetail=[];

  Map shiftPermission = {};
  Map branchPermission = {};
  Map departmentPermission = {};
  List departmentBranch = [];
  List departmentBranchAll = [];

  List departmentUsers = [];
  List depart=[];
  List departhhh=[];
  List category=[];
  List calender=[];
  Set<DateTime> holiDaysbtdate = {};


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
    // loadingShow();
    print('addUserDetail called');
    loadingShow();
    print('object-----------258 ${userMap}');
    MyLocalServices.updateSharedPreferences(userMap, context );
    loadingHide();
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
getAttendance(data)async{
    loadingShow();
    // for (var i = 0; i < data.length; i++) {
      // result1['data'][i]['manager_name']='manager_name';
    // empAttend=data;
    log("empAttend-----1---------$data");
    empAttend=EmployeeAttendance.fromJson(data);
    log("empAttend------2--------$empAttend");

    // branch=BranchModal(result1['data'][i] ,result1['permission'], branchPermissions: result1['permission']);
    // }
    loadingHide();
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

//   getBranch(context) async {
//     branch = [];
//     load = true;
//     var res = await Webservices.getData(ApiUrls.listBranch, context);
//     load = false;
//     log('res from api listBranch ---------------${res.body}');
//     var result = res.body;
//     log('result-----1--${result}');
//     var result1 = convert.jsonDecode(result);
//     log('result-----2--${result1["data"]}');
//     branchPermission = result1['permission'];
//     for (var i = 0; i < result1['data'].length; i++) {
//       // result1['data'][i]['manager_name']='manager_name';
//       branch.add(BranchModal.fromJson(result1['data'][i]));
//       // branch=BranchModal(result1['data'][i] ,result1['permission'], branchPermissions: result1['permission']);
//     }
//     notifyListeners();
//   }
//
//   getShift(context) async {
//     shift = [];
//     load = true;
//
//
//
//
//     var res = await Webservices.getData(ApiUrls.listShift, context);
//     load = false;
//     log('res from api listBranch ---------------${res.body}');
//     var result = res.body;
//     log('result-----1--${result}');
//     var result1 = convert.jsonDecode(result);
//     log('result-----2--${result1["data"]}');
//     shiftPermission = result1['permission'];
//     for (var i = 0; i < result1['data'].length; i++) {
//       // result1['data'][i]['manager_name']='manager_name';
//       shift.add(ShiftModal.fromJson(result1['data'][i]));
//       // branch=BranchModal(result1['data'][i] ,result1['permission'], branchPermissions: result1['permission']);
//     }
//     notifyListeners();
//   }
//
//   getDepartment(context) async {
//     department = [];
//     departmentUsers=[];
//     departmentBranchAll=[];
//     load = true;
//     var res = await Webservices.getData(ApiUrls.listDepartment, context);
//     load = false;
//     log('res from api listBranch ---------------${res.body}');
//     var result = res.body;
//     log('result-----1--${result}');
//
//     var result1 = convert.jsonDecode(result);
//     log('result-----2--${result1['data']['department']}');
//     departmentPermission = result1['permission'];
//     departmentBranch =[];
//     for(int i=0; i<result1['data']['Branch'].length;i++){
//       result1['data']['Branch'][i]['checked']=false;
//       if(i==0){
//
//         departmentBranchAll.add({"id":"","name":"All",});
//       }
//       departmentBranch.add(result1['data']['Branch'][i]);
//       departmentBranchAll.add(result1['data']['Branch'][i]);
//
//     }
//     departmentUsers=result1['user'];
//     log('result-----2--${result1['user']}');
//     for (var i = 0; i < departmentUsers.length; i++) {
//       if(usersDep[departmentUsers[i]['department_id']]==null){
//         usersDep[departmentUsers[i]['department_id']]=[];
//       }
//       usersDep[departmentUsers[i]['department_id']].add(departmentUsers[i]);
//
//
//
//     }
//
//
//     print('departmentUsers id group ___________${usersDep}');
//
//     for (var i = 0; i < result1['data']['department'].length; i++) {
//       result1['data']['department'][i]['users']=usersDep[result1['data']['department'][i]['id']];
//       department.add(DepartmentModal.fromJson(result1['data']['department'][i]));
//       log(department.toString());
//     }
//
//
//     notifyListeners();
//   }
//
//   getHoliday(context,String search_branch,String search_department) async {
//     holiday = [];
//     departhhh=[];
//     load = true;
//     // notifyListeners();
//
//     Map<String,dynamic>data={
//       'search_branch':search_branch.toString()==''?'0':search_branch.toString(),
//       'search_department':search_department.toString()==''?'0':search_department.toString()
//     };
//     log('data data data--------------${data}');
//
//     var res = await Webservices.postData(apiUrl:ApiUrls.listholiday,  body:data, context: context);
//     load = false;
//
//     log('res from api listholiday ---------------${res}');
//     holidayData=res['data'];
//     // getBranchDepartment();
//     for (var i = 0; i < res['data']['department'].length; i++) {
//       res['data']['department'][i]['checked']=false;
//     }
//     for (var i = 0; i < res['data']['branch'].length; i++) {
//       res['data']['branch'][i]['checked']=false;
//     }
//     departhhh=res['data']['department'];
//     depart=departhhh;
//     departmentBranch=res['data']['branch'];
//     // var result = res.body;
//     log('result-----1--${departhhh}');
//     // var result1 = convert.jsonDecode(result);
//     log('result-----2m--${res["data"]['holiday']}');
//     for (var i = 0; i < res['data']['branch'].length; i++) {
//       brnc[res['data']['branch'][i]['id'].toString()]=res['data']['branch'][i];
//
//     }
//     for (var i = 0; i < res['data']['department'].length; i++) {
//       dep[res['data']['department'][i]['id'].toString()]=res['data']['department'][i];
//
//     }
//     log('dep------------${dep}');
//     log('branc------------${brnc}');
//
//     for (int i = 0; i < res['data']['holiday'].length; i++) {
//
//       print('i');
//       holiday.add(HolidayModal.fromJson(res['data']['holiday'][i]));
//     }
//
//     notifyListeners();
//   }
// updateHoliday(holiday)async{
//   for (int i = 0; i < holiday.length; i++) {
//
//     print('i------------789--------${holiday}');
//     holiday.add(HolidayModal.fromJson(holiday[i]));
//   }
//   log("Holiday------------list --------------${holiday}");
//   notifyListeners();
// }
//   getdepart(String id)async{
//     print('id --------${id}');
//
//     depart=[];
//     for(int i=0 ;i< departhhh.length;i++){
//       print('depid --------${departhhh}');
//       print('${departhhh[i]['b_id']}-----------------');
//
//
//       if(id==departhhh[i]['b_id'].toString()){
//        depart.add(departhhh[i]);
//       }
//     }
// print('object --------${depart}');
//     notifyListeners();
//   }
//   getBranchDepartment(){
//     category=departhhh+departmentBranch;
//     log('categorycategorycategory-------');
//     log(category.toString());
//     notifyListeners();
//   }
  getCalendar(context,DateTime date)async{
    load = true;
    notifyListeners();
    var res = await Webservices.getData('${ApiUrls.calender}?year=${date.year}&month=${date.month}', context);
    load = false;
    log('res from api listBranch ---------------${res.body}');
    var result = res.body;
    var result1 = convert.jsonDecode(result);
    calender=result1['data']['holiday'];
    load=false;
    notifyListeners();
  }
//
//   weekOffSetting(data,branch,departmaent,permission){
//     weekOff=[];
//     branchPermission=permission;
//     for (var i = 0; i < branch.length; i++) {
//       brnc[branch[i]['id'].toString()]=branch[i];
//
//     }
//     for (int i = 0; i < departmaent.length; i++) {
//       dep[departmaent[i]['id'].toString()]=departmaent[i];
//
//     }
//     log('dep------------${dep}');
//     log('branc------------${brnc}');
//     for (int i = 0; i < data.length; i++) {
//       weekOff.add(WeekOffListModal.fromJson(data[i]));
//       print('i------------789--------${weekOff}');
//
//     }
//     log("Holiday------------list --------------${data}");
//     notifyListeners();
//   }
getweekoffbydate(data){
  holiDaysbtdate = {};
  for(var i=0; i<data.length;i++){
    print("result1['data']['getAllweekoff']-----123----------${data[i]}");
    holiDaysbtdate.add(DateTime.parse(data[i]));
  }
  print("result1['data']['getAllweekoff']---------------${holiDaysbtdate}");

  notifyListeners();
}
}


