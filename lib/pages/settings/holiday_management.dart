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

class Holiday_Management_Page extends StatefulWidget {
  const Holiday_Management_Page({Key? key}) : super(key: key);

  @override
  State<Holiday_Management_Page> createState() => _Holiday_Management_PageState();
}

class _Holiday_Management_PageState extends State<Holiday_Management_Page> {
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
      appBar: appBar(context: context, title: 'Holiday Management', titlecenter: false),
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
                      MainHeadingText(text: 'Holiday Management', fontSize: 20,),
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
                            height: 550,
                              context: context,
                              child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                vSizedBox4,
                                MainHeadingText(text: 'Add Holiday', fontSize: 20, color: MyColors.black,),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '',
                                  label: 'Choose Date',
                                  showlabel: true,
                                  labelcolor: MyColors.black,
                                  prefixIcon: MyImages.date,
                                  suffixheight: 25,
                                ),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '',
                                  label: 'Holiday Name',
                                  showlabel: true,
                                  labelcolor: MyColors.black,
                                ),
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
                      // hSizedBox05,
                      GestureDetector(
                        onTap: (){
                          bottomsheet(
                            height: 350,
                            context: context,
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                vSizedBox4,
                                MainHeadingText(
                                  text: 'Filter',
                                  fontSize: 20,
                                  color: MyColors.black,
                                ),
                                DropDwon(
                                  islabel: true,
                                  label: 'Select Branch',
                                  items: [''],
                                ),
                                DropDwon(
                                  islabel: true,
                                  label: 'Select Department',
                                  items: [''],
                                ),
                                vSizedBox2,
                                RoundEdgedButton(
                                  text: 'SEARCH',
                                  onTap: (){},
                                ),
                                vSizedBox4,
                              ],
                            ),
                          );
                        },
                        child: Image.asset(MyImages.filter, height: 24,),
                      )
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
                                        text: 'Jan 26, 2022 - Thu',
                                        color: MyColors.primaryColor,
                                        fontSize: 14,
                                      ),
                                      vSizedBox05,
                                      MainHeadingText(
                                        text: 'Republic Day Holiday', color: MyColors.black, fontFamily: 'semibold', fontSize: 16,),
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
                                  issubheading: false,
                                  editbtn: false,
                                  deletemain: 'Are you sure you want to delete this holiday.',
                                  deletesub: 'Do you wish to delete this holiday ?',
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
                                        text: 'Jan 26, 2022 - Thu',
                                        color: MyColors.primaryColor,
                                        fontSize: 14,
                                      ),
                                      vSizedBox05,
                                      MainHeadingText(
                                        text: 'Republic Day Holiday', color: MyColors.black, fontFamily: 'semibold', fontSize: 16,),
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
                                  issubheading: false,
                                  editbtn: false,
                                  deletemain: 'Are you sure you want to delete this holiday.',
                                  deletesub: 'Do you wish to delete this holiday ?',
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
