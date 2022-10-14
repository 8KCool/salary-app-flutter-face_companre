import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/constans.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/all_employee.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:salaryredesign/pages/attandance_page.dart';
import 'package:salaryredesign/pages/settings/branch_settings.dart';
import 'package:salaryredesign/pages/settings/department_settings.dart';
import 'package:salaryredesign/pages/settings/holiday_calender.dart';
import 'package:salaryredesign/pages/settings/holiday_management.dart';
import 'package:salaryredesign/pages/settings/shift_settings.dart';
import 'package:salaryredesign/pages/settings/weekoff_management.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';

import '../../providers/clock.dart';
import '../../widgets/custom_widgets.dart';

class Holiday_Settings_Page extends StatefulWidget {
  const Holiday_Settings_Page({Key? key}) : super(key: key);

  @override
  State<Holiday_Settings_Page> createState() => _Holiday_Settings_PageState();
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
final List<String> items = [
  'Item1',
  'Item2',
  'Item3',
  'Item4',
];
List<String> selectedItems = [];
List Name = [
  'Attendance Approval',
  'Time correction Approval',
  'Leave Request',
  'Permission   Request',
  'Overtime Request',
  'Pay Per Work',
];

class _Holiday_Settings_PageState extends State<Holiday_Settings_Page> {
  getHoliday()async{
    print(" getHoliday()async{");
    await Provider.of<GlobalModal>(context, listen: false)
        .getHoliday(context,'0','0');
    print(" end of ptovider-----------------------");
  }
  @override
  void initState() {
    // TODO: implement initState
    getHoliday();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.disabledcolor,
      appBar: appBar(
          context: context,
          title:Provider.of<GlobalModal>(context, listen: false).userData?.companyName,
          implyLeading: false,
          titlecenter: false,
          leading: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          appBarColor: MyColors.primaryColor,
          titleColor: Colors.white,
          actions: [
            Icon(Icons.notifications_outlined),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.help_outline_outlined,
              ),
            ),
          ]
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_outlined, size: 20, color: MyColors.primaryColor,),
                    hSizedBox,
                    ParagraphText(text: 'Holiday Settings', color: MyColors.primaryColor,)
                  ],
                ),
              ),
            ),
            vSizedBox2,
            Padding(
              padding: horizontal_pad + EdgeInsets.symmetric(horizontal: 36),
              child: Column(
                children: [
                  clickable_list(
                    text: 'Holiday Management',
                    img: MyImages.branch_settings,
                    colorborderleft: Color(0xFFB98548),
                    image: false,
                    fontSize: 20,
                    verticalpadding: 25,
                    fontFamily: 'regular',
                    onTap: (){
                      push(context: context, screen: Holiday_Management_Page());
                    },
                  ),
                  clickable_list(
                    text: 'Weekoff Settings',
                    img: MyImages.shift_settings,
                    colorborderleft:MyColors.primaryColor,
                    image: false,
                    fontSize: 20,
                    verticalpadding: 25,
                    fontFamily: 'regular',
                    onTap: (){
                      push(context: context, screen: WeekOff_Management_Page());
                    },
                  ),
                  clickable_list(
                    text: 'Leave Settings',
                    img: MyImages.attendance_settings,
                    colorborderleft: MyColors.secondarycolor,
                    image: false,
                    fontSize: 20,
                    verticalpadding: 25,
                    fontFamily: 'regular',
                    onTap: (){
                      // push(context: context, screen: Advance_Page());
                    },
                  ),
                  clickable_list(
                    text: 'Holiday Calender',
                    img: MyImages.holiday_settings,
                    colorborderleft: MyColors.yellow,
                    image: false,
                    fontSize: 20,
                    verticalpadding: 25,
                    fontFamily: 'regular',
                    onTap: (){
                      push(context: context, screen: Holiday_Calender_Page());
                    },
                  ),
















                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
