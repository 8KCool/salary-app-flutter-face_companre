import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';
import 'package:salaryredesign/widgets/dropdown.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../providers/clock.dart';
import '../../widgets/avatar.dart';
import '../../widgets/customtextfield.dart';
import 'package:intl/intl.dart';

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
  Map<DateTime, List<dynamic>> events={
    DateTime(2021, 6, 22) : ['Meeting URUS', 'Testing Danai Mobile', 'Weekly Report', 'Weekly Meeting'],
    DateTime(2021, 6, 25) : ['Weekly Testing'],
    DateTime(2021, 6, 4) : ['Weekly Testing'],
    DateTime(2021, 6, 11) : ['Weekly Testing'],
    DateTime(2021, 6, 18) : ['Weekly Testing'],
  };
  getcalender()async{
    await Provider.of<GlobalModal>(context, listen: false)
        .getCalendar(context);
    for(var i=0 ; i<await Provider.of<GlobalModal>(context, listen: false).calender.length;i++){
      selectedDays.add(DateTime.parse(await Provider.of<GlobalModal>(context, listen: false).calender[i]['holiday_date']));

          }
    print('selectedDaysselectedDaysselectedDays----${selectedDays}');
    setState(() {

    });

  }
  // final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
  //   equals: isSameDay,
  //   hashCode: getHashCode,
  // );

  // final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
  //   equals: isSameDay,
  //   hashCode: getHashCode,
  // );
  @override
  void initState() {
    // TODO: implement initState
    getcalender();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: appBar(context: context, title: 'Holiday Calander', titlecenter: false),
      body: Consumer<GlobalModal>(
        builder: (context,globalModal,child) {
          return SingleChildScrollView(
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
                      // eventLoader:events,
                      // selectedDayPredicate: (day) {
                      //   // Use values from Set to mark multiple days as selected
                      //   return selectedDays.contains(day);
                      //   },
                        onDaySelected: (DateTime a, DateTime b) async {
                          print(
                              'date time from calendaer-------------a----' + a.toString());
                          print('date time from calendaer--------b----' + b.toString());
                          Selecteddate = a;
                          // data = [];
                          // getbooking('1');
                          setState(() {});
                        },
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
                          defaultTextStyle:
                          TextStyle(fontFamily: 'sf-medium', color: Color(0xFE77838F)),
                          // weekendTextStyle:
                          // TextStyle(fontFamily: 'sf-medium', color: Colors.white),
                          todayTextStyle:
                          TextStyle(fontFamily: 'sf-medium', color: Color(0xFE77838F)),
                    
                          selectedDecoration: BoxDecoration(
                              color: MyColors.secondarycolor,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        weekendDays: [DateTime.tuesday,DateTime.monday],


                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        selectedDayPredicate: (DateTime a) {

                          DateTime temp = DateTime(a.year,a.month, a.day);
                          print("predicate  ${temp}-----${selectedDays} " );
                          print('selectedDays.contains(a)--------${selectedDays.contains(temp)}');
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
