import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/employee/bank_upi_page.dart';
import 'package:salaryredesign/pages/employee/documents.dart';
import 'package:salaryredesign/pages/employee/increament_detail.dart';
import 'package:salaryredesign/pages/employee/personal_details.dart';
import 'package:salaryredesign/pages/employee/work.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';

import '../../widgets/avatar.dart';

class Edit_Employee_Profile_Page extends StatefulWidget {
  const Edit_Employee_Profile_Page({Key? key}) : super(key: key);

  @override
  State<Edit_Employee_Profile_Page> createState() => _Edit_Employee_Profile_PageState();
}

class _Edit_Employee_Profile_PageState extends State<Edit_Employee_Profile_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(
          context: context,
          titlecenter: true,
          title: 'Work',
      ),
      body: Container(

        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: MyColors.primaryColor,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        child: CircleAvatarcustom(
                          borderradius: 100,
                          image: MyImages.avatrtwo,
                          height: 120,
                          width: 120,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: Colors.white,
                            width: 2.5
                          )
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                          right: 0,
                          child: Image.asset(MyImages.camera_white,height: 30,)
                      )
                    ],
                  ),
                  vSizedBox4,
                ],
              ),
            ),
            vSizedBox2,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  clickable_list(
                    text: 'Personal Detail', image: false, colorborderleft: MyColors.primaryColor,
                  onTap: (){
                      push(context: context, screen: Personal_details_Page());
                  },
                  ),
                  clickable_list(
                    text: 'Work',image: false, img: MyImages.emp2, colorborderleft: MyColors.red,
                    onTap: (){
                      push(context: context, screen: Employee_Work_Details());
                    },
                  ),
                  clickable_list(
                    text: 'Bank / UPI',image: false, img: MyImages.emp3, colorborderleft: MyColors.secondarycolor,
                    onTap: (){
                      push(context: context, screen: Bank_UPI_Page());
                    },
                  ),
                  clickable_list(
                    text: 'Increment Detail',image: false, img: MyImages.emp4, colorborderleft: MyColors.yellow,
                    onTap: (){
                      push(context: context, screen: Increament_Detail_Page());
                    },
                  ),
                  clickable_list(
                    text: 'Documents',image: false, img: MyImages.emp4, colorborderleft: MyColors.headingcolor,
                    onTap: (){
                      push(context: context, screen: Documents_Page());
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
