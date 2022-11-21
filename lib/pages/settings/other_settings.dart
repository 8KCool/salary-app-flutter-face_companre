import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/constans.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/all_employee.dart';
import 'package:salaryredesign/pages/approvals/attendance_approval.dart';
import 'package:salaryredesign/pages/attandance_page.dart';
import 'package:salaryredesign/pages/settings/branch_settings.dart';
import 'package:salaryredesign/pages/settings/department_settings.dart';
import 'package:salaryredesign/pages/settings/employee_category.dart';
import 'package:salaryredesign/pages/settings/roles.dart';
import 'package:salaryredesign/pages/settings/shift_settings.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';

import '../../widgets/custom_widgets.dart';
import 'designation_setting.dart';

class Other_Settings_Page extends StatefulWidget {
  const Other_Settings_Page({Key? key}) : super(key: key);

  @override
  State<Other_Settings_Page> createState() => _Other_Settings_PageState();
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
  'Attendance Approval',
  'Time correction Approval',
  'Leave Request',
  'Permission   Request',
  'Overtime Request',
  'Pay Per Work',
];

class _Other_Settings_PageState extends State<Other_Settings_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.disabledcolor,
      appBar: appBar(
          context: context,
          title: 'Ecomads Private Limited',
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
                    ParagraphText(text: 'Others Settings', color: MyColors.primaryColor,)
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
                    text: 'Departments',
                    img: MyImages.branch_settings,
                    colorborderleft: Color(0xFFB98548),
                    image: false,
                    fontSize: 20,
                    verticalpadding: 25,
                    fontFamily: 'regular',
                    onTap: (){
                      push(context: context, screen: Department_Settings_Page());
                    },
                  ),
                  clickable_list(
                    text: 'Employee Category',
                    img: MyImages.shift_settings,
                    colorborderleft:MyColors.primaryColor,
                    image: false,
                    fontSize: 20,
                    verticalpadding: 25,
                    fontFamily: 'regular',
                    onTap: (){
                      push(context: context, screen: EmployeeCategoryPage());
                    },
                  ),
                  clickable_list(
                    text: 'Designation',
                    img: MyImages.attendance_settings,
                    colorborderleft: MyColors.secondarycolor,
                    image: false,
                    fontSize: 20,
                    verticalpadding: 25,
                    fontFamily: 'regular',
                    onTap: (){
                      push(context: context, screen: DesignationSettingPage());
                    },
                  ),
                  clickable_list(
                    text: 'Roles & Permission',
                    img: MyImages.holiday_settings,
                    colorborderleft: MyColors.yellow,
                    image: false,
                    fontSize: 20,
                    verticalpadding: 25,
                    fontFamily: 'regular',
                    onTap: (){
                      push(context: context, screen: RolesPage());
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
