import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/payroll/add_pay_per_work.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';
import 'package:salaryredesign/widgets/dropdown.dart';

import '../../widgets/customtextfield.dart';

class Time_Correction_Approval_Page extends StatefulWidget {
  const Time_Correction_Approval_Page({Key? key}) : super(key: key);

  @override
  State<Time_Correction_Approval_Page> createState() => _Time_Correction_Approval_PageState();
}

class _Time_Correction_Approval_PageState extends State<Time_Correction_Approval_Page> {
  TextEditingController search = TextEditingController();
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Attendance Correction', titlecenter: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  vSizedBox,
                  CustomTextField(
                    controller: search,
                    hintText: 'Search',
                    prefixIcon: MyImages.search,
                    suffixIcon: MyImages.filter,
                    suffixheight: 20,
                    height: 52,
                    onTapsuffix: (){
                      bottomsheet(
                        height: 550,
                        context: context,
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            vSizedBox4,
                            MainHeadingText(text: 'Attendance Correction', fontSize: 20, color: MyColors.black,),
                            vSizedBox2,
                            CustomTextField(controller: name, hintText: '',
                              label: 'Select Date',
                              showlabel: true,
                              labelcolor: MyColors.black,
                              suffixIcon: MyImages.date,
                              suffixheight: 20,
                            ),
                            DropDwon(
                              label: 'Select Branch',
                              items: [
                                '','',
                              ],
                            ),
                            DropDwon(
                              label: 'Select Department',
                              items: [
                                '','',
                              ],
                            ),
                            DropDwon(
                              label: 'Select Status',
                              items: [
                                '','',
                              ],
                            ),
                            vSizedBox2,
                            RoundEdgedButton(
                                text: 'SEARCH'
                            ),
                            vSizedBox4,
                          ],
                        ),
                      );
                    },
                  ),
                  vSizedBox,
                ],
              ),
            ),
            vSizedBox,
            Container(
              height: MediaQuery.of(context).size.height - 220,
              color: MyColors.disabledcolor,
              child: DefaultTabController(
                initialIndex: 0,
                length: 2,
                child: Scaffold(
                  backgroundColor: MyColors.disabledcolor,
                  body: Column(
                    children: [
                      Container(
                        color: MyColors.white,
                        child: TabBar(
                          padding: EdgeInsets.symmetric(vertical: 0),
                          indicatorColor: MyColors.yellow,
                          indicatorWeight: 3,
                          tabs: <Widget>[
                            Tab(
                              child: Text('PENDING', style: TextStyle(
                                  color: MyColors.black,
                                  fontSize: 16,
                                  fontFamily: 'bold'
                              ),),
                            ),
                            Tab(
                              child: Text('HISTORY',style: TextStyle(
                                  color: MyColors.black,
                                  fontSize: 16,
                                  fontFamily: 'bold'
                              ),),
                            ),
                          ],
                        ),
                      ),
                      vSizedBox,
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            SingleChildScrollView(
                              child: Container(
                                color: MyColors.disabledcolor,
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                child: Column(
                                  children: [
                                    for(var i=0; i<2; i++)
                                      GestureDetector(
                                        child: Approval_correction_list(
                                            text: 'Praveen Kumar',
                                            subtext: '25-07-2022 15:06',
                                            img: MyImages.avtarone,
                                            chipcolor: MyColors.pending,
                                          location: false,
                                        ),
                                        onTap: (){
                                          bottomsheet(
                                            radius: 0,
                                            height: 380,
                                              context: context,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  vSizedBox2,
                                                  MainHeadingText(text: 'View Attendance Time Correction', fontSize: 20,),
                                                  vSizedBox,
                                                  Approval_correction_list(
                                                    text: 'Praveen Kumar',
                                                    subtext: '25-07-2022 15:06',
                                                    img: MyImages.avtarone,
                                                    chipcolor: MyColors.pending,
                                                    horizontalpad: 0,
                                                  ),
                                                ],
                                              )
                                          );
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Container(
                                color: MyColors.disabledcolor,
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                child: Column(
                                  children: [
                                    for(var i=0; i<2; i++)
                                      GestureDetector(
                                        child: Approval_correction_list(
                                          text: 'Praveen Kumar',
                                          subtext: '25-07-2022 15:06',
                                          img: MyImages.avtarone,
                                          btns: false,
                                          chipcolor: MyColors.chipred,
                                          chiptextcolor: MyColors.white,
                                          chiptext: 'Rejected',
                                          location: false,
                                        ),
                                        onTap: (){
                                          bottomsheet(
                                              radius: 0,
                                              height: 400,
                                              context: context,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  vSizedBox2,
                                                  MainHeadingText(text: 'View Attendance Time Correction', fontSize: 20,),
                                                  vSizedBox,
                                                  Approval_correction_list(
                                                    text: 'Praveen Kumar',
                                                    subtext: '25-07-2022 15:06',
                                                    img: MyImages.avtarone,
                                                    chipcolor: MyColors.secondarycolor,
                                                    chiptextcolor: MyColors.white,
                                                    horizontalpad: 0,
                                                    btns: false,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      MainHeadingText(text: 'Premkumar', fontSize: 15,),
                                                      vSizedBox05,
                                                      ParagraphText(text: 'Approved By', color: MyColors.labelcolor, fontSize: 14,)
                                                    ],
                                                  ),
                                                  vSizedBox2,
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      MainHeadingText(text: 'Reject Reason', fontSize: 15,),
                                                      vSizedBox05,
                                                      ParagraphText(text: 'You take toomany Leave, So it was rejected', color: MyColors.labelcolor, fontSize: 14,)
                                                    ],
                                                  ),
                                                ],
                                              )
                                          );
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
