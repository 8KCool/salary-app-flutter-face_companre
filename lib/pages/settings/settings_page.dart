import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/constans.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/all_employee.dart';

import 'package:salaryredesign/pages/attandance_page.dart';
import 'package:salaryredesign/pages/settings/branch_settings.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';

import '../../providers/clock.dart';
import '../../widgets/custom_widgets.dart';

class Settings_Page extends StatefulWidget {
  const Settings_Page({Key? key}) : super(key: key);

  @override
  State<Settings_Page> createState() => _Settings_PageState();
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

class _Settings_PageState extends State<Settings_Page> {
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
              child: Row(
                children: [
                  Icon(Icons.arrow_back_outlined, size: 20, color: MyColors.primaryColor,),
                  hSizedBox,
                  ParagraphText(text: 'Settings', color: MyColors.primaryColor,)
                ],
              ),
            ),
            vSizedBox2,
            Padding(
              padding: horizontal_pad + EdgeInsets.symmetric(horizontal: 36),
              child: Column(
                children: [
                  clickable_list(
                    text: 'Branch Settings',
                    img: MyImages.branch_settings,
                    colorborderleft: Color(0xFF33CBCB),
                    onTap: (){
                      push(context: context, screen: Branch_Settings_Page());
                    },
                  ),
                  clickable_list(
                    text: 'Shift Settings',
                    img: MyImages.shift_settings,colorborderleft: Color(0xFF33CBCB),
                    onTap: (){
                      // push(context: context, screen: Advance_Page());
                    },
                  ),
                  clickable_list(
                    text: 'Attendance Settings',
                    img: MyImages.attendance_settings,
                    colorborderleft: Color(0xFF33CBCB),
                    onTap: (){
                      // push(context: context, screen: Advance_Page());
                    },
                  ),
                  clickable_list(
                    text: 'Holiday Settings',
                    img: MyImages.holiday_settings,
                    colorborderleft: Color(0xFF33CBCB),
                    onTap: (){
                      // push(context: context, screen: Advance_Page());
                    },
                  ),
                  clickable_list(
                    text: 'Policies',
                    img: MyImages.policies_settings,
                    colorborderleft: Color(0xFF33CBCB),
                    onTap: (){
                      // push(context: context, screen: Advance_Page());
                    },
                  ),
                  clickable_list(
                    text: 'Payroll Settings',
                    img: MyImages.payroll_settings,
                    colorborderleft: Color(0xFF33CBCB),
                    onTap: (){
                      // push(context: context, screen: Advance_Page());
                    },
                  ),
                  clickable_list(
                    text: 'Others',
                    img: MyImages.payroll_settings,
                    colorborderleft: Color(0xFF33CBCB),
                    onTap: (){
                      // push(context: context, screen: Advance_Page());
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
