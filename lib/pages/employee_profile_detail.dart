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
import '../providers/attendanceCalendar.dart';
import '../providers/clock.dart';
import '../services/api_urls.dart';
import '../services/webservices.dart';
import 'dart:convert' as convert;

import '../widgets/calender/my_calendar.dart';
import '../widgets/calender/src/customization/calendar_style.dart';
import '../widgets/calender/src/customization/header_style.dart';
import 'package:pie_chart/pie_chart.dart';

import '../widgets/newCalendarpopup.dart';

class Employee_Profile_Details extends StatefulWidget {
  const Employee_Profile_Details({Key? key}) : super(key: key);

  @override
  State<Employee_Profile_Details> createState() =>
      _Employee_Profile_DetailsState();
}

bool one = true;
bool two = false;
bool three = false;
bool onselect = true;


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
  "8": MyColors.primaryColor,
  "9": MyColors.primaryColor,
  "10":MyColors.primaryColor,
  "11":MyColors.secondarycolor,
  "12": Colors.grey,
  "13": MyColors.primaryColor,
  "14": MyColors.primaryColor
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

  DateTime Selecteddate = DateTime.now();
  getdetail(DateTime date)async{
    // Provider.of<GlobalModal>(context, listen: false).loadingShow();
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
    if(res['success'].toString()=='true'){
      Provider.of<AttendanceCalendarModal>(context , listen:false).getData(res['data']);
      attendanceStatus=res['attendanceStatus'];
      attendance_count=res['attendance_count'];
      dataMap['Presnt']=attendance_count['1']!=null?double.parse(attendance_count['1'].toString()):0;
      dataMap['absent']=attendance_count['3']!=null?double.parse(attendance_count['3'].toString()):0;
      dataMap['paid leave']=attendance_count['5']!=null?double.parse(attendance_count['5'].toString()):0;
      dataMap['weekoff']=attendance_count['12']!=null?double.parse(attendance_count['12'].toString()):0;
      dataMap['full day']=attendance_count['2']!=null?double.parse(attendance_count['2'].toString()):0;
      dataMap['half day']=attendance_count['4']!=null?double.parse(attendance_count['4'].toString()):0;
      dataMap['paid half']=attendance_count['0']!=null?double.parse(attendance_count['0'].toString()):0;
      dataMap['unpaid']=attendance_count['6']!=null?double.parse(attendance_count['6'].toString()):0;
      dataMap['public']=attendance_count['11']!=null?double.parse(attendance_count['11'].toString()):0;
      dataMap['compoff']=attendance_count['0']!=null?double.parse(attendance_count['0'].toString()):0;
      dataMap['unpaid half']=attendance_count['0']!=null?double.parse(attendance_count['0'].toString()):0;

    }
    else{
      Provider.of<AttendanceCalendarModal>(context , listen:false).getData([]);
      attendanceStatus={};
      attendance_count={};
      dataMap['Presnt']=0;
      dataMap['absent']=0;
      dataMap['paid leave']=0;
      dataMap['weekoff']=0;
      dataMap['full day']=0;
      dataMap['half day']=0;
      dataMap['paid half']=0;
      dataMap['unpaid']=0;
      dataMap['public']=0;
      dataMap['compoff']=0;
      dataMap['unpaid half']=0;


    }
    // datae=res['data'];

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

          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<GlobalModal>(
              builder: (context,globalModal,child) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  color: MyColors.primaryColor,
                  child: Column(
                    children: [
                      hSizedBox,
                      CircleAvatarcustom(
                        borderradius: 100,
                        image: '${globalModal.userData!.profileImg}',
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

                    ],
                  ),
                );
              }
            ),

            vSizedBox,
            // if(one)
            Consumer<AttendanceCalendarModal>(
              builder: (context,attendanceModal,child) {
                return Column(
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
                              Stack(
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Container(
                                        height: 100,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
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
                                                    text: 'Half day   ',
                                                    fontSize: 14,
                                                    color: MyColors.labelcolor),

                                              ],

                                            ),
                                            hSizedBox2,
                                            Column(
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
                                          ],
                                        )






                                      // hSizedBox2,


                                    ),
                                  ),
                                  Positioned(
                                    top:32,
                                    right:0,
                                    child:
                                    Row(
                                      children: [
                                        hSizedBox2,
                                        Icon(
                                          Icons.chevron_right_outlined,
                                          color: MyColors.paragraphcolor,
                                        ),
                                      ],
                                    ),)
                                ],
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
                              // if(globalModal.userData?.userId!=1){
                                getdetail(date);
                                log("getWeekOff------------getWeekOff-----${date}");
                              // }
                            },

                            calendarStyle: CalendarStyle(

                              holidayTextStyle: TextStyle(fontFamily: 'sf-medium', color: Colors.white) ,
                              defaultTextStyle:
                              TextStyle(fontFamily: 'sf-medium', color: Color(0xFE77838F)),
                              todayTextStyle:
                              TextStyle(fontFamily: 'sf-medium', color:Colors.white),
                              weekendDecoration:BoxDecoration(
                                  color:Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              defaultDecoration:BoxDecoration(
                                  color:Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              holidayDecoration:BoxDecoration(
                                  color:Color(0xFF6B7280),
                                  borderRadius: BorderRadius.circular(5)),
                              todayDecoration:  BoxDecoration(
                                  color: MyColors.primaryColor,
                                  borderRadius: BorderRadius.circular(5)),
                              outsideDecoration: BoxDecoration(
                                  // color: MyColors.primaryColor,
                                  borderRadius: BorderRadius.circular(5)),

                            ),
                            leaveColor: (day) {
                              print('day111-------------------${day}');
                              for(var i=0;i<attendanceModal.attendanceData.length;i++){
                                print('day-333------------------${day}');
                                if(DateTime.parse(attendanceModal.attendanceData[i]['date'].toString())==DateTime(day.year, day.month, day.day)){
                                  print('day-444------------------${attendanceModal.attendanceData[i]['type']}');
                                  return  color_type[attendanceModal.attendanceData[i]['status']];
                                }
                              }

                            },

                            onDaySelected:(selectedDay, focusedDay) async{



                              // globalModal.loadingHide();


                              // StateSette/r c = setState;
                              bottomsheet(
                                height:360,
                                context: context,
                                child:BottomSheetPage(selectedDay: selectedDay,)

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
                );
              }
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
      )
    );
  }
}
