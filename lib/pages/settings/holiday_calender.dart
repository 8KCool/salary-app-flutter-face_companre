




import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/widgets/CustomLoader.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';
import 'package:salaryredesign/widgets/dropdown.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../providers/clock.dart';
import '../../services/api_urls.dart';
import '../../services/webservices.dart';
import '../../widgets/avatar.dart';
import '../../widgets/customtextfield.dart';
import 'package:intl/intl.dart';
import 'dart:convert' as convert;

import '../tab_pages/bottom_tab.dart';


class Holiday_Calender_Page extends StatefulWidget {
  const Holiday_Calender_Page({Key? key}) : super(key: key);

  @override
  State<Holiday_Calender_Page> createState() => _Holiday_Calender_PageState();
}

class _Holiday_Calender_PageState extends State<Holiday_Calender_Page> {

  TextEditingController name = TextEditingController();
  List image=[
    MyImages.avtarone,
    MyImages.avatr8,
    MyImages.avatr3,
    MyImages.avatr4,
    MyImages.avatr5,
    MyImages.avatr6,
  ];
  DateTime Selecteddate = DateTime.now();
  Set<DateTime> selectedDays={};
  // Set<DateTime> holiDays = {};
  List<dynamic> weekoff=[];

  Map<DateTime, List<dynamic>> events={
    DateTime(2021, 6, 22) : ['Meeting URUS', 'Testing Danai Mobile', 'Weekly Report', 'Weekly Meeting'],
    DateTime(2021, 6, 25) : ['Weekly Testing'],
    DateTime(2021, 6, 4) : ['Weekly Testing'],
    DateTime(2021, 6, 11) : ['Weekly Testing'],
    DateTime(2021, 6, 18) : ['Weekly Testing'],
  };
  String message = '';
  Future<void> _showMyDialog() async {
    // await Future.delayed(Duration(seconds: 2));

    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Image.asset(MyImages.cancel,width: 70,height: 70,),
                Icon(
                  Icons.dangerous,
                  color: Colors.red,
                  size: 80,
                ),
                vSizedBox2,
                Text(
                  '${message.toString()}',
                  textAlign: TextAlign.center,
                ),
                vSizedBox,

                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // pushReplacement(context: context, screen: TabsPage());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  getWeekOff(date)async{
    if( await Provider.of<GlobalModal>(context, listen: false).userData?.userId!=1){
      log("getWeekOff------------getWeekOff-----${date}");
      // await Provider.of<GlobalModal>(context, listen: false).loadingShow();
      var res = await Webservices.getData("${ApiUrls.weekoffdatebyday}?cal_date=${date}", context);
      var result1 = convert.jsonDecode(res.body);
      // await Provider.of<GlobalModal>(context, listen: false).loadingHide();

      log("result1------------getWeekOff-----${result1}");
      if(result1['success'].toString()=='false'){
        message='${result1['message']}';
        _showMyDialog();
      }
      if(date==''){
        Selecteddate=DateTime.now();
      }
      else{
        Selecteddate = date;

      }
      if(result1['success'].toString()=='true'){
        await Provider.of<GlobalModal>(context, listen: false)
            .getweekoffbydate(result1['data']['getAllweekoff']);
      }

      // await Provider.of<GlobalModal>(context, listen: false)
      //     .getweekoffbydate(result1['data']['getAllweekoff']);
      // setState(() {
      //
      // });

    }


  }
  getcalender(date)async{
    Selecteddate=date;
    await Provider.of<GlobalModal>(context, listen: false)
        .getCalendar(context,date);
    for(var i=0 ; i<await Provider.of<GlobalModal>(context, listen: false).calender.length;i++){
      selectedDays.add(DateTime.parse(await Provider.of<GlobalModal>(context, listen: false).calender[i]['holiday_date']));

    }
    print('selectedDaysselectedDaysselectedDays----${selectedDays}');
  }

  DateTime date1=DateTime.parse("2022-10-27 00:00:00.000");
  DateTime date2=DateTime.parse("2022-10-29 00:00:00.000");

