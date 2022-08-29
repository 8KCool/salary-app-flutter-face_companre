import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/avatar.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../main.dart';
import '../widgets/CustomTexts.dart';
import '../widgets/buttons.dart';


enum SingingCharacter { one, two, three, four }

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

List images = [
  MyImages.avatrtwo,
  MyImages.avatr3,
  MyImages.avatr4,
  MyImages.avatr5,
  MyImages.avatr6,
  MyImages.avatr7,
  MyImages.avatr8,
  MyImages.avatr9,
  MyImages.avatr10,
  MyImages.avatr11,
  MyImages.avatr12,
];

List Name = [
  'John Smith',
  'Peter John',
  'Nora Luise',
  'Albus Potter',
  'Ron visely',
  'Ronit Sharma',
  'Lorem Ipsum',
  'John Smith',
  'Peter John',
  'Ron visely',
];

class Attandance_daily_Page extends StatefulWidget {
  const Attandance_daily_Page({Key? key}) : super(key: key);

  @override
  State<Attandance_daily_Page> createState() => _Attandance_daily_PageState();
}

class _Attandance_daily_PageState extends State<Attandance_daily_Page> {
  SingingCharacter? _character = SingingCharacter.one;
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(
        context: context,
        title: 'Attandance',
        titlecenter: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              child: TableCalendar(
                calendarStyle: CalendarStyle(
                  todayTextStyle: TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                      color: Color(0xFFFACC15),
                      // borderRadius: BorderRadius.circular(50),
                      shape: BoxShape.circle),
                  selectedDecoration: BoxDecoration(color: MyColors.red),
                  defaultTextStyle: TextStyle(color: Colors.white),
                  weekendTextStyle: TextStyle(color: Colors.white),
                  rangeEndTextStyle: TextStyle(color: Colors.white),
                ),
                headerStyle: HeaderStyle(
                  leftChevronVisible: false,
                  rightChevronVisible: false,
                  headerPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  titleTextStyle: TextStyle(
                    color: Color(0xFFFACC15),
                    fontSize: 18,
                    fontFamily: 'bold',
                  ),
                  formatButtonVisible: false,
                ),
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                calendarFormat: CalendarFormat.week,
              ),
            ),
            vSizedBox,
            Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CircleAvatarcustom(
                          image: MyImages.progress_att,
                          fit: BoxFit.fitHeight,
                          imgheight: 50,
                          imgwidth: 50,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ParagraphText(
                            text: '17',
                            fontSize: 24,
                            fontFamily: 'bold',
                            color: MyColors.primaryColor,
                          ),
                          vSizedBox05,
                          ParagraphText(
                              text: 'Present',
                              fontSize: 14,
                              color: MyColors.labelcolor),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ParagraphText(
                            text: '2',
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
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ParagraphText(
                            text: '4',
                            fontSize: 24,
                            fontFamily: 'bold',
                            color: MyColors.yellow,
                          ),
                          vSizedBox05,
                          ParagraphText(
                              text: 'Late',
                              fontSize: 14,
                              color: MyColors.labelcolor),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_outlined,
                      color: MyColors.paragraphcolor,
                    ),
                  ],
                )),
            vSizedBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomTextField(
                controller: search,
                hintText: 'Search',
                prefixIcon: MyImages.search,
                suffixIcon: MyImages.filter,
                suffixheight: 20,
                height: 52,
              ),
            ),
            vSizedBox,
            for (var i = 0; i < 8; i++)
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(bottom: 10),
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            child: Image.asset(
                              images[i],
                              height: 65,
                              width: 65,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          Positioned(
                              top: -2,
                              right: 5,
                              child: Container(
                                height: 16,
                                width: 16,
                                decoration: BoxDecoration(
                                    color: MyColors.secondarycolor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                              ))
                        ],
                      ),
                      hSizedBox,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: Name[i] + ' ',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'bold'),
                                // children: const <TextSpan>[
                                //   TextSpan(
                                //       text:
                                //       'is requested leave for 2 days.',
                                //       style: TextStyle(
                                //           color: MyColors.paragraphcolor,
                                //           fontFamily: 'regular')),
                                // ],
                              ),
                            ),
                            vSizedBox05,
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            MyImages.punch_in,
                                            height: 24,
                                            width: 24,
                                          ),
                                          hSizedBox,
                                          ParagraphText(
                                            text: '09:00 AM',
                                            fontFamily: 'bold',
                                            color: Colors.black,
                                            fontSize: 16,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      ParagraphText(
                                        text: 'PUNCH IN',
                                        fontSize: 16,
                                      )
                                    ],
                                  ),
                                ),
                                hSizedBox,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          MyImages.punch_in,
                                          height: 24,
                                          width: 24,
                                        ),
                                        hSizedBox,
                                        ParagraphText(
                                          text: 'ADD',
                                          fontFamily: 'bold',
                                          color: MyColors.primaryColor,
                                          fontSize: 16,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    ParagraphText(
                                      text: 'PUNCH OUT',
                                      fontSize: 16,
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: MyColors.red),
                        child: Center(
                          child: ParagraphText(
                            text: 'P',
                            color: Colors.white,
                            fontFamily: 'bold',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      PopupMenuButton(
                        icon: Icon(
                          Icons.more_vert,
                          color: MyColors.paragraphcolor,
                        ),
                        elevation: 2,
                        offset: Offset(-30, 0),
                        padding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                          const PopupMenuItem(
                            child: ListTile(
                              contentPadding: EdgeInsets.all(0),
                              visualDensity:
                                  VisualDensity(horizontal: -4, vertical: -4),
                              title: Text('Change'),
                              leading: ImageIcon(
                                AssetImage(
                                  MyImages.change,
                                ),
                              ),
                            ),
                          ),
                          const PopupMenuItem(
                            child: ListTile(
                              contentPadding: EdgeInsets.all(0),
                              visualDensity:
                                  VisualDensity(horizontal: -4, vertical: -4),
                              title: Text('OT'),
                              leading: ImageIcon(
                                AssetImage(
                                  MyImages.OT,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  showModalBottomSheet<void>(
                    backgroundColor: Colors.transparent,
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              )),
                          height: 600,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              vSizedBox4,
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        child: Image.asset(
                                          MyImages.avatr6,
                                          height: 65,
                                          width: 65,
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      Positioned(
                                          top: -2,
                                          right: 5,
                                          child: Container(
                                            height: 16,
                                            width: 16,
                                            decoration: BoxDecoration(
                                                color: MyColors.red,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2)),
                                          ))
                                    ],
                                  ),
                                  hSizedBox,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ParagraphText(
                                          text: 'Charles Madona',
                                          fontFamily: 'bold',
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                        vSizedBox05,
                                        ParagraphText(
                                          text: '21-07-2022',
                                          fontFamily: 'bold',
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              vSizedBox2,
                              Row(
                                children: [
                                  Chip_Custom(text: 'Present'),
                                  hSizedBox,
                                  GestureDetector(
                                      child: Chip_Custom(text: 'Full Day'),
                                    onTap: (){
                                        Navigator.of(context).pop();
                                      showModalBottomSheet<void>(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return StatefulBuilder(
                                              builder: (BuildContext context, StateSetter setState) {
                                                return Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(20),
                                                        topRight: Radius.circular(20),
                                                      )
                                                  ),
                                                  height: 600,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      vSizedBox4,
                                                      Row(
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              ClipRRect(
                                                                child: Image.asset(
                                                                  MyImages.avatr6,
                                                                  height: 65,
                                                                  width: 65,
                                                                  fit: BoxFit.cover,
                                                                ),
                                                                borderRadius: BorderRadius.circular(50),
                                                              ),
                                                              Positioned(
                                                                  top: -2,
                                                                  right: 5,
                                                                  child: Container(
                                                                    height: 16,
                                                                    width: 16,
                                                                    decoration: BoxDecoration(
                                                                        color: MyColors.red,
                                                                        borderRadius:
                                                                        BorderRadius.circular(10),
                                                                        border: Border.all(
                                                                            color: Colors.white,
                                                                            width: 2)),
                                                                  ))
                                                            ],
                                                          ),
                                                          hSizedBox,
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                              children: [
                                                                ParagraphText(
                                                                  text: 'Charles Madona',
                                                                  fontFamily: 'bold',
                                                                  fontSize: 18,
                                                                  color: Colors.black,
                                                                ),
                                                                vSizedBox05,
                                                                ParagraphText(
                                                                  text: '21-07-2022',
                                                                  fontFamily: 'bold',
                                                                  fontSize: 18,
                                                                  color: Colors.black,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      vSizedBox2,
                                                      MainHeadingText(
                                                        text: 'Overtime',
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontFamily: 'bold',
                                                      ),
                                                      vSizedBox2,
                                                      Row(
                                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          // Theme(
                                                          //   data:  Theme.of(context).copyWith(
                                                          //       unselectedWidgetColor: MyColors.primaryColor,
                                                          //       backgroundColor: Colors.white
                                                          //   ),
                                                          //   child: Radio<SingingCharacter>(
                                                          //     value: SingingCharacter.four,
                                                          //     activeColor: MyColors.primaryColor,
                                                          //     groupValue: _character,
                                                          //     onChanged: (SingingCharacter? value) {
                                                          //       setState(() {
                                                          //         _character = value;
                                                          //       });
                                                          //     },
                                                          //   ),
                                                          // ),
                                                          Image.asset(MyImages.mark, height: 20,),hSizedBox05,
                                                          Row(
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  ParagraphText(
                                                                    text: 'Calculate Based On Hour',
                                                                    fontSize: 16,
                                                                    fontFamily: 'semibold',
                                                                    color: Colors.black,
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),


                                                        ],
                                                      ),
                                                      vSizedBox2,
                                                      Row(
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                          Expanded(
                                                            flex: 2,
                                                            child: Column(
                                                              children: [

                                                                Container(
                                                                  child: CustomTextField(
                                                                    showlabel: true,
                                                                      controller: search,
                                                                      hintText: 'HH:MM',
                                                                      label: 'Total Hours Worked',
                                                                    labelfont: 12,
                                                                    labelcolor: Colors.black,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Icon(Icons.close, size: 24,color: MyColors.labelcolor,),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              children: [

                                                                Container(
                                                                  child: CustomTextField(
                                                                    showlabel: true,
                                                                    controller: search,
                                                                    hintText: '',
                                                                    label: 'Type',
                                                                    labelcolor: Colors.black,
                                                                    labelfont: 12,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Icon(Icons.close, size: 24,color: MyColors.labelcolor),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  child: CustomTextField(
                                                                    showlabel: true,
                                                                    controller: search,
                                                                    hintText: '',
                                                                    label: 'OT Wages',
                                                                    labelcolor: Colors.black,
                                                                    labelfont: 12,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      vSizedBox4,
                                                      Row(
                                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          // Theme(
                                                          //   data:  Theme.of(context).copyWith(
                                                          //       unselectedWidgetColor: MyColors.primaryColor,
                                                          //       backgroundColor: Colors.white
                                                          //   ),
                                                          //   child: Radio<SingingCharacter>(
                                                          //     value: SingingCharacter.four,
                                                          //     activeColor: MyColors.primaryColor,
                                                          //     groupValue: _character,
                                                          //     onChanged: (SingingCharacter? value) {
                                                          //       setState(() {
                                                          //         _character = value;
                                                          //       });
                                                          //     },
                                                          //   ),
                                                          // ),
                                                          Image.asset(MyImages.mark, height: 20,),hSizedBox05,
                                                          Row(
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  ParagraphText(
                                                                    text: 'Calculate Based On Day',
                                                                    fontSize: 16,
                                                                    fontFamily: 'semibold',
                                                                    color: Colors.black,
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),


                                                        ],
                                                      ),
                                                      vSizedBox,
                                                      CustomTextField(controller: search, hintText: '', showlabel: true,
                                                      label: 'Add Over Time Salary',
                                                        labelfont: 12,
                                                        suffixIcon: MyImages.down_arrow,
                                                        suffixheight: 15,
                                                      ),
                                                      vSizedBox2,
                                                      CustomTextField(controller: search, hintText: '', showlabel: true,
                                                        label: 'Total Amount',
                                                        labelfont: 12,
                                                        labelfontfamily: 'bold',
                                                      ),
                                                      vSizedBox2,
                                                      RoundEdgedButton(
                                                        text: 'ADD OVERTIME',
                                                        fontSize: 16,
                                                        textColor: Colors.white,
                                                        onTap: (){
                                                          Navigator.of(context).pop();
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                );
                                              }
                                          );
                                        },
                                      );
                                    },
                                  )
                                ],
                              ),
                              vSizedBox4,
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50.0),
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
                                              text: '09:00',
                                              fontSize: 24,
                                              fontFamily: 'bold',
                                              color: MyColors.primaryColor,
                                            ),
                                            hSizedBox,
                                            Image.asset(
                                              MyImages.punch_edit,
                                              height: 24,
                                            ),
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
                                          text: '16:00',
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
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      MyImages.map,
                                      height: 24,
                                    ),
                                    hSizedBox,
                                    ParagraphText(
                                      text:
                                          'Molasiyar Maligai, Old tiruchengode \nbustand, Tiruchengode',
                                      color: MyColors.paragraphcolor,
                                      fontSize: 16,
                                    ),
                                  ],
                                ),
                              ),
                              vSizedBox,
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      MyImages.map,
                                      height: 24,
                                    ),
                                    hSizedBox,
                                    ParagraphText(
                                      text:
                                          'Molasiyar Maligai, Old tiruchengode \nbustand, Tiruchengode',
                                      color: MyColors.paragraphcolor,
                                      fontSize: 16,
                                    ),
                                  ],
                                ),
                              ),
                              vSizedBox,
                              Center(
                                child: ParagraphText(
                                  text: 'PUNCH OUT TIME CORRECTION PENDING',
                                  color: MyColors.red,
                                  fontSize: 16,
                                  fontFamily: 'regular',
                                ),
                              ),
                              Divider(
                                height: 30,
                              ),
                              MainHeadingText(
                                text: 'Change Status',
                              ),
                              vSizedBox,
                              Row(
                                children: [
                                  Chip_Custom(text: 'PRESENT'),
                                  hSizedBox,
                                  Chip_Custom(text: 'FULL DAY'),
                                  hSizedBox,
                                  Chip_Custom(
                                    text: 'HALF DAY',
                                    background: Color(0xFFFEF9C3),
                                    textcolor: Color(0xFFCD8A04),
                                  ),
                                ],
                              ),
                              vSizedBox,
                              Row(
                                children: [
                                  Chip_Custom(
                                    text: 'ABSENT',
                                    background: MyColors.red.withOpacity(0.1),
                                    textcolor: MyColors.red,
                                  ),
                                  hSizedBox,
                                  Chip_Custom(
                                    text: 'PAID LEAVE',
                                    textcolor: Color(0xFF4872EC),
                                    background: Color(0xFFDBEAFE),
                                  ),
                                  hSizedBox,
                                  Chip_Custom(
                                    text: 'UN.P LEAVE',
                                    background: Color(0xFFCCFBF1),
                                    textcolor: Color(0xFF199992),
                                  ),
                                ],
                              ),
                              vSizedBox,
                              Row(
                                children: [
                                  Chip_Custom(
                                    text: 'DAY OFF',
                                    background: Color(0xFFF3F4F6),
                                    textcolor: Color(0xFF4B5563),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                    },
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
