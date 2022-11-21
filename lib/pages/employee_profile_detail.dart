import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/constans.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/employee/edit_profile.dart';
import 'package:salaryredesign/pages/payroll/advance.dart';
import 'package:salaryredesign/pages/payroll/bonus.dart';
import 'package:salaryredesign/pages/payroll/deduction.dart';
import 'package:salaryredesign/pages/payroll/loan.dart';
import 'package:salaryredesign/pages/payroll/pay_per_work.dart';
import 'package:salaryredesign/pages/payroll/salary_slip.dart';
import 'package:salaryredesign/pages/payroll/tds_deductions.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/avatar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/customLoader.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';
// import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../constants/sized_box.dart';
import '../providers/clock.dart';
import '../services/api_urls.dart';
import '../services/webservices.dart';
import 'dart:convert' as convert;

import '../widgets/calender/my_calendar.dart';
import '../widgets/calender/src/customization/calendar_style.dart';
import '../widgets/calender/src/customization/header_style.dart';
import 'package:pie_chart/pie_chart.dart';

class Employee_Profile_Details extends StatefulWidget {
  const Employee_Profile_Details({Key? key}) : super(key: key);

  @override
  State<Employee_Profile_Details> createState() =>
      _Employee_Profile_DetailsState();
}

bool one = true;
bool two = false;
bool three = false;

class _Employee_Profile_DetailsState extends State<Employee_Profile_Details> {
  TextEditingController custom = TextEditingController();
 Map attendanceStatus= {};
 Map attendance_count= {};
 List data=[];
 Map<String,Color> color_type={
   // "type1":Colors.blue,
   // "type2":Colors.red,
   // "type3":Colors.orange,
   // "type4":Colors.deepPurple,
   "1": Colors.green,
   "2": Colors.orange,
  "3": Colors.red,
  "4": Colors.lightBlueAccent,
  "5": Colors.blue,
  "6": Colors.greenAccent,
  "7": Colors.deepPurple,
  "8": Colors.white,
  "9": Colors.white,
  "10":Colors.white,
  "11":MyColors.secondarycolor,
  "12": Colors.grey,
  "13": Colors.white,
  "14": Colors.white
 };
  final dataMap = <String, double>{
    "Presnt":0,
    "absent": 0,
    "paid leave":00.1,
    "weekoff": 00,
    "full day":00,
    "half day":00,
    "paid half":00,
    "unpaid":00,
    "public":00,
    "compoff":00,
    "unpaid half":00,

  };

  final colorList = <Color>[
    MyColors.secondarycolor,
    Colors.red,
    Colors.green,
    Colors.grey,
    MyColors.primaryColor,
    Colors.yellow,
    Colors.yellowAccent,
    Colors.lightGreen,
    MyColors.secondarycolor,
    Colors.red,
    Colors.lightGreenAccent,

  ];

