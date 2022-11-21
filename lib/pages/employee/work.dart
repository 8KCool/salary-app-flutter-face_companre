import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/customLoader.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';
import 'package:salaryredesign/widgets/dropdown.dart';
import 'package:salaryredesign/widgets/showSnackbar.dart';

import '../../constants/image_urls.dart';
import '../../constants/sized_box.dart';
import '../../providers/clock.dart';
import '../../services/api_urls.dart';
import '../../services/webservices.dart';
import '../../widgets/avatar.dart';
import 'dart:convert' as convert;

import '../../widgets/newdropdown.dart';
import 'package:intl/intl.dart';

class Employee_Work_Details extends StatefulWidget {
  const Employee_Work_Details({Key? key}) : super(key: key);

  @override
  State<Employee_Work_Details> createState() => _Employee_Work_DetailsState();
}

class _Employee_Work_DetailsState extends State<Employee_Work_Details> {

  TextEditingController name = TextEditingController();
  TextEditingController employee_id = TextEditingController();
  TextEditingController doj= TextEditingController();
  TextEditingController resignation_date= TextEditingController();
  TextEditingController state=TextEditingController();
  TextEditingController start= TextEditingController();
  TextEditingController end= TextEditingController();
  TextEditingController aadhaar_number = TextEditingController();
  TextEditingController pan_number = TextEditingController();
  TextEditingController uan = TextEditingController();
  TextEditingController pfnumber = TextEditingController();
  TextEditingController esinumber = TextEditingController();

  String Img='';
  String? depId;
  String? shift;
  String? staff;
  String? staffdesignation;
  String? role;
  DateTime? dateTime  ;

  List stateList=[];
  List branchList=[];
  List departmentList=[];
  List branchdepartmentList=[];
  List shiftList=[];
  List staffCat=[];
  List staffDes=[];
  List roleList=[];

