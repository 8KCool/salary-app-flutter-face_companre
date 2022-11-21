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

import '../../widgets/customtextfield.dart';

class Shift_Settings_Page extends StatefulWidget {
  const Shift_Settings_Page({Key? key}) : super(key: key);

  @override
  State<Shift_Settings_Page> createState() => _Shift_Settings_PageState();
}

class _Shift_Settings_PageState extends State<Shift_Settings_Page> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Shift Settings', titlecenter: false),
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
                      MainHeadingText(text: 'Shift Settings', fontSize: 20,),
                      hSizedBox,
                      hSizedBox05,
                      RoundEdgedButton(
                        text: 'Add New',
                        verticalPadding: 0,
                        color: MyColors.primaryColor,
                        minWidth: 0,
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
                                MainHeadingText(text: 'Add Shift', fontSize: 20, color: MyColors.black,),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '',
                                  label: 'Shift Name',
                                  showlabel: true,
                                  labelcolor: MyColors.black,
                                ),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '',
                                  label: 'Start Time',
                                  showlabel: true,
                                  labelcolor: MyColors.black,
                                ),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '',
                                  label: 'End time',
                                  showlabel: true,
                                  labelcolor: MyColors.black,
                                ),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '',
                                  label: 'Grace Time (In Mins)',
                                  showlabel: true,
                                  labelcolor: MyColors.black,
                                ),
                                vSizedBox2,
                                Row(
                                  children: [
                                    Expanded(
                                      child: RoundEdgedButton(
                                        text: 'Cancel',
                                        color: MyColors.disabledcolor,
                                        textColor: MyColors.black,
                                        onTap: (){

                                        },
                                      ),
                                    ),
                                    hSizedBox,
                                    Expanded(
                                      child: RoundEdgedButton(
                                        text: 'Save',
                                        onTap: (){},
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
                  vSizedBox,
                ],
              ),
            ),
            vSizedBox,
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(16),
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
                  for(var i=0; i<2; i++)
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainHeadingText(
                                  text: (i==0)? 'Morning Shift': 'Evening Shift', color: (i==0)?MyColors.primaryColor: MyColors.secondarycolor, fontFamily: 'semibold', fontSize: 16,),
                                vSizedBox05,
                                MainHeadingText(text: '09:00 AM - 04:00 PM', color: MyColors.black, fontSize: 20,),
                                vSizedBox05,
                                Row(
                                  children: [Image.asset(MyImages.OT, height: 24, width: 24,),
                                    hSizedBox05,
                                    ParagraphText(
                                      text: 'Grace Time :',
                                      fontSize: 14,
                                      color: MyColors.labelcolor,
                                    ),
                                    hSizedBox05,
                                    ParagraphText(
                                      text: '30 Mins',
                                      fontSize: 14,
                                      color: MyColors.labelcolor,
                                      fontFamily: 'bold',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          PopupmenuButtonCustom(
                            onTapedit: (){
                              bottomsheet(
                                height: 550,
                                context: context,
                                child:
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    vSizedBox4,
                                    MainHeadingText(text: 'Edit Shift', fontSize: 20, color: MyColors.black,),
                                    vSizedBox2,
                                    CustomTextField(controller: name, hintText: '',
                                      label: 'Shift Name',
                                      showlabel: true,
                                      labelcolor: MyColors.black,
                                    ),
                                    vSizedBox2,
                                    CustomTextField(controller: name, hintText: '',
                                      label: 'Start Time',
                                      showlabel: true,
                                      labelcolor: MyColors.black,
                                    ),
                                    vSizedBox2,
                                    CustomTextField(controller: name, hintText: '',
                                      label: 'End time',
                                      showlabel: true,
                                      labelcolor: MyColors.black,
                                    ),
                                    vSizedBox2,
                                    CustomTextField(controller: name, hintText: '',
                                      label: 'Grace Time (In Mins)',
                                      showlabel: true,
                                      labelcolor: MyColors.black,
                                    ),
                                    vSizedBox2,
                                    Row(
                                      children: [
                                        Expanded(
                                          child: RoundEdgedButton(
                                            text: 'Cancel',
                                            color: MyColors.disabledcolor,
                                            textColor: MyColors.black,
                                            onTap: (){

                                            },
                                          ),
                                        ),
                                        hSizedBox,
                                        Expanded(
                                          child: RoundEdgedButton(
                                            text: 'Save',
                                            onTap: (){},
                                          ),
                                        ),
                                      ],
                                    ),
                                    vSizedBox4,
                                  ],
                                ),
                              );
                            },
                            deletemain: 'Delete This Shift',
                            deletesub: 'Do you wish to delete this shift ?',
                          )

                        ],
                      ),
                      Divider(height: 40, color: Color(0xFFCAD8D8),)

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
