// import 'dart:developer';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:salaryredesign/constants/colors.dart';
// import 'package:salaryredesign/constants/image_urls.dart';
// import 'package:salaryredesign/constants/sized_box.dart';
// import 'package:salaryredesign/functions/navigation_functions.dart';
// import 'package:salaryredesign/widgets/CustomLoader.dart';
// import 'package:salaryredesign/widgets/CustomTexts.dart';
// import 'package:salaryredesign/widgets/appbar.dart';
// import 'package:salaryredesign/widgets/buttons.dart';
// import 'package:salaryredesign/widgets/custom_widgets.dart';
// import 'package:salaryredesign/widgets/dropdown.dart';
//
// import '../../constants/globalkeys.dart';
// import '../../modals/holiday.dart';
// import '../../providers/clock.dart';
// import '../../services/api_urls.dart';
// import '../../services/webservices.dart';
// import '../../widgets/avatar.dart';
// import '../../widgets/customtextfield.dart';
// import '../../widgets/multi_select_dropdwon.dart';
// import '../../widgets/new_dropdown.dart';
// import '../../widgets/showSnackbar.dart';
// import 'package:intl/intl.dart';
// import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
// import 'package:multi_select_flutter/util/multi_select_item.dart';
// import 'package:multi_select_flutter/util/multi_select_list_type.dart';
// import 'package:getwidget/getwidget.dart';
//
// import 'add_holiday_branch.dart';
// class Holiday_Management_Page extends StatefulWidget {
//   const Holiday_Management_Page({Key? key}) : super(key: key);
//
//   @override
//   State<Holiday_Management_Page> createState() => _Holiday_Management_PageState();
// }
//
// class _Holiday_Management_PageState extends State<Holiday_Management_Page> {
//   TextEditingController name = TextEditingController();
//   TextEditingController date = TextEditingController();
//   TextEditingController branch = TextEditingController();
//   TextEditingController department = TextEditingController();
//   TextEditingController dummy = TextEditingController();
//
//   List selected123=[];
//   Map? selectedValue;
//   List IDs=[];
//   List image=[
//     MyImages.avtarone,
//     MyImages.avatr8,
//     MyImages.avatr3,
//     MyImages.avatr4,
//     MyImages.avatr5,
//     MyImages.avatr6,
//   ];
//   List departmentHoliday=[];
//   List holiday = [];
//   List departhhh=[];
//   Map dep={};
//   Map branc={};
//   List depart=[];
//   List holidayData=[];
//   List departmentBranch=[];
//
//   text(g,gg){
//     log('text(globalModal.holiday[i].branchId[j],globalModal),------------${gg.branc.toString()}');
//     return gg.branc[g.toString()]!=null?
//     gg.branc[g.toString()]['name'].toString():'${gg.branc[g.toString()]}';
//   }
//   // getHoliday()async{
//   // print(" getHoliday()async{");
//   //   await Provider.of<GlobalModal>(context, listen: true)
//   //       .getHoliday(context,'0','0');
//   // print(" end of ptovider-----------------------");
//   // // Future.delayed(Duration(seconds:5)).then((value) async {
//   // //   print('settome');
//   // //   setState(() {
//   // //
//   // //   });
//   // // });
//   //
//   //
//   // }
//   getHoliday123(String search_branch,String search_department) async {
//     holiday = [];
//     departhhh=[];
//     await Provider.of<GlobalModal>(context, listen: false).loadingShow();
//     // notifyListeners();
//
//     Map<String,dynamic>data={
//       'search_branch':search_branch.toString()==''?'0':search_branch.toString(),
//       'search_department':search_department.toString()==''?'0':search_department.toString()
//     };
//     log('data data data--------------${data}');
//
//     var res = await Webservices.postData(apiUrl:ApiUrls.listholiday,  body:data, context: context);
//     await Provider.of<GlobalModal>(context, listen: false).loadingHide();
//
//
//     log('res from api listholiday ---------------${res}');
//     holidayData=res['data'];
//
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
//       branc[res['data']['branch'][i]['id'].toString()]=res['data']['branch'][i];
//
//     }
//     for (var i = 0; i < res['data']['department'].length; i++) {
//       dep[res['data']['department'][i]['id'].toString()]=res['data']['department'][i];
//
//     }
//     log('dep------------${dep}');
//     log('branc------------${branc}');
//     await Provider.of<GlobalModal>(context, listen: false).updateHoliday( res['data']['holiday']);
//
//     setState(() {
//
//     });
//
//
//   }
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     getHoliday123('0','0');
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyColors.scaffold,
//       appBar: appBar(context: context, title: 'Holiday Management', titlecenter: false),
//       body: Consumer<GlobalModal>(builder: (context, globalModal, child) {
//         return globalModal.load?CustomLoader():SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   // borderRadius: BorderRadius.only(
//                   //   bottomLeft: Radius.circular(30),
//                   //   bottomRight: Radius.circular(30),
//                   // )
//                 ),
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         MainHeadingText(text: 'Holiday Management', fontSize: 20,),
//                         hSizedBox,
//                         hSizedBox05,
//                         RoundEdgedButton(
//                           text: 'Add New',
//                           verticalPadding: 0,
//                           color: MyColors.primaryColor,
//                           width: 80,
//                           horizontalPadding: 0,
//                           height: 35,
//                           onTap: (){
//                             bool isShow=false;
//                             date.text='';
//                             name.text='';
//                             dummy.text='';
//                             bottomsheet(
//                               height: 450,
//                               context: context,
//                               child:
//                               Scaffold(
//                                 body: StatefulBuilder(
//                                     builder: (context,setState) {
//                                       return SingleChildScrollView(
//                                         child: Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             vSizedBox4,
//                                             MainHeadingText(text: 'Add Holiday', fontSize: 20, color: MyColors.black,),
//                                             vSizedBox2,
//                                             GestureDetector(
//                                               onTap: ()async{
//                                                 var m = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(DateTime.now().year-50), lastDate: DateTime(DateTime.now().year+105));
//                                                 if(m!=null){
//                                                   DateFormat formatter = DateFormat('yyyy-MM-dd');
//                                                   String formatted = formatter.format(m);
//                                                   date.text=formatted;
//                                                   // print('checking date------${formatted}');
//                                                 }
//                                               },
//                                               child: CustomTextField(controller: date, hintText: '',
//                                                 label: 'Choose Date',
//                                                 showlabel: true,
//                                                 labelcolor: MyColors.black,
//                                                 // prefixIcon: MyImages.date,
//                                                 suffixheight: 25,
//                                                 paddingsuffix: 20,
//                                                 enabled: false,
//                                               ),
//                                             ),
//                                             vSizedBox2,
//                                             CustomTextField(controller: name, hintText: '',
//                                               label: 'Holiday Name',
//                                               showlabel: true,
//                                               labelcolor: MyColors.black,
//                                             ),
//
//                                             vSizedBox,
//                                             GestureDetector(
//                                               onTap: () async {
//
//                                                 IDs=await push(context: context, screen: SelectBranchPage());
//                                                 print('132354646------------${IDs.toString()}');
//                                                 dummy.text=IDs[0]['branchName'].toString().substring(1,IDs[0]['branchName'].toString().length-1)+','+IDs[0]['depName'].toString().substring(1,IDs[0]['depName'].toString().length-1);
//                                                 setState((){});
//                                               },
//                                               child:  CustomTextField(controller: dummy, hintText: '',
//                                                 label: 'Choose Department',
//                                                 showlabel: true,
//                                                 labelcolor: MyColors.black,
//                                                 // prefixIcon: MyImages.date,
//                                                 suffixheight: 25,
//                                                 paddingsuffix: 20,
//                                                 enabled: false,
//                                               ),
//                                             ),
//
//                                             vSizedBox2,
//                                             Row(
//                                               children: [
//                                                 Expanded(
//                                                   child: RoundEdgedButton(
//                                                     text: 'Cancel',
//                                                     onTap: (){
//                                                       Navigator.pop(context);
//                                                     },
//                                                     color: MyColors.scaffold,
//                                                     textColor: MyColors.black,
//                                                     fontSize: 16,
//                                                     fontfamily: 'bold',
//                                                   ),
//                                                 ),
//                                                 hSizedBox,
//                                                 Expanded(
//                                                   child: RoundEdgedButton(
//                                                     text: 'Save',
//                                                     onTap: ()async{
//                                                       if(date.text==''){
//                                                         showSnackbar(context, 'Please Enter date.');
//                                                       }else if(name.text==''){
//                                                         showSnackbar(context, 'Please Enter name.');
//                                                       }
//
//                                                       else{
//                                                         Map<String,dynamic>data={
//                                                           'holiday_name':name.text,
//                                                           'holiday_date':date.text,
//                                                           'branch_id':IDs[0]['branchId'].toString().substring(1,IDs[0]['branchId'].toString().length-1),
//                                                           'department_id':IDs[0]['depIds'].toString().substring(1,IDs[0]['depIds'].toString().length-1),
//                                                         };
//                                                         print("datat---depIds-----${data}");
//                                                         var res = await Webservices.postData(apiUrl: ApiUrls.storeHoliday, body: data, context: context);
//                                                         log("res from apiii--------${res}");
//
//                                                         if(res['success'].toString()=='true'){
//                                                           showSnackbar(context, res['message']);
//                                                           Navigator.pop(context);
//                                                           await globalModal.getHoliday(MyGlobalKeys.navigatorKey.currentContext, '0', '0');
//                                                         }
//
//                                                       }
//                                                     },
//                                                     fontSize: 16,
//                                                     fontfamily: 'bold',
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             vSizedBox4,
//                                           ],
//                                         ),
//                                       );
//                                     }
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                         // hSizedBox05,
//                         GestureDetector(
//                           onTap: (){
//
//                             TextEditingController filterbranch=TextEditingController();
//                             TextEditingController filterdep=TextEditingController();
//                             print('object -------------${filterbranch.text}');
//                             filterbranch.text='';
//                             filterdep.text='';
//                             bottomsheet(
//                               height: 360,
//                               context: context,
//                               child:StatefulBuilder(
//                                   builder: (context,setState) {
//                                     return Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         vSizedBox4,
//                                         MainHeadingText(
//                                           text: 'Filter',
//                                           fontSize: 20,
//                                           color: MyColors.black,
//                                         ),
//                                         DropDwonNew(
//                                           islabel: true,
//                                           label: 'Select Branch',
//                                           selectedValue:filterbranch.text==''?null:filterbranch.text,
//                                           items: globalModal.departmentBranchAll.map((e) {
//                                             return DropdownMenuItem<String>(
//                                               value: e['id'].toString(),
//                                               child: Text(e['name'].toString()),
//                                             );
//                                           }).toList(),
//                                           onChange: (String? value ) {
//                                             if(value!=null){
//                                               print('value'+value);
//                                               filterbranch.text=value.toString();
//                                               filterdep.text='';
//                                               globalModal.getdepart(filterbranch.text);
//
//                                             }
//                                             setState((){});
//                                           },
//                                         ),
//                                         // if(globalModal.depart.length>0)
//
//                                         DropDwonNew(
//                                           islabel: true,
//                                           label:'Select Department',
//                                           selectedValue:filterdep.text==''?null:filterdep.text,
//                                           items: globalModal.depart.map((e) {
//                                             return DropdownMenuItem<String>(
//                                               value: e['id'].toString(),
//                                               child: Text(e['name'].toString()),
//                                             );
//                                           }).toList(),
//                                           onChange: (String? value ) {
//                                             if(value!=null){
//                                               print('value'+value);
//                                               filterdep.text=value.toString();
//
//                                             }
//                                             setState((){});
//                                           },
//                                         ),
//                                         // DropDwon(
//                                         //   islabel: true,
//                                         //   label: 'Select Department',
//                                         //   items: [''],
//                                         // ),
//                                         vSizedBox2,
//                                         RoundEdgedButton(
//                                           text: 'SEARCH',
//                                           onTap: ()async{
//                                             print('fyjfffffffffffff ----------');
//                                             Navigator.pop(context);
//                                             await globalModal.getHoliday(MyGlobalKeys.navigatorKey.currentContext, filterbranch.text, filterdep.text);
//
//                                           },
//                                         ),
//                                         vSizedBox4,
//                                       ],
//                                     );
//                                   }
//                               ),
//                             );
//                           },
//                           child: Image.asset(MyImages.filter, height: 24,),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               vSizedBox,
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 // height: MediaQuery.of(context).size.height,
//                 // padding: EdgeInsets.all(16),
//                 color: Colors.white,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Text('${globalModal.holiday.length.toString()}'),
//                     vSizedBox,
//                     if(globalModal.holiday.length==0)
//                       Container(
//                           height: 500,
//                           child: Center(child: Text('No data Found'),)),
//                     if(globalModal.holiday.length>0)
//                       for(var i=0; i<globalModal.holiday.length; i++)
//                         Column(
//                           children: [
//                             Container(
//                               padding: EdgeInsets.all(16),
//                               decoration: BoxDecoration(
//                                   color: MyColors.white
//                               ),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Expanded(
//                                         child: Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             ParagraphText(
//                                               text:globalModal.holiday[i].holiday_date.toString(),
//                                               color: MyColors.primaryColor,
//                                               fontSize: 14,
//                                             ),
//                                             vSizedBox05,
//                                             MainHeadingText(
//                                               text: '${globalModal.holiday[i].holiday_name}', color: MyColors.black, fontFamily: 'semibold', fontSize: 16,),
//                                             vSizedBox2,
//                                             ParagraphText(
//                                               text: 'Applied on',
//                                               fontSize: 14,
//                                               fontFamily: 'bold',
//                                               color: MyColors.bordercolor,
//                                             ),
//                                             vSizedBox05,
//                                             if(globalModal.holiday[i].branchId.length==0)
//                                               ParagraphText(
//                                                 text: 'All Branches & All Departments',
//                                                 fontSize: 16,
//                                               ),
//                                             if(globalModal.holiday[i].branchId.length>0)
//                                               for(int j=0 ; j<globalModal.holiday[i].branchId.length; j++)
//                                                 ParagraphText(
//
//                                                   text:text(globalModal.holiday[i].branchId[j],globalModal),
//                                                   fontSize: 16,
//                                                   color: MyColors.black,
//                                                 ),
//                                             for(int j=0 ; j<globalModal.holiday[i].departmentId.length; j++)
//                                               ParagraphText(
//                                                 text:globalModal.dep[globalModal.holiday[i].departmentId[j].toString()]!=null?
//                                                 globalModal.dep[globalModal.holiday[i].departmentId[j].toString()]['name'].toString():'',
//                                                 fontSize: 16,
//                                                 // color: MyColors.black,
//                                               ),
//                                           ],
//                                         ),
//                                       ),
//                                       PopupmenuButtonCustom(
//                                         issubheading: false,
//                                         editbtn: false,
//                                         deletemain: 'Are you sure you want to delete this holiday.',
//                                         deletesub: 'Do you wish to delete this holiday ?',
//                                         isEdit: false,
//                                         isDelete: true,
//                                         DeleteFun: ()async{
//                                           Navigator.pop(context);
//                                           Map<String, dynamic> data =
//                                           {
//                                             'id': globalModal.holiday[i].id.toString()
//                                           };
//                                           var res = await Webservices
//                                               .postData(
//                                               apiUrl: ApiUrls
//                                                   .deleteHoliday,
//                                               body: data,
//                                               context: context);
//                                           print('dekleder-------------${res}');
//                                           await globalModal.getHoliday(MyGlobalKeys.navigatorKey.currentContext,'0','0');
//                                           showSnackbar(context, res['message'].toString());
//
//                                         },
//                                       )
//
//                                     ],
//                                   ),
//                                   // Divider(height: 40, color: Color(0xFFCAD8D8),)
//
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                               child: Divider(height: 10,),
//                             )
//                           ],
//                         ),
//
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       }
//       ),
//     );
//   }
// //  dropdwon123() async {
// //   return Container(
// //     child: Column(
// //       children: [
// //         for(int i=0; i<await Provider.of<GlobalModal>(context, listen: false).departmentBranchAll.length;i++)
// //         Text('${Provider.of<GlobalModal>(context, listen: false).branch[i].branchName}'),
// //         // Row(
// //         //        children: [
// //         //          Checkbox(
// //         //              value: de['checked'],
// //         //              activeColor: Colors.blue,
// //         //              onChanged:( newValue){
// //         //                print(newValue);
// //         //                setState(() {
// //         //                  if(newValue!=null)
// //         //                    category['checked'] = newValue;
// //         //                });
// //         //                // Text('Remember me',style: TextStyle(color: Colors.black26),);
// //         //              }
// //         //          ),
// //         //          Text(category['title'],style: TextStyle(color: Colors.black),),
// //         //
// //         //
// //         //        ],
// //         //      ),
// //    //
// //
// //       ],
// //     ),
// //   );
// // }
// // Widget cate_widget(category,int c){
// //
// //   return Container(
// //     padding: EdgeInsets.only(left: c*30),
// //     child: Column(
// //         children: [
// //           Row(
// //             children: [
// //               Checkbox(
// //                   value: category['checked'],
// //                   activeColor: Colors.blue,
// //                   onChanged:( newValue){
// //                     print(newValue);
// //                     setState(() {
// //                       if(newValue!=null)
// //                         category['checked'] = newValue;
// //                     });
// //                     // Text('Remember me',style: TextStyle(color: Colors.black26),);
// //                   }
// //               ),
// //               Text(category['title'],style: TextStyle(color: Colors.black),),
// //
// //
// //             ],
// //           ),
// //
// //         ]),
// //   );
// // }
// //
// //
// // List<Widget>categories_list(parent){
// //   List<Widget> cate=[];
// //   for(var i=0;i<categories.length;i++){
// //
// //
// //     if(categories[i]['parent'].toString()==parent){
// //       cate.add(cate_widget(categories[i],0));
// //
// //       for(var j=0;j<categories.length;j++) {
// //         if (categories[i]['id'].toString() ==
// //             categories[j]['parent'].toString() && categories[i]['checked']==true) {
// //           cate.add(cate_widget(categories[j], 1));
// //
// //           // for (var k = 0; k < categories.length; k++) {
// //           //   if (categories[j]['id'].toString() == categories[k]['parent'].toString() && categories[j]['checked']==true) {
// //           //     cate.add(cate_widget(categories[k], 2));
// //           //   }
// //           // }
// //         }
// //
// //
// //       }
// //     }
// //
// //   };
// //   return cate;
// // }
// // Widget dropdown123(globalModal){
// //     return            Container(
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.start,
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           for(int i=0; i<globalModal.departmentBranch.length;i++)
// //             Column(
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text('${globalModal.departmentBranch[i]['name']}',textAlign: TextAlign.start,),
// //                 for(int j=0; j<globalModal.departhhh.length;j++)
// //                   if(globalModal.departhhh[j]['b_id'].toString()==globalModal.departmentBranch[i]['id'].toString())
// //                   Padding(
// //                     padding: const EdgeInsets.only(left: 16),
// //                     child: Row(
// //                       children: [
// //                         // Text(globalModal.departhhh[i]['checked'].toString()),
// //                         Checkbox(value: globalModal.departhhh[j]['checked'], onChanged: (bool? newValue){
// //                           if(newValue!=null){
// //                             globalModal.departhhh[j]['checked']=newValue;
// //
// //                             setState((){});
// //                           }
// //
// //
// //                         }
// //                         ),
// //                         Text('${globalModal.departhhh[i]['name']}',textAlign: TextAlign.start,),
// //                       ],
// //                     ),
// //                   ),
// //               ],
// //             ),
// //
// //
// //
// //
// //
// //
// //
// //           // Row(
// //           //        children: [
// //           //          Checkbox(
// //           //              value: de['checked'],
// //           //              activeColor: Colors.blue,
// //           //              onChanged:( newValue){
// //           //                print(newValue);
// //           //                setState(() {
// //           //                  if(newValue!=null)
// //           //                    category['checked'] = newValue;
// //           //                });
// //           //                // Text('Remember me',style: TextStyle(color: Colors.black26),);
// //           //              }
// //           //          ),
// //           //          Text(category['title'],style: TextStyle(color: Colors.black),),
// //           //
// //           //
// //           //        ],
// //           //      ),
// //           //
// //
// //         ],
// //       ),
// //     );
// // }
// }