  getStartEndTime(id){
    for(var i=0 ; i<shiftList.length;i++){
      if(shiftList[i]['id'].toString()==id){
        start.text=shiftList[i]['start_time'];
        end.text=shiftList[i]['end_time'];
      }
    }
  }
  getProfileData()async{
    Provider.of<GlobalModal>(context, listen: false).loadingShow();
    var res = await Webservices.getData(ApiUrls.getworkdetail,context);
    Provider.of<GlobalModal>(context, listen: false).loadingHide();
    log('res from new api -----------$res');
    var jsonResponse = convert.jsonDecode(res.body);
    log('res from new api -----------$jsonResponse');
    branchList=jsonResponse['branch'];
    departmentList=jsonResponse['department'];
    shiftList=jsonResponse['shift'];
    staffCat=jsonResponse['empCat'];
    staffDes=jsonResponse['empDes'];
    roleList=jsonResponse['allRole'];
    state.text=jsonResponse['data']['branch_id'].toString()=='0'?'':jsonResponse['data']['branch_id'].toString();
    staff=jsonResponse['data']['category_id'].toString()=='0'?'':jsonResponse['data']['category_id'].toString();
 if(jsonResponse['data']['branch_id'].toString()!='0'){
   if(jsonResponse['data']['department_id'].toString()!='0'){
     getDepartment(jsonResponse['data']['branch_id'].toString());
     log("list-----------------$departmentList");
     print('depppp-----------${jsonResponse['data']['department_id'].toString()=='0'?'':jsonResponse['data']['department_id'].toString()}');
     depId=jsonResponse['data']['department_id'].toString()=='0'?'':jsonResponse['data']['department_id'].toString();
   }


 }
    staffdesignation=jsonResponse['data']['designation_id'].toString()=='0'?'':jsonResponse['data']['designation_id'].toString();
    shift=jsonResponse['data']['shift_setting'].toString()=='0'?'':jsonResponse['data']['shift_setting'].toString();
    role=jsonResponse['data']['role'].toString()=='0'?'':jsonResponse['data']['role'].toString();
    start.text=jsonResponse['data']['start_time'].toString();
    end.text=jsonResponse['data']['end_time'].toString();
    employee_id.text=jsonResponse['data']['employeeID'].toString();
    doj.text=jsonResponse['data']['doj'].toString();
    resignation_date.text=jsonResponse['data']['resignation_date'].toString()!='null'?jsonResponse['data']['resignation_date'].toString():'';
    log("shiftList    --------${shiftList}");
    setState(() {

    });
  }
   getDepartment(String Id)async{
    branchdepartmentList=[];
    for(int i=0 ; i<departmentList.length;i++){
     if(Id==departmentList[i]['branch_id'].toString()){
       print('branchdepartmentList         ${branchdepartmentList}');
       branchdepartmentList.add(departmentList[i]);
     }
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    getProfileData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Work') ,
      body: Consumer<GlobalModal>(
        builder: (context,globalModal,child) {
          return globalModal.load?CustomLoader():SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vSizedBox,
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 11),
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(4)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      vSizedBox4,
                      MainHeadingText(text: 'Preference'),
                      vSizedBox,
                      DropDwonNew(
                        islabel: true,
                        hintlabel:'Select Branch' ,
                        label: 'Select Branch',
                        selectedValue:state.text==''?null:state.text,
                        items:branchList.map((e) {
                          return DropdownMenuItem<String>(
                            value: e['id'].toString(),
                            child: Text(e['name'].toString()),
                          );
                        }).toList(),
                        onChange: (String? value ) {
                          if(value!=null){
                            print('value'+value);
                            state.text=value.toString();
                            getDepartment(state.text.toString());
                            depId=null;
                          }
                          setState((){});
                        },
                      ),
                      // branchdepartmentList
                      if(branchdepartmentList.length>0)
                      vSizedBox,
                      if(branchdepartmentList.length>0)
                      DropDwonNew(
                        islabel: true,
                        label: 'Select Department',
                        hintlabel: 'Select Department',
                        selectedValue:depId==''?null:depId,
                        items:branchdepartmentList.map((e) {
                          return DropdownMenuItem<String>(
                            value: e['id'].toString(),
                            child: Text(e['name'].toString()),
                          );
                        }).toList(),
                        onChange: (String? value ) {
                          if(value!=null){
                            print('value'+value);
                            depId=value.toString();

                          }
                          setState((){});
                        },
                      ),
                      if(shiftList.length>0)
                        vSizedBox,
                      if(shiftList.length>0)
                        DropDwonNew(
                          islabel: true,
                          label: 'Shift Setting',
                          selectedValue:shift==''?null:shift,
                          items:shiftList.map((e) {
                            return DropdownMenuItem<String>(
                              value: e['id'].toString(),
                              child: Text(e['name'].toString()),
                            );
                          }).toList(),
                          onChange: (String? value ) {
                            if(value!=null){
                              shift=value;
                              setState(() {
                                getStartEndTime(shift);
                              });

                              // var jj = convert.JsonDecoder(value);
                              // shift=;

                            }
                            setState((){});
                          },
                        ),
                      vSizedBox2,
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(controller: start, hintText: '',
                              label: 'Start Time',
                              showlabel: true,
                              labelcolor: MyColors.black,
                              enable: false,
                            ),
                          ),
                          hSizedBox,
                          Expanded(
                            child: CustomTextField(controller: end, hintText: '',
                              label: 'End Time',
                              showlabel: true,
                              enable: false,

                              labelcolor: MyColors.black,
                            ),
                          ),
                        ],
                      ),
                      DropDwonNew(
                        islabel: true,
                        label: 'Select Staff Category',
                        hintlabel: 'Select Staff Category',
                        selectedValue:staff==''?null:staff,
                        items:staffCat.map((e) {
                          return DropdownMenuItem<String>(
                            value: e['id'].toString(),
                            child: Text(e['type'].toString()),
                          );
                        }).toList(),
                        onChange: (String? value ) {
                          if(value!=null){
                            staff=value;
                            setState(() {

                            });

                            // var jj = convert.JsonDecoder(value);
                            // shift=;

                          }
                          setState((){});
                        },
                      ),
                      DropDwonNew(
                        islabel: true,
                        label: 'Select Designation',
                        hintlabel: 'Select Designation',
                        selectedValue:staffdesignation==''?null:staffdesignation,
                        items:staffDes.map((e) {
                          return DropdownMenuItem<String>(
                            value: e['id'].toString(),
                            child: Text(e['type'].toString()),
                          );
                        }).toList(),
                        onChange: (String? value ) {
                          if(value!=null){
                            staffdesignation=value;
                            setState(() {

                            });

                            // var jj = convert.JsonDecoder(value);
                            // shift=;

                          }
                          setState((){});
                        },
                      ),