  @override
  void initState() {
    // TODO: implement initState
    getcalender(DateTime.now());
    getWeekOff('');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: appBar(context: context, title: 'Holiday Calander', titlecenter: false),
      body: Consumer<GlobalModal>(
          builder: (context,globalModal,child) {
            return globalModal.load?CustomLoader():SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
                    // padding: EdgeInsets.all(16),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TableCalendar(
                          // shouldFillViewport: true,
                          onCalendarCreated: (aa){
                            print('he;l;llllll');
                          },
                          // eventLoader:_events,

                          // selectedDayPredicate: (day) {
                          //   // Use values from Set to mark multiple days as selected
                          //   return selectedDays.contains(day);
                          //   },
                          //   onDaySelected: (DateTime a, DateTime b) async {
                          //     print(
                          //         // 'date time from calendaer-------------a----' + a.toString());
                          //     // print('date time from calendaer--------b----' + b.toString());
                          //     // Selecteddate = DateTime.parse('2022-10-21 00:00:00.000');
                          //     // data = [];
                          //     // getbooking('1');
                          //     // setState(() {});
                          //   },
                          focusedDay: Selecteddate,
                          headerStyle: HeaderStyle(

                              leftChevronPadding: EdgeInsets.all(0),
                              rightChevronPadding: EdgeInsets.all(0),
                              formatButtonVisible: false,
                              headerPadding: EdgeInsets.only(bottom: 16, top: 10),
                              titleTextStyle: TextStyle(
                                fontSize: 12,
                              )),
                          calendarStyle: CalendarStyle(
                            outsideDaysVisible: false,
                            holidayTextStyle: TextStyle(fontFamily: 'sf-medium', color: Colors.white) ,
                            defaultTextStyle:
                            TextStyle(fontFamily: 'sf-medium', color: Color(0xFE77838F)),
                            // weekendTextStyle:
                            // TextStyle(fontFamily: 'sf-medium', color: Colors.black),
                            todayTextStyle:
                            TextStyle(fontFamily: 'sf-medium', color: Colors.white),
                            todayDecoration:  BoxDecoration(
                                color: MyColors.primaryColor,
                                borderRadius: BorderRadius.circular(5)),
                            weekendDecoration:BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.circular(5)),

                            holidayDecoration:BoxDecoration(
                                color:Color(0xFF6B7280),
                                borderRadius: BorderRadius.circular(5)),

                            selectedDecoration: BoxDecoration(
                                color: MyColors.secondarycolor,
                                borderRadius: BorderRadius.circular(5)),
                          ),

                          // weekendDays: [DateTime.tuesday,DateTime.monday],


                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          onPageChanged: (date)async{

                            print("onPageChanged---mizam-------${date}");
                            getcalender(date);
                            if(globalModal.userData?.userId!=1){
                              getWeekOff(date);
                              log("getWeekOff------------getWeekOff-----${date}");
                            }
// setState(() {
//
// });
                            // var res = await Webservices.getData("${ApiUrls.weekoffdatebyday}?cal_date=${date}", context);
                            // var result1 = convert.jsonDecode(res.body);
                            // log("result1------------getWeekOff-----${result1}");
                            // await globalModal
                            //     .getweekoffbydate(result1['data']['getAllweekoff']);
                            //
                          },
                          holidayPredicate: (day) {

                            print('day-------------------${day}');


                            DateTime tempDay = DateTime(
                                day.year, day.month, day.day);
                            print('_events----holidayPredicate--------------${globalModal.holiDaysbtdate}');
                            print('_events----holidayPredicate--------------${globalModal.holiDaysbtdate.contains(tempDay)}');
                            return globalModal.holiDaysbtdate.contains(tempDay);

                          },

                          selectedDayPredicate: (DateTime a) {

                            DateTime temp = DateTime(a.year,a.month, a.day);
                            print("predicate  ${temp}-----${selectedDays} " );
                            print('selectedDays.contains(a)--------${selectedDays}');
                            // if(temp.month==DateTime.parse(selectedDays.toString()).month  && selectedDays.contains(temp)){
                              return selectedDays.contains(temp);
                            // }
                            return selectedDays.contains(temp);

                          },
                          startingDayOfWeek: StartingDayOfWeek.monday,
                          // focusedDay: DateTime.now(),
                          // calendarFormat: CalendarFormat.week,
                        ),
                        vSizedBox,
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              if(globalModal.userData?.userId!=1)
                              Expanded(
                                child:globalModal.userData?.userId!=1? Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              color: MyColors.bordercolor
                                          )
                                      )
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF6B7280),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ), hSizedBox,
                                      MainHeadingText(text: 'Weekoff')
                                    ],
                                  ),
                                ):Container(),
                              ),
                              if(globalModal.userData?.userId!=1)

                                hSizedBox05,
                              Expanded(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          color: MyColors.secondarycolor,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ), hSizedBox,
                                      MainHeadingText(text: 'Public Holiday')
                                    ],
                                  ),
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                        Divider(height: 10,),
                        vSizedBox,
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: MainHeadingText(text: 'Holidays'),
                          ),
                        ),
                        vSizedBox,
                        for(var i=0; i<globalModal.calender.length; i++)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: MyColors.white
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ParagraphText(
                                      text: '${ DateFormat.yMMMMd('en_US').format(DateTime.parse('${globalModal.calender[i]['holiday_date']} 17:08:45' ))} , ${ DateFormat.E().format(DateTime.parse('${globalModal.calender[i]['holiday_date']} 17:08:45' ))}',
                                      color: MyColors.black,
                                      fontSize: 16,
                                    ),
                                    vSizedBox05,
                                    MainHeadingText(
                                      text: '${globalModal.calender[i]['holiday_name']}',
                                      color: MyColors.black,
                                      fontFamily: 'semibold',
                                      fontSize: 16,
                                    ),
                                    // Divider(height: 40, color: Color(0xFFCAD8D8),)

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Divider(height: 10,),
                              ),
                            ],
                          ),
                        if(globalModal.calender.length==0)
                          Container(
                            height: 250,
                            child: Center(child: Text('No Holiday found.'),),
                          )

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




























// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:salaryredesign/constants/colors.dart';
// import 'package:salaryredesign/constants/image_urls.dart';
// import 'package:salaryredesign/constants/sized_box.dart';
// import 'package:salaryredesign/functions/navigation_functions.dart';
// import 'package:salaryredesign/widgets/CustomTexts.dart';
// import 'package:salaryredesign/widgets/appbar.dart';
// import 'package:salaryredesign/widgets/buttons.dart';
// import 'package:salaryredesign/widgets/custom_widgets.dart';
// import 'package:salaryredesign/widgets/dropdown.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// import '../../widgets/avatar.dart';
// import '../../widgets/customtextfield.dart';
//
// class Holiday_Calender_Page extends StatefulWidget {
//   const Holiday_Calender_Page({Key? key}) : super(key: key);
//
//   @override
//   State<Holiday_Calender_Page> createState() => _Holiday_Calender_PageState();
// }
//
// class _Holiday_Calender_PageState extends State<Holiday_Calender_Page> {
//   TextEditingController name = TextEditingController();
//   List image=[
//     MyImages.avtarone,
//     MyImages.avatr8,
//     MyImages.avatr3,
//     MyImages.avatr4,
//     MyImages.avatr5,
//     MyImages.avatr6,
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyColors.white,
//       appBar: appBar(context: context, title: 'Holiday Calander', titlecenter: false),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               // padding: EdgeInsets.all(16),
//               color: Colors.white,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   TableCalendar(
//                     headerStyle: HeaderStyle(
//                       // leftChevronVisible: false,
//                       // rightChevronVisible: false,
//                       // headerPadding:
//                       // EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//                       // titleTextStyle: TextStyle(
//                       //   color: Color(0xFFFACC15),
//                       //   fontSize: 18,
//                       //   fontFamily: 'bold',
//                       // ),
//                         leftChevronPadding: EdgeInsets.all(0),
//                         rightChevronPadding: EdgeInsets.all(0),
//                         formatButtonVisible: false,
//                         headerPadding: EdgeInsets.only(bottom: 16, top: 10),
//                         titleTextStyle: TextStyle(
//                           fontSize: 12,
//                         )),
//                     firstDay: DateTime.utc(2010, 10, 16),
//                     lastDay: DateTime.utc(2030, 3, 14),
//                     focusedDay: DateTime.now(),
//                     // calendarFormat: CalendarFormat.week,
//                   ),
//                   vSizedBox,
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Container(
//                             decoration: BoxDecoration(
//                               border: Border(
//                                 right: BorderSide(
//                                   color: MyColors.bordercolor
//                                 )
//                               )
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   height: 25,
//                                   width: 25,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xFF6B7280),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                 ), hSizedBox,
//                                 MainHeadingText(text: 'Weekoff')
//                               ],
//                             ),
//                           ),
//                         ),
//                         hSizedBox05,
//                         Expanded(
//                           child: Container(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   height: 25,
//                                   width: 25,
//                                   decoration: BoxDecoration(
//                                     color: MyColors.secondarycolor,
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                 ), hSizedBox,
//                                 MainHeadingText(text: 'Public Holiday')
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     ),
//                   ),
//                   Divider(height: 10,),
//                   vSizedBox,
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: MainHeadingText(text: 'Holidays'),
//                   ),
//                   vSizedBox,
//                   for(var i=0; i<2; i++)
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                           color: MyColors.white
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             ParagraphText(
//                               text: 'Oct 6, 2022 - Tue',
//                               color: MyColors.black,
//                               fontSize: 16,
//                             ),
//                             vSizedBox05,
//                             MainHeadingText(
//                               text: 'Ganesh Chaturti Holiday',
//                               color: MyColors.black,
//                               fontFamily: 'semibold',
//                               fontSize: 16,
//                             ),
//                             // Divider(height: 40, color: Color(0xFFCAD8D8),)
//
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         child: Divider(height: 10,),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
