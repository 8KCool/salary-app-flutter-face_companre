import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/globalkeys.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/widgets/CustomLoader.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';
import 'package:salaryredesign/widgets/dropdown.dart';
import 'package:salaryredesign/widgets/showSnackbar.dart';

import '../../providers/clock.dart';
import '../../services/api_urls.dart';
import '../../services/webservices.dart';
import '../../widgets/avatar.dart';
import '../../widgets/customtextfield.dart';
import '../../widgets/new_dropdown.dart';

class Department_Settings_Page extends StatefulWidget {
  const Department_Settings_Page({Key? key}) : super(key: key);

  @override
  State<Department_Settings_Page> createState() =>
      _Department_Settings_PageState();
}

class _Department_Settings_PageState extends State<Department_Settings_Page> {
  TextEditingController name = TextEditingController();
  TextEditingController search = TextEditingController();

  String? branch_id;
  String? searchbyDep;
  String? head_id;

  List image = [
    MyImages.avtarone,
    MyImages.avatr8,
    MyImages.avatr3,
    MyImages.avatr4,
    MyImages.avatr5,
    MyImages.avatr6,
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDepartment();
  }

  getDepartment() async {
    await Provider.of<GlobalModal>(context, listen: false)
        .getDepartment(context);
  }

  @override
  Widget build(BuildContext context) {
    int count1 = 0;
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar:
          appBar(context: context, title: 'Departments', titlecenter: false),
      body: Consumer<GlobalModal>(builder: (context, globalModal, child) {
        return SingleChildScrollView(
          child: globalModal.load
              ? CustomLoader()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // height:MediaQuery.of(context).size.height,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.only(
                        //   bottomLeft: Radius.circular(30),
                        //   bottomRight: Radius.circular(30),
                        // )
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MainHeadingText(
                                text: 'Departments',
                                fontSize: 20,
                              ),
                              hSizedBox,
                              hSizedBox05,
                              if (globalModal.departmentPermission['add'])
                                RoundEdgedButton(
                                  text: 'Add New',
                                  verticalPadding: 0,
                                  color: MyColors.primaryColor,
                                  minWidth: 0,
                                  height: 35,
                                  onTap: () {
                                    branch_id=null;
                                    name.text='';
                                    bottomsheet(
                                      height: 450,
                                      context: context,
                                      child: Scaffold(
                                        body: globalModal.load
                                            ? CustomLoader()
                                            : StatefulBuilder(
                                                builder: (BuildContext context,
                                                    StateSetter changeState) {
                                                  return SingleChildScrollView(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        vSizedBox4,
                                                        MainHeadingText(
                                                          text:
                                                              'Add Department',
                                                          fontSize: 20,
                                                          color: MyColors.black,
                                                        ),
                                                        vSizedBox2,
                                                        CustomTextField(
                                                          controller: name,
                                                          hintText: '',
                                                          label:
                                                              'Department Name',
                                                          showlabel: true,
                                                          labelcolor:
                                                              MyColors.black,
                                                        ),
                                                        vSizedBox2,
                                                        Text('Branch'),
                                                        vSizedBox05,

                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 55,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                MyColors.white,
                                                            border: Border.all(
                                                                color: MyColors
                                                                    .blackcolor70),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                          ),
                                                          child: DropdownButton<
                                                              String>(
                                                            underline:
                                                                Container(
                                                              height: 8,
                                                            ),
                                                            hint:
                                                                Text('Branch'),
                                                            value: branch_id,
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_outlined,
                                                            ),
                                                            elevation: 0,
                                                            isExpanded: true,
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                            onChanged: (String?
                                                                newValue) async {
                                                              globalModal
                                                                  .loadingShow();
                                                              branch_id =
                                                                  newValue!;
                                                              globalModal
                                                                  .loadingHide();
                                                              print('id' +
                                                                  branch_id
                                                                      .toString());
                                                              changeState(
                                                                  () {});
                                                            },
                                                            items: globalModal
                                                                .departmentBranch
                                                                .map((e) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: e['id']
                                                                    .toString(),
                                                                child: Text(
                                                                    e['name']),
                                                              );
                                                            }).toList(),
                                                          ),
                                                        ),
                                                        // DropDown(hint: 'Language Known'),
                                                        vSizedBox,

                                                        vSizedBox2,
                                                        RoundEdgedButton(
                                                          text: 'Submit',
                                                          onTap: () async {
                                                            if (name.text ==
                                                                '') {
                                                              showSnackbar(
                                                                  context,
                                                                  'Please Enter Department name.');
                                                            } else if (branch_id ==
                                                                null) {
                                                              showSnackbar(
                                                                  context,
                                                                  'Please Select branch .');
                                                            } else {
                                                              Map<String,
                                                                      dynamic>
                                                                  data = {
                                                                'name':
                                                                    name.text,
                                                                'branch': branch_id
                                                                    .toString(),
                                                              };
                                                              globalModal
                                                                  .loadingShow();
                                                              print(
                                                                  'datat for api- ${data}');
                                                              var res = await Webservices.postData(
                                                                  apiUrl: ApiUrls
                                                                      .storeDepartment,
                                                                  body: data,
                                                                  context:
                                                                      context);
                                                              globalModal
                                                                  .loadingHide();
                                                              Navigator.pop(
                                                                  context);
                                                              if (res['success']
                                                                      .toString() ==
                                                                  'true') {
                                                                search.text='';
                                                                name.text = '';
                                                                branch_id =
                                                                    null;
                                                                showSnackbar(
                                                                    context,
                                                                    res['message']);
                                                                // search.text='';

                                                                globalModal
                                                                    .getDepartment(
                                                                        context);
                                                              } else {
                                                                showSnackbar(
                                                                    context,
                                                                    res['message']);
                                                              }
                                                            }
                                                          },
                                                        ),
                                                        vSizedBox4,
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                      ),
                                    );
                                  },
                                ),
                            ],
                          ),
                          vSizedBox,
                          DropDwonNew(
                            islabel: false,
                            selectedValue:search.text==''?null:search.text,

                            onChange: (value){
                             print('String----------${value}');
                             if(value=='All'){
                               search.text='';
                             }
                             else{
                               search.text=value!;
                             }

                             setState(() {

                             });
                            },



                           ),
                          // Container(
                          //   width: MediaQuery.of(context).size.width,
                          //   height: 55,
                          //   padding: EdgeInsets.all(10),
                          //   decoration: BoxDecoration(
                          //     color: MyColors.white,
                          //     border: Border.all(color: MyColors.blackcolor70),
                          //     borderRadius: BorderRadius.circular(4),
                          //   ),
                          //   child: DropdownButton<String>(
                          //     underline: Container(
                          //       height: 8,
                          //     ),
                          //     hint: Text('Choose Branch'),
                          //     value: searchbyDep,
                          //     icon: Icon(
                          //       Icons.keyboard_arrow_down_outlined,
                          //     ),
                          //     dropdownColor:Colors.grey,
                          //     // border: Border.all(color: MyColors.blackcolor70),
                          //     borderRadius: BorderRadius.circular(4),
                          //     elevation: 0,
                          //     isExpanded: true,
                          //     alignment: Alignment.centerLeft,
                          //     style: TextStyle(color: Colors.black),
                          //     onChanged: (String? newValue) async {
                          //       globalModal.loadingShow();
                          //       searchbyDep = newValue!;
                          //       search.text = newValue!;
                          //       globalModal.loadingHide();
                          //       print('id' + search.toString());
                          //       setState(() {});
                          //     },
                          //     items: globalModal.departmentBranch.map((e) {
                          //       return DropdownMenuItem<String>(
                          //         value: e['name'].toString(),
                          //         child: Text(e['name']),
                          //       );
                          //     }).toList(),
                          //   ),
                          // ),
                          // DropDwon(
                          //   islabel: false,
                          //   items: ['Choose Branch', 'Branch 1', 'Branch 2'],
                          // )
                        ],
                      ),
                    ),
                    vSizedBox,
                    SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height,
                        // padding: EdgeInsets.all(16),
                        // color: Colors.white,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: globalModal.department.length,
                          itemBuilder: (context, i) {
                            if (globalModal.department[i].depBranch
                                .toString()
                                .contains(search.text)) {
                              count1++;
                              // setState((){});
                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      decoration:
                                          BoxDecoration(color: MyColors.white),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    MainHeadingText(
                                                      text:
                                                          '${globalModal.department[i].departmentName}',
                                                      color: MyColors.black,
                                                      fontFamily: 'semibold',
                                                      fontSize: 16,
                                                    ),
                                                    vSizedBox05,
                                                    ParagraphText(
                                                      text:
                                                          '${globalModal.department[i].depBranch}',
                                                    ),
                                                    vSizedBox,
                                                    if (globalModal
                                                            .department[i]
                                                            .u_image
                                                            .toString() !=
                                                        '')
                                                      ParagraphText(
                                                        text: 'Department Head',
                                                      ),
                                                    vSizedBox,
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        // if(globalModal.department[i].u_image.toString()!='')
                                                        CircleAvatarcustom(
                                                          image: globalModal
                                                                      .department[
                                                                          i]
                                                                      .u_image
                                                                      .toString() !=
                                                                  ''
                                                              ? ApiUrls
                                                                      .ImagebaseUrl +
                                                                  globalModal
                                                                      .department[
                                                                          i]
                                                                      .u_image
                                                                      .toString()
                                                              : 'https://png.pngtree.com/element_our/png/20181206/users-vector-icon-png_260862.jpg',
                                                          height: 20,
                                                          width: 20,
                                                          borderradius: 60,
                                                        ),
                                                        Stack(
                                                          children: [
                                                            if (globalModal
                                                                    .department[
                                                                        i]
                                                                    .images
                                                                    .length >
                                                                0)
                                                              for (var j = 0;
                                                                  j <
                                                                      globalModal
                                                                          .department[
                                                                              i]
                                                                          .images
                                                                          .length;
                                                                  j++)
                                                                if (globalModal
                                                                            .department[
                                                                                i]
                                                                            .images[j]
                                                                        [
                                                                        'avatar'] !=
                                                                    null)
                                                                  Transform
                                                                      .translate(
                                                                    offset: Offset(
                                                                        j < 0
                                                                            ? -65
                                                                            : j < 1
                                                                                ? -52
                                                                                : j < 2
                                                                                    ? -39
                                                                                    : j < 3
                                                                                        ? -26
                                                                                        : j < 4
                                                                                            ? -13
                                                                                            : 0,
                                                                        0),
                                                                    child:
                                                                        CircleAvatarcustom(
                                                                      image: ApiUrls
                                                                              .ImagebaseUrl +
                                                                          globalModal
                                                                              .department[i]
                                                                              .images[j]['avatar'],
                                                                      height:
                                                                          20,
                                                                      width: 20,
                                                                    ),
                                                                  ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (globalModal
                                                          .departmentPermission[
                                                      'edit'] ||
                                                  globalModal
                                                          .departmentPermission[
                                                      'delete'])
                                                PopupmenuButtonCustom(
                                                  onTapedit: () {
                                                    Navigator.pop(context);
                                                    // head_id = null;
                                                    name.text = globalModal
                                                        .department[i]
                                                        .departmentName;
                                                    branch_id = globalModal
                                                        .department[i]
                                                        .depBranchId;
                                                    if (globalModal
                                                            .department[i]
                                                            .depheadId !=
                                                        null) {
                                                      // head_id=globalModal.department[i].depheadId;
                                                    }
                                                    List users = [];
                                                    for (var j = 0;
                                                        j <
                                                            globalModal
                                                                .departmentUsers
                                                                .length;
                                                        j++) {
                                                      if (globalModal
                                                              .department[i].id
                                                              .toString() ==
                                                          globalModal
                                                              .departmentUsers[
                                                                  j][
                                                                  'department_id']
                                                              .toString()) {
                                                        users.add(globalModal
                                                            .departmentUsers[j]);
                                                      }
                                                    }
                                                    print(
                                                        'user ------------${users}');

                                                    bottomsheet(
                                                      height: 450,
                                                      context: context,
                                                      child: Scaffold(
                                                        body: globalModal.load
                                                            ? CustomLoader()
                                                            : StatefulBuilder(builder:
                                                                (BuildContext
                                                                        context,
                                                                    StateSetter
                                                                        changeState) {
                                                                return SingleChildScrollView(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      vSizedBox4,
                                                                      MainHeadingText(
                                                                        text:
                                                                            'Edit Department',
                                                                        fontSize:
                                                                            20,
                                                                        color: MyColors
                                                                            .black,
                                                                      ),
                                                                      vSizedBox2,
                                                                      CustomTextField(
                                                                        controller:
                                                                            name,
                                                                        hintText:
                                                                            '',
                                                                        label:
                                                                            'Department Name',
                                                                        showlabel:
                                                                            true,
                                                                        labelcolor:
                                                                            MyColors.black,
                                                                      ),
                                                                      vSizedBox2,
                                                                      if (users.length > 0)
                                                                        Text('Assign Department head'),
                                                                      if (users.length > 0)
                                                                        vSizedBox05,
                                                                      if (users.length > 0)
                                                                        Container(
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          height:
                                                                              55,
                                                                          padding:
                                                                              EdgeInsets.all(10),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                MyColors.white,
                                                                            border:
                                                                                Border.all(color: MyColors.blackcolor70),
                                                                            borderRadius:
                                                                                BorderRadius.circular(4),
                                                                          ),
                                                                          child:
                                                                              DropdownButton<String>(
                                                                            underline:
                                                                                Container(
                                                                              height: 8,
                                                                            ),
                                                                            hint:
                                                                                Text('Department Head'),
                                                                            value:globalModal.department[i].depheadId==null?null:globalModal.department[i].depheadId.toString(),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_down_outlined,
                                                                            ),
                                                                            elevation:
                                                                                0,
                                                                            isExpanded:
                                                                                true,
                                                                            alignment:
                                                                                Alignment.centerLeft,
                                                                            style:
                                                                                TextStyle(color: Colors.black),
                                                                            onChanged:
                                                                                (String? newValue) async {
                                                                              globalModal.loadingShow();
                                                                              globalModal.department[i].depheadId = int.parse(newValue!);
                                                                              globalModal.loadingHide();
                                                                              print('id' + globalModal.department[i].depheadId.toString());
                                                                              changeState(() {});
                                                                            },
                                                                            items:
                                                                                users.map((e) {
                                                                              return DropdownMenuItem<String>(
                                                                                value: e['id'].toString(),
                                                                                child: Text(e['name']),
                                                                              );
                                                                            }).toList(),
                                                                          ),
                                                                        ),
                                                                      // CustomTextField(controller: name, hintText: '',
                                                                      //   label: 'Assign Department head',
                                                                      //   showlabel: true,
                                                                      //   labelcolor: MyColors.black,
                                                                      // ),
                                                                      if (users
                                                                              .length >
                                                                          0)
                                                                        vSizedBox2,
                                                                      Text(
                                                                          'Branch'),
                                                                      vSizedBox05,
                                                                      Container(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        height:
                                                                            55,
                                                                        padding:
                                                                            EdgeInsets.all(10),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              MyColors.white,
                                                                          border:
                                                                              Border.all(color: MyColors.blackcolor70),
                                                                          borderRadius:
                                                                              BorderRadius.circular(4),
                                                                        ),
                                                                        child: DropdownButton<
                                                                            String>(
                                                                          underline:
                                                                              Container(
                                                                            height:
                                                                                8,
                                                                          ),
                                                                          hint:
                                                                              Text('Branch'),
                                                                          value:
                                                                              branch_id,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_down_outlined,
                                                                          ),
                                                                          elevation:
                                                                              0,
                                                                          isExpanded:
                                                                              true,
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          style:
                                                                              TextStyle(color: Colors.black),
                                                                          onChanged:
                                                                              (String? newValue) async {
                                                                            globalModal.loadingShow();
                                                                            branch_id =
                                                                                newValue!;
                                                                            globalModal.loadingHide();
                                                                            print('id' +
                                                                                branch_id.toString());
                                                                            changeState(() {});
                                                                          },
                                                                          items: globalModal
                                                                              .departmentBranch
                                                                              .map((e) {
                                                                            return DropdownMenuItem<String>(
                                                                              value: e['id'].toString(),
                                                                              child: Text(e['name']),
                                                                            );
                                                                          }).toList(),
                                                                        ),
                                                                      ),
                                                                      // CustomTextField(controller: name, hintText: '',
                                                                      //   label: 'Branch',
                                                                      //   showlabel: true,
                                                                      //   labelcolor: MyColors.black,
                                                                      // ),
                                                                      vSizedBox2,
                                                                      RoundEdgedButton(
                                                                          text:
                                                                              'Submit',
                                                                          onTap:
                                                                              () async {
                                                                            if (name.text ==
                                                                                '') {
                                                                              showSnackbar(context, 'Please Enter Department name.');
                                                                            } else if (branch_id ==
                                                                                null) {
                                                                              showSnackbar(context, 'Please Select branch .');
                                                                            } else {
                                                                              Map<String, dynamic> data = {
                                                                                'id': globalModal.department[i].id.toString(),
                                                                                'name': name.text,
                                                                                'branch': branch_id.toString(),
                                                                              };
                                                                              if (globalModal.department[i].depheadId != null) {
                                                                                data['employee'] = globalModal.department[i].depheadId.toString();
                                                                              }
                                                                              globalModal.loadingShow();
                                                                              print('datat for api- ${data}');
                                                                              var res = await Webservices.postData(apiUrl: ApiUrls.updateDepartment, body: data, context: context);
                                                                              globalModal.loadingHide();
                                                                              Navigator.pop(context);
                                                                              if (res['success'].toString() == 'true') {
                                                                                showSnackbar(context, res['message']);
                                                                                search.text='';

                                                                                name.text = '';
                                                                                branch_id = null;

                                                                                globalModal.getDepartment(context);
                                                                              } else {
                                                                                showSnackbar(context, res['message']);
                                                                              }
                                                                            }
                                                                          }),
                                                                      vSizedBox4,
                                                                    ],
                                                                  ),
                                                                );
                                                              }),
                                                      ),
                                                    );
                                                  },
                                                  deletemain:
                                                      'Delete This Department',
                                                  deletesub:
                                                      'Do you wish to delete this Department ?',
                                                  isEdit: globalModal
                                                          .departmentPermission[
                                                      'edit'],
                                                  DeleteFun: () async {
                                                    Navigator.pop(context);

                                                    search.text='';

                                                    Map<String, dynamic> data =
                                                        {
                                                      'id': globalModal.department[i].id.toString()
                                                        };
                                                    // globalModal.loadingShow();
                                                    var res = await Webservices
                                                        .postData(
                                                            apiUrl: ApiUrls
                                                                .deleteDepartment,
                                                            body: data,
                                                            context: context);
                                                    // globalModal.loadingHide();
                                                    print('dekleder-------------${res}');
                                                    globalModal.getDepartment(MyGlobalKeys.navigatorKey.currentContext);
                                                    showSnackbar(context, res['message'].toString());
                                                    // Navigator.of(context).pop();
                                                    // if(res['success'].toString()=='true'){
                                                    //   showSnackbar(context, res['message'].toString());
                                                    // }
                                                    // else{
                                                    //   showSnackbar(context, res['message'].toString());
                                                    //
                                                    // }

                                                  },
                                                  isDelete: globalModal
                                                          .departmentPermission[
                                                      'delete'],
                                                )
                                            ],
                                          ),
                                          // Divider(height: 40, color: Color(0xFFCAD8D8),)
                                        ],
                                      ),
                                    ),
                                    vSizedBox,
                                  ],
                                ),
                              );
                            }
                            if (count1 == 0 &&
                                i == globalModal.department.length - 1)
                              return Container(
                                height: 400,
                                child: Center(
                                  child: Text('No Department found.'),
                                ),
                              );
                            return Container();
                          },
                        ),
                      ),
                    ),

                  ],
                ),
        );
      }),
    );
  }
}