                      vSizedBox2,
                      CustomTextField(controller: employee_id, hintText: '',
                        label: 'Employee ID',
                        showlabel: true,
                        labelcolor: MyColors.black,
                      ),
                      vSizedBox2,
                      GestureDetector(
                        onTap: ()async{
                          DateTime? temp = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1977),
                              lastDate: DateTime(2099));
                          // showTimePicker(context: context, initialTime: initialTime)
                          if (temp != null) {
                            dateTime = temp;
                            doj.text=DateFormat("yyyy-MM-dd").format(dateTime!).toString();
                          }
                          setState(() {});
                        },
                        child: CustomTextField(controller: doj, hintText: '',
                          label: 'Date Of Joining',
                          showlabel: true,
                          enable: false,
                        ),
                      ),
                      vSizedBox2,

                      GestureDetector(
                        onTap: ()async{
                          DateTime? temp = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1977),
                              lastDate: DateTime(2099));
                          // showTimePicker(context: context, initialTime: initialTime)
                          if (temp != null) {
                            dateTime = temp;
                            resignation_date.text=DateFormat("yyyy-MM-dd").format(dateTime!).toString();
                          }
                          setState(() {});
                        },
                        child: CustomTextField(controller: resignation_date, hintText: '',
                          label: 'Resignation Date',
                          showlabel: true,
                          enable: false,
                        ),
                      ),

                      // vSizedBox2,
                      DropDwonNew(
                        islabel: true,
                        label: 'Select Role',
                        hintlabel: 'Select Role',
                        selectedValue:role==''?null:role,
                        items:roleList.map((e) {
                          return DropdownMenuItem<String>(
                            value: e['id'].toString(),
                            child: Text(e['name'].toString()),
                          );
                        }).toList(),
                        onChange: (String? value ) {
                          if(value!=null){
                            role=value;
                            setState(() {

                            });
                          }
                          setState((){});
                        },
                      ),

                      vSizedBox2,
                      RoundEdgedButton(
                          text: 'Save',
                        onTap: ()async{
                            if(state.text==''){
                              showSnackbar(context, 'Please select Branch.');
                            }else if(shift==''){
                              showSnackbar(context, 'Please select shift.');
                            }
                            else{
                              Map<String,dynamic>data={
                              'branch':state.text,
                              'department_id':depId,
                              'shift':shift,
                              'start_time':start.text,
                              'end_time':end.text,
                                'category_id':staff,
                                'designation_id':staffdesignation,
                                'employeeID':employee_id.text,
                                'doj':doj.text,
                                'role':role
                              };
                              print('data-----------$data');
                              globalModal.loadingShow();
                              var res = await Webservices.postData(apiUrl: ApiUrls.getworkdetailstore, body: data, context: context);
                              globalModal.loadingHide();
                              if(res['success'].toString()=='true'){
                                showSnackbar(context,res['message']);
                                Navigator.pop(context);
                              }
                              else{
                                showSnackbar(context,res['message']);

                              }
                            }
                        },
                      ),
                      vSizedBox4,

                    ],
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
