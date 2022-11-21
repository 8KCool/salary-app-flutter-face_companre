import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/employee/edit_profile.dart';
import 'package:salaryredesign/pages/employee/my_request.dart';
import 'package:salaryredesign/pages/employee_profile_detail.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';

class MyPorfile_Page extends StatefulWidget {
  const MyPorfile_Page({Key? key}) : super(key: key);

  @override
  State<MyPorfile_Page> createState() => _MyPorfile_PageState();
}

class _MyPorfile_PageState extends State<MyPorfile_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: 'My Profile', titlecenter: false),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            vSizedBox2,
            clickable_list(
              text: 'My Details', img: MyImages.emp1, colorborderleft: MyColors.secondarycolor,
              onTap: (){
                push(context: context, screen: Edit_Employee_Profile_Page());
              },
            ),
            clickable_list(text: 'My Attendance', img: MyImages.emp2, colorborderleft: MyColors.yellow,
              onTap: (){
                push(context: context, screen: Employee_Profile_Details());
              },
            ),
            clickable_list(text: 'My Request', img: MyImages.emp3, colorborderleft: MyColors.red,
              onTap: (){
                push(context: context, screen: MyRequest_Page());
              },
            ),
            clickable_list(text: 'Holiday List', img: MyImages.emp4, colorborderleft: MyColors.primaryColor,
              onTap: (){
                push(context: context, screen: Edit_Employee_Profile_Page());
              },
            ),
          ],
        ),
      ),
    );
  }
}
