import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/Login_process/enter_phone_number.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/lists.dart';

class Select_Type_Page extends StatefulWidget {
  const Select_Type_Page({Key? key}) : super(key: key);

  @override
  State<Select_Type_Page> createState() => _Select_Type_PageState();
}

class _Select_Type_PageState extends State<Select_Type_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(MyImages.signup_background),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topLeft
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            vSizedBox8,
            Image.asset(MyImages.logomain, height: 70,),
            vSizedBox4,
            Image.asset(MyImages.selectimage, fit: BoxFit.fitWidth,),
            vSizedBox4,
            MainHeadingText(text: 'Select Your Role', fontSize: 22, fontFamily: 'bold',),
            vSizedBox2,
            GestureDetector(
              onTap: (){
                push(context: context, screen: Enter_Phone_Number());
              },
              child: StaffList(
                  text: 'Business Owner / Admin / HR',
                  subtext: 'Register your company & start attendance ',
                  fontSize: 14,
                  image: MyImages.business_owner,
                  // popupmenu: true,
              ),
            ),
            // vSizedBox05,
            // StaffList(
            //   text: 'Employee',
            //   subtext: 'Register and start marking your attendance',
            //   image: MyImages.employee,
            //   fontSize: 13,
            //   // popupmenu: true,
            // )
          ],



        ),
      ),
    );
  }
}
