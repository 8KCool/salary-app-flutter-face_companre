import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/constans.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/all_employee.dart';
import 'package:salaryredesign/pages/approvals/attendance_approval.dart';
import 'package:salaryredesign/pages/approvals/leave_request.dart';
import 'package:salaryredesign/pages/approvals/overtime_request.dart';
import 'package:salaryredesign/pages/approvals/pay_per_work_manage.dart';
import 'package:salaryredesign/pages/approvals/permission_request.dart';
import 'package:salaryredesign/pages/approvals/time_correction_approval.dart';
import 'package:salaryredesign/pages/attandance_page.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';

import '../../widgets/custom_widgets.dart';

class Manage_Approvals_Page extends StatefulWidget {
  const Manage_Approvals_Page({Key? key}) : super(key: key);

  @override
  State<Manage_Approvals_Page> createState() => _Manage_Approvals_PageState();
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

class _Manage_Approvals_PageState extends State<Manage_Approvals_Page> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.arrow_back_outlined, size: 20, color: MyColors.primaryColor,),
                hSizedBox,
                ParagraphText(text: 'Manage Approvals', color: MyColors.primaryColor,)
              ],
            ),
          ),
          vSizedBox2,
          Padding(
            padding: horizontal_pad + EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                clickable_list(
                  text: 'Attendance Approval',
                  img: MyImages.attendance_approval,
                  colorborderleft: Color(0xFF33CBCB),
                  onTap: (){
                    push(context: context, screen: Attendance_Approval_Page());
                  },
                ),
                clickable_list(
                  text: 'Time correction Approval',
                  img: MyImages.time_correction_approval,colorborderleft: Color(0xFF33CBCB),
                  onTap: (){
                    push(context: context, screen: Time_Correction_Approval_Page());
                  },
                ),
                clickable_list(
                  text: 'Leave Request',
                  img: MyImages.leave_request,
                  colorborderleft: Color(0xFF33CBCB),
                  onTap: (){
                    push(context: context, screen: Leave_Request_Page());
                  },
                ),
                clickable_list(
                  text: 'Permission Request',
                  img: MyImages.permission_request,
                  colorborderleft: Color(0xFF33CBCB),
                  onTap: (){
                    push(context: context, screen: Permission_Request_Page());
                  },
                ),
                clickable_list(
                  text: 'Overtime Request',
                  img: MyImages.overtime_request,
                  colorborderleft: Color(0xFF33CBCB),
                  onTap: (){
                    push(context: context, screen: Overtime_Request_Page());
                  },
                ),
                clickable_list(
                  text: 'Pay Per Work',
                  img: MyImages.pay_per_work,
                  colorborderleft: Color(0xFF33CBCB),
                  onTap: (){
                    push(context: context, screen: Manage_Pay_Per_Work_Page());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