 List datae =[
   {
     "type":"type1",
     "date":DateTime.parse("2022-11-22 00:00:00.000")
   },
   {
     "type":"type2",
     "date":DateTime.parse("2022-11-25 00:00:00.000")
   },   {
     "type":"type3",
     "date":DateTime.parse("2022-11-11 00:00:00.000")
   },
   {
     "type":"type4",
     "date":DateTime.parse("2022-11-14 00:00:00.000")
   },
   {
     "type":"type2",
     "date":DateTime.parse("2022-11-15 00:00:00.000")
   },
   {
     "type":"type1",
     "date":DateTime.parse("2022-11-16 00:00:00.000")
   },
   {
     "type":"type3",
     "date":DateTime.parse("2022-11-17 00:00:00.000")
   },

 ];
  DateTime Selecteddate = DateTime.now();
  getdetail(DateTime date)async{
    Provider.of<GlobalModal>(context, listen: false).loadingShow();
    Map<String,dynamic>data={};
    if(date==DateTime.now()){
      Selecteddate=DateTime.now();
    }else{
      Selecteddate=date;
      data['year']=date.year.toString();
      data['month']=date.month.toString();
    }
print('data----------year -----------month -----------$data');
    var res = await Webservices.postData(apiUrl: ApiUrls.employeeattendance, body: data,context:context);
    Provider.of<GlobalModal>(context, listen: false).loadingHide();
    log('res from new api -----------$res');
    datae=res['data'];
    attendanceStatus=res['attendanceStatus'];
    attendance_count=res['attendance_count'];
    dataMap['Presnt']=double.parse(attendance_count['1'].toString());
    dataMap['absent']=double.parse(attendance_count['3'].toString());
    dataMap['paid leave']=double.parse(attendance_count['5'].toString());
    dataMap['weekoff']=double.parse(attendance_count['12'].toString());
    dataMap['full day']=attendance_count['2']!=null?double.parse(attendance_count['2'].toString()):0;
    dataMap['half day']=attendance_count['4']!=null?double.parse(attendance_count['4'].toString()):0;
    dataMap['paid half']=attendance_count['0']!=null?double.parse(attendance_count['2'].toString()):0;
    dataMap['unpaid']=attendance_count['6']!=null?double.parse(attendance_count['6'].toString()):0;
    dataMap['public']=attendance_count['11']!=null?double.parse(attendance_count['11'].toString()):0;
    dataMap['compoff']=attendance_count['0']!=null?double.parse(attendance_count['2'].toString()):0;
    dataMap['unpaid half']=attendance_count['0']!=null?double.parse(attendance_count['2'].toString()):0;

    // Provider.of<GlobalModal>(context, listen: false).getAttendance(res['data']);
    setState(() {

    });
    // var jsonResponse = convert.jsonDecode(res.body);
    // log('res from new api -----jsonResponse------$jsonResponse');
  }
  @override
  void initState() {
    // TODO: implement initState
    getdetail(DateTime.now());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(
          context: context,
          titlecenter: true,
          title: 'Attendence Details',
          actions: [
            // IconButton(
            //     onPressed: () {
            //       bottomsheet(
            //           height: 300,
            //           context: context,
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               vSizedBox4,
            //               Container(
            //                 width: MediaQuery.of(context).size.width,
            //                 child: MainHeadingText(
            //                   text: 'Noelle Chambers',
            //                   fontSize: 16,
            //                   color: Colors.black,
            //                   fontFamily: 'bold',
            //                   textAlign: TextAlign.center,
            //                 ),
            //               ),
            //               vSizedBox4,
            //               list_with_icon(
            //                 text: 'Share Employee App',
            //                 img: MyImages.share,
            //                 color: MyColors.paragraphcolor,
            //                 fontSize: 16,
            //               ),
            //               vSizedBox2,
            //               list_with_icon(
            //                 text: 'Call Employee',
            //                 img: MyImages.call_outline,
            //                 color: MyColors.paragraphcolor,
            //                 fontSize: 16,
            //               ),
            //               vSizedBox2,
            //               list_with_icon(
            //                 text: 'WhatsApp Employee',
            //                 img: MyImages.whatsapp_outline,
            //                 color: MyColors.paragraphcolor,
            //                 fontSize: 16,
            //               ),
            //               vSizedBox2,
            //               list_with_icon(
            //                 text: 'Inactive Employee',
            //                 img: MyImages.inactive,
            //                 color: MyColors.paragraphcolor,
            //                 fontSize: 16,
            //               ),
            //               vSizedBox2,
            //               GestureDetector(
            //                 child: list_with_icon(
            //                   text: 'Delete Employee',
            //                   img: MyImages.bin,
            //                   color: MyColors.paragraphcolor,
            //                   fontSize: 16,
            //                 ),
            //                 onTap: () {
            //                   Navigator.pop(context);
            //                   showCustomDialogBox(
            //                       context: context,
            //                       child: Column(
            //                         children: [
            //                           Stack(
            //                             children: [
            //                               Container(
            //
            //                                 child: MainHeadingText(
            //                                   text: 'Delete Staff',
            //                                   fontFamily: 'bold',
            //                                   fontSize: 20,
            //                                   textAlign: TextAlign.center,
            //                                 ),
            //                                 width: MediaQuery.of(context).size.width,
            //                               ),
            //                               Positioned(
            //                                   right: 0,
            //                                   top: 0,
            //                                   child: GestureDetector(
            //                                       child: Icon(Icons.close, size: 20,),
            //                                     onTap: (){
            //                                         Navigator.pop(context);
            //                                     },
            //                                   )
            //                               ),
            //                             ],
            //                           ),
            //                           vSizedBox2,
            //                           ParagraphText(
            //                             text:
            //                                 'Are you absolutely sure you want to delete Elavarasan?\n\nOnce you delete the employee, then all the records will be deleted, it will not be possible to recover the records ". You can change the employee status to inactive.',
            //                             fontSize: 16,
            //                             color: MyColors.labelcolor,
            //                           ),
            //                           vSizedBox,
            //                           CustomTextField(
            //                               controller: custom, hintText: ''),
            //                           vSizedBox05,
            //                           Container(
            //                             width:
            //                                 MediaQuery.of(context).size.width,
            //                             child: ParagraphText(
            //                               textAlign: TextAlign.start,
            //                               text: 'Elavarasan',
            //                               color: MyColors.black,
            //                               fontSize: 14,
            //                             ),
            //                           ),
            //                           vSizedBox,
            //                           Row(
            //                             mainAxisAlignment:
            //                                 MainAxisAlignment.center,
            //                             children: [
            //                               Expanded(
            //                                   child: RoundEdgedButton(
            //                                 text: 'Cancel',
            //                                 color: Color(0xFFF3F4F6),
            //                                 textColor: MyColors.black,
            //                               )),
            //                               hSizedBox,
            //                               Expanded(
            //                                   child: RoundEdgedButton(
            //                                 text: 'Delete',
            //                               )),
            //                             ],
            //                           )
            //                         ],
            //                       )) ;
            //                 },
            //               ),
            //             ],
            //           ));
            //     },
            //     icon: Icon(Icons.more_vert_rounded))
          ]),
      body: Consumer<GlobalModal>(
        builder: (context,globalModal,child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: MyColors.primaryColor,
                  child: Column(
                    children: [
                      hSizedBox,
                      CircleAvatarcustom(
                        borderradius: 100,
                        image: '${globalModal.userData!.profile_img}',
                        isnetwork: true,
                        height: 120,
                        width: 120,
                      ),
                      vSizedBox,
                      MainHeadingText(
                        text: '${globalModal.userData!.name}',
                        color: MyColors.white,
                        fontSize: 24,
                      ),
                      vSizedBox05,
                      // MainHeadingText(
                      //   text: 'Branch Manager',
                      //   color: MyColors.white,
                      //   fontSize: 16,
                      // ),
                      // vSizedBox2,
                      // RoundEdgedButton(
                      //   text: 'Edit Profile',
                      //   color: MyColors.white,
                      //   textColor: MyColors.primaryColor,
                      //   width: 132,
                      //   height: 27,
                      //   fontSize: 14,
                      //   horizontalMargin: 0,
                      //   horizontalPadding: 0,
                      //   verticalPadding: 0,
                      //   onTap: (){
                      //     push(context: context, screen: Edit_Employee_Profile_Page());
                      //   },
                      // ),
                      // vSizedBox2
                    ],
                  ),
                ),
                // Container(
                //   color: MyColors.white,
                //   padding: EdgeInsets.all(16),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       RoundEdgedButton(
                //         text: 'ATTENDANCE',
                //         color: one ? MyColors.yellow : MyColors.white,
                //         textColor: one ? MyColors.white : MyColors.black,
                //         minWidth: 0,
                //         height: 27,
                //         fontSize: 14,
                //         // horizontalMargin: 0,
                //         horizontalPadding: 10,
                //         verticalPadding: 0,
                //         onTap: () {
                //           setState(() {
                //             one = true;
                //             two = false;
                //             three = false;
                //           });
                //         },
                //       ),
                //       RoundEdgedButton(
                //         text: 'PAYROLL',
                //         color: two ? MyColors.yellow : MyColors.white,
                //         textColor: two ? MyColors.white : MyColors.black,
                //         minWidth: 0,
                //         height: 27,
                //         fontSize: 14,
                //         // horizontalMargin: 0,
                //         horizontalPadding: 10,
                //         verticalPadding: 0,
                //         onTap: () {
                //           setState(() {
                //             one = false;
                //             two = true;
                //             three = false;
                //           });
                //         },
                //       ),
                //       RoundEdgedButton(
                //         text: 'TRANSACTION',
                //         color: three ? MyColors.yellow : MyColors.white,
                //         textColor: three ? MyColors.white : MyColors.black,
                //         minWidth: 0,
                //         height: 27,
                //         fontSize: 14,
                //         // horizontalMargin: 0,
                //         horizontalPadding: 10,
                //         verticalPadding: 0,
                //         onTap: () {
                //           setState(() {
                //             one = false;
                //             two = false;
                //             three = true;
                //           });
                //         },
                //       ),
                //     ],
                //   ),
                // ),
                vSizedBox,
                // if(one)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainHeadingText(
                                text: '${DateFormat('MMM').format(Selecteddate)} ${DateFormat('yyyy').format(Selecteddate)}',
                                color: MyColors.other,
                                fontSize: 16,
                                fontFamily: 'bold',
                              ),
                              vSizedBox,
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  height: 100,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          // CircleAvatarcustom(
                                          //   image: MyImages.progress_att,
                                          //   fit: BoxFit.fitHeight,
                                          //   imgheight: 50,
                                          //   imgwidth: 50,
                                          // ),
                                          Container(
                                            height: 90,
                                            width: 90,
                                            child: PieChart(
                                              dataMap: dataMap,
                                              chartType: ChartType.ring,
                                              // baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                                              colorList: colorList,
                                              chartValuesOptions: ChartValuesOptions(
                                                showChartValuesInPercentage: false,
                                                showChartValueBackground: false,
                                                showChartValuesOutside: false,
                                                showChartValues: false,

                                              ),
                                              legendOptions: LegendOptions(
                                                showLegendsInRow: true,
                                                legendPosition: LegendPosition.bottom,
                                                showLegends: false,
                                                // legendShape: _BoxShape.circle,
                                                legendTextStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              ringStrokeWidth: 5,
                                              initialAngleInDegree: -90,
                                              chartLegendSpacing: 30,
                                              totalValue: 30,
                                              centerText: '',
                                              baseChartColor: MyColors.primaryColor,
                                              centerTextStyle: TextStyle(
                                                  color: MyColors.primaryColor,
                                                  fontSize: 24,
                                                  fontFamily: 'bold'
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      hSizedBox2,
                                      // for(int i=0;i<20;i++)
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ParagraphText(
                                            text: '${attendance_count['1']??'0'}',
                                            fontSize: 24,
                                            fontFamily: 'bold',
                                            color: MyColors.secondarycolor,
                                          ),
                                          vSizedBox05,
                                          ParagraphText(
                                              text: 'Present',
                                              fontSize: 14,
                                              color: MyColors.labelcolor),

                                        ],

                                      ),
                                      hSizedBox2,Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ParagraphText(
                                            text: '${attendance_count['3']??'0'}',
                                            fontSize: 24,
                                            fontFamily: 'bold',
                                            color: MyColors.red,
                                          ),
                                          vSizedBox05,
                                          ParagraphText(
                                              text: 'Absent',
                                              fontSize: 14,
                                              color: MyColors.labelcolor),

                                        ],

                                      ),


                                      hSizedBox2,Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ParagraphText(
                                            text: '${attendance_count['4']??'0'}',
                                            fontSize: 24,
                                            fontFamily: 'bold',
                                            color: MyColors.yellow,
                                          ),
                                          vSizedBox05,
                                          ParagraphText(
                                              text: 'Half day',
                                              fontSize: 14,
                                              color: MyColors.labelcolor),

                                        ],

                                      ),
                                      // hSizedBox2,
                                      // Column(
                                      //   mainAxisAlignment: MainAxisAlignment.center,
                                      //   children: [
                                      //     ParagraphText(
                                      //       text: '17',
                                      //       fontSize: 24,
                                      //       fontFamily: 'bold',
                                      //       color: MyColors.primaryColor,
                                      //     ),
                                      //     vSizedBox05,
                                      //     ParagraphText(
                                      //         text: 'FULL DAY',
                                      //         fontSize: 14,
                                      //         color: MyColors.labelcolor),
                                      //
                                      //   ],
                                      //
                                      // ),

                                      hSizedBox2,Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ParagraphText(
                                            text: '${attendance_count['5']??'0'}',
                                            fontSize: 24,
                                            fontFamily: 'bold',
                                            color: Colors.lightBlue,
                                          ),
                                          vSizedBox05,
                                          ParagraphText(
                                              text: 'Paid',
                                              fontSize: 14,
                                              color: MyColors.labelcolor),

                                        ],

                                      ),
                                      hSizedBox2,Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ParagraphText(
                                            text: '${attendance_count['6']??'0'}',
                                            fontSize: 24,
                                            fontFamily: 'bold',
                                            color: Colors.greenAccent,
                                          ),
                                          vSizedBox05,
                                          ParagraphText(
                                              text: 'UnPaid',
                                              fontSize: 14,
                                              color: MyColors.labelcolor),

                                        ],

                                      ),
                                      hSizedBox2,Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ParagraphText(
                                            text: '${attendance_count['12']??'0'}',
                                            fontSize: 24,
                                            fontFamily: 'bold',
                                            color: Colors.grey,
                                          ),
                                          vSizedBox05,
                                          ParagraphText(
                                              text: 'WeekOff',
                                              fontSize: 14,
                                              color: MyColors.labelcolor),

                                        ],

                                      ),
                                      hSizedBox2,Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ParagraphText(
                                            text: '${attendance_count['11']??'0'}',
                                            fontSize: 24,
                                            fontFamily: 'bold',
                                            color: MyColors.secondarycolor,
                                          ),
                                          vSizedBox05,
                                          ParagraphText(
                                              text: 'Public',
                                              fontSize: 14,
                                              color: MyColors.labelcolor),

                                        ],

                                      ),
                                      hSizedBox2,
                                      // Expanded(
                                      //   child: Column(
                                      //     mainAxisAlignment: MainAxisAlignment.center,
                                      //     children: [
                                      //       ParagraphText(
                                      //         text: '2',
                                      //         fontSize: 24,
                                      //         fontFamily: 'bold',
                                      //         color: MyColors.red,
                                      //       ),
                                      //       vSizedBox05,
                                      //       ParagraphText(
                                      //           text: 'Absent',
                                      //           fontSize: 14,
                                      //           color: MyColors.labelcolor),
                                      //     ],
                                      //   ),
                                      // ),
                                      // Expanded(
                                      //   child: Column(
                                      //     mainAxisAlignment: MainAxisAlignment.center,
                                      //     children: [
                                      //       ParagraphText(
                                      //         text: '4',
                                      //         fontSize: 24,
                                      //         fontFamily: 'bold',
                                      //         color: MyColors.yellow,
                                      //       ),
                                      //       vSizedBox05,
                                      //       ParagraphText(
                                      //           text: 'Late',
                                      //           fontSize: 14,
                                      //           color: MyColors.labelcolor),
                                      //     ],
                                      //   ),
                                      // ),
                                      Icon(
                                        Icons.chevron_right_outlined,
                                        color: MyColors.paragraphcolor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    vSizedBox,
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)),
                          child: TableCalendar(
                             onPageChanged: (date)async{
                               print("onPageChanged---mizam-------${date}");
                               if(globalModal.userData?.userId!=1){
                                 getdetail(date);
                                 log("getWeekOff------------getWeekOff-----${date}");
                               }
                             },

                            calendarStyle: CalendarStyle(

                              holidayTextStyle: TextStyle(fontFamily: 'sf-medium', color: Colors.white) ,
                              defaultTextStyle:
                              TextStyle(fontFamily: 'sf-medium', color: Color(0xFE77838F)),
                              // weekendTextStyle:
                              // TextStyle(fontFamily: 'sf-medium', color: Colors.black),
                              todayTextStyle:
                              TextStyle(fontFamily: 'sf-medium', color:Colors.white),
                              weekendDecoration:BoxDecoration(
                                  color:Colors.white,
                                  borderRadius: BorderRadius.circular(5)),

                              holidayDecoration:BoxDecoration(
                                  color:Color(0xFF6B7280),
                                  borderRadius: BorderRadius.circular(5)),

                              // selectedDecoration: BoxDecoration(
                              //     color: MyColors.secondarycolor,
                              //     borderRadius: BorderRadius.circular(5)),
                              todayDecoration:  BoxDecoration(
                                  color: MyColors.primaryColor,
                                  borderRadius: BorderRadius.circular(5)),
                              // disabledDecoration: BoxDecoration(
                              //     color: MyColors.red,
                              //     borderRadius: BorderRadius.circular(5)
                              // )
                            ),

                            // holidayPredicate: (day) {
                            //
                            //   print('day-------------------${day}');
                            //
                            //
                            //   DateTime tempDay = DateTime(day.year, day.month, day.day);
                            //   print('tempDay$tempDay');
                            //   print('day---------33----------${globalModal.empAttend?.absentDays}');
                            //
                            //   print('_events------------------${globalModal.empAttend?.absentDays.contains(tempDay)}');
                            //
                            //   return globalModal.empAttend!.absentDays.contains(tempDay);
                            //
                            // },


                            leaveColor: (day) {
                              print('day111-------------------${day}');
                              for(var i=0;i<datae.length;i++){
                                print('day-333------------------${day}');
                                if(DateTime.parse(datae[i]['date'])==DateTime(day.year, day.month, day.day)){
                                  print('day-444------------------${datae[i]['type']}');
                                  return  color_type[datae[i]['status']];
                                }
                              }


                              //
                              //
                              // DateTime tempDay = DateTime(day.year, day.month, day.day);
                              // print('tempDay$tempDay');
                              // print('day---------33----------${globalModal.empAttend?.absentDays}');
                              //
                              // print('_events------------------${globalModal.empAttend?.absentDays.contains(tempDay)}');
                              //
                              // return globalModal.empAttend!.absentDays.contains(tempDay)==true?Colors.blue:Colors.red;

                            },
                            // selectedDayPredicate: (DateTime a) {
                            //   print('DateTime ------------$a');
                            //
                            //   DateTime temp = DateTime(a.year,a.month, a.day);
                            //
                            //   return globalModal.empAttend!.presentDays.contains(temp);
                            //
                            // },
                             // enabledDayPredicate :(DateTime b){
                             //   DateTime temp = DateTime(b.year,b.month, b.day);
                             //   // print("predicate  ${temp}-----${selectedDays} " );
                             //   print('selectedDays.contains(a)--------${globalModal.empAttend!.weekoffDays}---------$temp');
                             //   print('selectedDays.contains(a)--------${globalModal.empAttend!.weekoffDays.contains(temp)}');
                             //   return globalModal.empAttend!.weekoffDays.contains(temp);
                             // },
                            onDaySelected: (selectedDay, focusedDay) async{
                              Map data={};
                              print("selectedDay-------------$selectedDay");
                              globalModal.loadingShow();
                              var res=await Webservices.getData('${ApiUrls.attendancedetail}?date=$selectedDay', context);

                              var jsonResponse = convert.jsonDecode(res.body);
                              log("res -----------------$jsonResponse");
                              data=jsonResponse['data'];

                              globalModal.loadingHide();


                              StateSetter c = setState;
                              bottomsheet(
                                height:360,
                                context: context,
                                child: globalModal.load?CustomLoader():StatefulBuilder(
                                  builder: (context,setState) {
                                    // c =setState;


                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        vSizedBox4,
                                        Center(
                                          child: MainHeadingText(
                                            text: '${DateFormat('yyyy-MM-dd ').format(selectedDay)}',
                                          ),
                                        ),
                                        vSizedBox2,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [

                                            Chip_Custom(
                                                background:
                                                data['status']=='1'?MyColors.green:data['status']=='2'?MyColors.primaryColor:data['status']=='3'?MyColors.red:data['status']=='4'?MyColors.primaryColor:data['status']=='5'?MyColors.primaryColor:data['status']=='6'?Colors.greenAccent:data['status']=='7'?MyColors.primaryColor:data['status']=='8'?MyColors.primaryColor:data['status']=='9'?MyColors.primaryColor:data['status']=='10'?MyColors.primaryColor:data['status']=='11'?MyColors.secondarycolor:data['status']=='12'?Colors.grey:data['status']=='13'?MyColors.primaryColor:MyColors.primaryColor,
                                                text:
                                                data['status']=='1'?'Present':data['status']=='2'?'FULL DAY':data['status']=='3'?'Absent':data['status']=='4'?'HALFDAY':data['status']=='5'?'PAID LEAVE':data['status']=='6'?'UNPAID LEAVE':data['status']=='7'?'DAY OFF':data['status']=='8'?'FORGOT OUT':data['status']=='9'?'EARLYOUT':data['status']=='10'?'LATEENTRY':data['status']=='11'?'PUBLIC HOLIDAY':data['status']=='12'?'WEEKOFF':data['status']=='13'?'LEAVEREQUEST':'SHORT HOURS'


                                            ),
                                            hSizedBox,
                                            // GestureDetector(
                                            //   child: Chip_Custom(text: 'Full Day'),
                                            //   onTap: () {
                                            //     // Navigator.of(context).pop();
                                            //   },
                                            // )
                                          ],
                                        ),
                                        vSizedBox4,

                                        Padding(
                                          padding:
                                              const EdgeInsets.symmetric(horizontal: 50.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      ParagraphText(
                                                        text: '${data['inTime']??'-'}',
                                                        fontSize: 24,
                                                        fontFamily: 'bold',
                                                        color: MyColors.primaryColor,
                                                      ),
                                                      hSizedBox,
                                                      // Image.asset(
                                                      //   MyImages.punch_edit,
                                                      //   height: 24,
                                                      // ),
                                                    ],
                                                  ),
                                                  vSizedBox05,
                                                  ParagraphText(
                                                    text: 'PUNCH IN',
                                                    fontSize: 16,
                                                    fontFamily: 'bold',
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ParagraphText(
                                                    text: '${data['outTime']??'-'}',
                                                    fontSize: 24,
                                                    fontFamily: 'bold',
                                                    color: MyColors.primaryColor,
                                                  ),
                                                  vSizedBox05,
                                                  ParagraphText(
                                                    text: 'PUNCH OUT',
                                                    fontSize: 16,
                                                    fontFamily: 'bold',
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        vSizedBox4,
                                        if(data['Incurrent_location']!=null)
                                        Padding(
                                          padding:
                                              const EdgeInsets.symmetric(horizontal: 16.0),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                MyImages.map,
                                                height: 24,
                                              ),
                                              hSizedBox,
                                              Expanded(
                                                child: ParagraphText(
                                                  text:
                                                      '${data['Incurrent_location']??''}',
                                                  color: MyColors.paragraphcolor,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        vSizedBox,
                                        if(data['Outcurrent_location']!=null)
                                        Padding(
                                          padding:
                                              const EdgeInsets.symmetric(horizontal: 16.0),

                                          child: Row(
                                            children: [
                                              Image.asset(
                                                MyImages.map,
                                                height: 24,
                                              ),
                                              hSizedBox,
                                              Expanded(
                                                child: ParagraphText(
                                                  text:
                                                      '${data['Outcurrent_location']??''}',
                                                  color: MyColors.paragraphcolor,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        vSizedBox,
                                        // Center(
                                        //   child: ParagraphText(
                                        //     text: 'PUNCH OUT TIME CORRECTION PENDING',
                                        //     color: MyColors.red,
                                        //     fontSize: 16,
                                        //     fontFamily: 'regular',
                                        //   ),
                                        // ),
                                        Divider(
                                          height: 30,
                                        ),
                                        // MainHeadingText(
                                        //   text: 'Change Status',
                                        // ),
                                        // vSizedBox,
                                        // Row(
                                        //   children: [
                                        //     Chip_Custom(text: 'PRESENT'),
                                        //     hSizedBox,
                                        //     Chip_Custom(text: 'FULL DAY'),
                                        //     hSizedBox,
                                        //     Chip_Custom(
                                        //       text: 'HALF DAY',
                                        //       background: Color(0xFFFEF9C3),
                                        //       textcolor: Color(0xFFCD8A04),
                                        //     ),
                                        //   ],
                                        // ),
                                        // vSizedBox,
                                        // Row(
                                        //   children: [
                                        //     Chip_Custom(
                                        //       text: 'ABSENT',
                                        //       background: MyColors.red.withOpacity(0.1),
                                        //       textcolor: MyColors.red,
                                        //     ),
                                        //     hSizedBox,
                                        //     Chip_Custom(
                                        //       text: 'PAID LEAVE',
                                        //       textcolor: Color(0xFF4872EC),
                                        //       background: Color(0xFFDBEAFE),
                                        //     ),
                                        //     hSizedBox,
                                        //     Chip_Custom(
                                        //       text: 'UN.P LEAVE',
                                        //       background: Color(0xFFCCFBF1),
                                        //       textcolor: Color(0xFF199992),
                                        //     ),
                                        //   ],
                                        // ),
                                        // vSizedBox,
                                        // Row(
                                        //   children: [
                                        //     Chip_Custom(
                                        //       text: 'DAY OFF',
                                        //       background: Color(0xFFF3F4F6),
                                        //       textcolor: Color(0xFF4B5563),
                                        //     ),
                                        //   ],
                                        // ),
                                      ],
                                    );
                                  }
                                ),
                              );

                              // c((){});



                            },
                            headerStyle: HeaderStyle(
                                // leftChevronVisible: false,
                                // rightChevronVisible: false,
                                // headerPadding:
                                // EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                                // titleTextStyle: TextStyle(
                                //   color: Color(0xFFFACC15),
                                //   fontSize: 18,
                                //   fontFamily: 'bold',
                                // ),
                                leftChevronPadding: EdgeInsets.all(0),
                                rightChevronPadding: EdgeInsets.all(0),
                                formatButtonVisible: false,
                                headerPadding: EdgeInsets.only(bottom: 16, top: 10),
                                titleTextStyle: TextStyle(
                                  fontSize: 12,
                                )),
                            firstDay: DateTime.utc(2010, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: Selecteddate,
                            // calendarFormat: CalendarFormat.week,
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    vSizedBox2,
                  ],
                ),
                if(two)
                Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: MyColors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ParagraphText(text: 'PROJECTED  SALARY', fontSize: 16, fontFamily: 'bold', color: Color(0xFF4B5563),),
                                vSizedBox05,
                                MainHeadingText(text: '₹ 10,000', color: MyColors.primaryColor, fontSize: 24,),
                                vSizedBox05,
                                ParagraphText(text: 'Last Updated on 21-07-2022', fontSize: 14,)
                              ],
                            ),
                            RoundEdgedButton(
                              text: 'PROCESS', minWidth: 100, height: 30, horizontalPadding: 0,verticalPadding: 0,
                              fontSize: 16,
                            )
                          ],
                        ),
                      ),
                      vSizedBox,
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            clickable_list(text: 'Bonus', img: MyImages.bonus, colorborderleft: Color(0xFFA38023),
                            onTap: (){
                              push(context: context, screen: Bonus_Page());
                            },
                            ),
                            vSizedBox,
                            clickable_list(text: 'Deduction', img: MyImages.deduction, colorborderleft: MyColors.primaryColor,
                              onTap: (){
                                push(context: context, screen: Deduction_Page());
                              },
                            ),
                            vSizedBox,
                            clickable_list(text: 'Loan', img: MyImages.loan, colorborderleft: Color(0xFF33CBCB),
                              onTap: (){
                                push(context: context, screen: Loan_Page());
                              },
                            ),
                            vSizedBox,
                            clickable_list(text: 'Advance', img: MyImages.advance,colorborderleft: Color(0xFF33CBCB),
                              onTap: (){
                                push(context: context, screen: Advance_Page());
                              },
                            ),
                            vSizedBox,
                            clickable_list(
                                text: 'Work', img: MyImages.work,colorborderleft: Color(0xFFA38023),
                              onTap: (){
                                push(context: context, screen: Pay_Per_Work_Page());
                              },
                            ),
                            vSizedBox,
                            clickable_list(
                              text: 'TDS Deduction', img: MyImages.tds_Deduction, colorborderleft: MyColors.primaryColor,
                              onTap: (){
                                push(context: context, screen: TDS_Deduction_Page());
                              },
                            ),
                            vSizedBox,
                            clickable_list(text: 'Salary Slip', img: MyImages.salary_slip,colorborderleft: Color(0xFFA38023),
                              onTap: (){
                                push(context: context, screen: Salary_Slip_Page());
                              },
                            ),
                            vSizedBox,
                          ],
                        ),
                      )
                    ],
                  ),
                if(three)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFD6E5FF),
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ParagraphText(
                            text: 'TOTAL SALARY PROCESSED',
                            fontFamily: 'bold',
                            color: MyColors.labelcolor,
                          ),
                          vSizedBox05,
                          MainHeadingText(text: '₹ 1,00,000', fontSize: 24, color: MyColors.primaryColor,)
                        ],
                      ),
                    ),
                    vSizedBox2,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: horizontal_pad,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MainHeadingText(text: 'Summary'),
                              // RoundEdgedButton(
                              //   text: 'Total Deduction Amount : 1000',
                              //   verticalPadding: 0,
                              //   horizontalPadding: 10,
                              //   // width: MediaQuery.of(context).size.width - 150,
                              //   fontSize: 14,
                              //   height: 35,
                              //   minWidth: 0,
                              //   fontfamily: 'regular',
                              // ),
                            ],
                          ),
                          vSizedBox2,
                          Transaction_list(
                              text: '14-07-2022',
                              subtext: 'subtext',
                              price: '₹ 5,000',
                              isimage: false,
                              popupmenu: false,
                          ),
                          Transaction_list(
                            text: '14-07-2022',
                            subtext: 'subtext',
                            price: '₹ 5,000',
                            isimage: false,
                            popupmenu: false,
                          )

                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
