import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';
import 'package:salaryredesign/widgets/dropdown.dart';

import '../../widgets/avatar.dart';
import '../../widgets/customtextfield.dart';

class WeekOff_Management_Page extends StatefulWidget {
  const WeekOff_Management_Page({Key? key}) : super(key: key);

  @override
  State<WeekOff_Management_Page> createState() => WeekOff_Management_PageState();
}

class WeekOff_Management_PageState extends State<WeekOff_Management_Page> {
  TextEditingController name = TextEditingController();
  List image=[
    MyImages.avtarone,
    MyImages.avatr8,
    MyImages.avatr3,
    MyImages.avatr4,
    MyImages.avatr5,
    MyImages.avatr6,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Weekoff Settings', titlecenter: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(30),
                //   bottomRight: Radius.circular(30),
                // )
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainHeadingText(text: 'Weekoff Management', fontSize: 20,),
                      hSizedBox,
                      hSizedBox05,
                      RoundEdgedButton(
                        text: 'Add New',
                        verticalPadding: 0,
                        color: MyColors.primaryColor,
                        width: 80,
                        horizontalPadding: 0,
                        height: 35,
                        onTap: (){
                          bottomsheet(
                            height: 640,
                              context: context,
                              child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                vSizedBox4,
                                MainHeadingText(text: 'Add Weekoff', fontSize: 20, color: MyColors.black,),
                                DropDwon(
                                  islabel: true,
                                  label: 'Choose Branch',
                                  items: [''],
                                ),
                                DropDwon(
                                  islabel: true,
                                  label: 'Choose Department',
                                  items: [''],
                                ),
                                DropDwon(
                                  islabel: true,
                                  label: 'Choose Day',
                                  items: [''],
                                ),
                                DropDwon(
                                  islabel: true,
                                  label: 'Choose Type',
                                  items: [''],
                                ),
                                DropDwon(
                                  islabel: true,
                                  label: 'Choose Week',
                                  items: [''],
                                ),
                                vSizedBox2,
                                Row(
                                  children: [
                                    Expanded(
                                      child: RoundEdgedButton(
                                        text: 'Cancel',
                                        onTap: (){},
                                        color: MyColors.scaffold,
                                        textColor: MyColors.black,
                                        fontSize: 16,
                                        fontfamily: 'bold',
                                      ),
                                    ),
                                    hSizedBox,
                                    Expanded(
                                      child: RoundEdgedButton(
                                        text: 'Save',
                                        onTap: (){},
                                        fontSize: 16,
                                        fontfamily: 'bold',
                                      ),
                                    ),
                                  ],
                                ),
                                vSizedBox4,
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            vSizedBox,
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              // padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     MainHeadingText(text: 'Summary'),
                  //       RoundEdgedButton(
                  //         text: 'Total Deduction Amount : 1000',
                  //         verticalPadding: 0,
                  //         horizontalPadding: 10,
                  //         // width: MediaQuery.of(context).size.width - 150,
                  //         fontSize: 14,
                  //         height: 35,
                  //         minWidth: 0,
                  //         fontfamily: 'regular',
                  //       ),
                  //   ],
                  // ),
                  vSizedBox,
                  // for(var i=0; i<2; i++)
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: MyColors.white
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ParagraphText(
                                        text: 'Sunday - Full Day',
                                        color: MyColors.green,
                                        fontSize: 14,
                                        fontFamily: 'semibold',
                                      ),
                                      vSizedBox05,
                                      MainHeadingText(
                                        text: 'Week 1, Week 2, Week 3, Week 4, Week 5', color: MyColors.black, fontFamily: 'semibold', fontSize: 16,),
                                      vSizedBox2,
                                      ParagraphText(
                                        text: 'Applied on',
                                        fontSize: 14,
                                        fontFamily: 'bold',
                                        color: MyColors.bordercolor,
                                      ),
                                      vSizedBox05,
                                      ParagraphText(
                                        text: 'All Branches & All Departments',
                                        fontSize: 16,
                                      ),
                                    ],
                                  ),
                                ),
                                PopupmenuButtonCustom(
                                  editbtn: false,
                                  deletemain: 'Delete This Weekoff',
                                  deletesub: 'Do you wish to delete this Weekoff ?',
                                )

                              ],
                            ),
                            // Divider(height: 40, color: Color(0xFFCAD8D8),)

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(height: 10,),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: MyColors.white
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ParagraphText(
                                        text: 'Saturday - Fullday',
                                        color: MyColors.green,
                                        fontFamily: 'semibold',
                                        fontSize: 14,
                                      ),
                                      vSizedBox05,
                                      MainHeadingText(
                                        text: 'Week 2, Week 4', color: MyColors.black, fontFamily: 'semibold', fontSize: 16,),
                                      vSizedBox2,
                                      ParagraphText(
                                        text: 'Applied on',
                                        fontSize: 14,
                                        fontFamily: 'bold',
                                        color: MyColors.bordercolor,
                                      ),
                                      vSizedBox05,
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ParagraphText(
                                            text: 'Ecomads Private Limited, Covai',
                                            fontSize: 16,
                                            color: MyColors.black,
                                          ),
                                          vSizedBox05,
                                          Row(
                                            children: [
                                              hSizedBox05,
                                              Container(
                                                height: 5,
                                                width: 5,
                                                decoration: BoxDecoration(
                                                  color: MyColors.bordercolor,
                                                  borderRadius: BorderRadius.circular(5)
                                                ),
                                              ),
                                              hSizedBox,
                                              ParagraphText(
                                                text: 'All Branches & All Departments',
                                                fontSize: 16,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      vSizedBox,
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ParagraphText(
                                            text: 'Ecomads Private Limited, Covai',
                                            fontSize: 16,
                                            color: MyColors.black,
                                          ),
                                          vSizedBox05,
                                          Row(
                                            children: [
                                              hSizedBox05,
                                              Container(
                                                height: 5,
                                                width: 5,
                                                decoration: BoxDecoration(
                                                    color: MyColors.bordercolor,
                                                    borderRadius: BorderRadius.circular(5)
                                                ),
                                              ),
                                              hSizedBox,
                                              ParagraphText(
                                                text: 'All Branches & All Departments',
                                                fontSize: 16,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                PopupmenuButtonCustom(
                                  editbtn: false,
                                  deletemain: 'Delete This Weekoff',
                                  deletesub: 'Do you wish to delete this Weekoff ?',
                                )

                              ],
                            ),
                            // Divider(height: 40, color: Color(0xFFCAD8D8),)

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(height: 10,),
                      )
                    ],
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
