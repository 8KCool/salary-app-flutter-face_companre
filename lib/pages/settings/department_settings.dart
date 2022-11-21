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

class Department_Settings_Page extends StatefulWidget {
  const Department_Settings_Page({Key? key}) : super(key: key);

  @override
  State<Department_Settings_Page> createState() => _Department_Settings_PageState();
}

class _Department_Settings_PageState extends State<Department_Settings_Page> {
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
      appBar: appBar(context: context, title: 'Departments', titlecenter: false),
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
                      MainHeadingText(text: 'Departments', fontSize: 20,),
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
                            height: 450,
                              context: context,
                              child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                vSizedBox4,
                                MainHeadingText(text: 'Add Department', fontSize: 20, color: MyColors.black,),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '',
                                  label: 'Department Name',
                                  showlabel: true,
                                  labelcolor: MyColors.black,
                                ),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '',
                                  label: 'Assign Department head',
                                  showlabel: true,
                                  labelcolor: MyColors.black,
                                ),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '',
                                  label: 'Branch',
                                  showlabel: true,
                                  labelcolor: MyColors.black,
                                ),
                                vSizedBox2,
                                RoundEdgedButton(
                                  text: 'Submit',
                                  onTap: (){},
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
                  DropDwon(
                    islabel: false,
                    items: ['Choose Branch', 'Branch 1', 'Branch 2'],
                  )
                ],
              ),
            ),
            vSizedBox,
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              // padding: EdgeInsets.all(16),
              // color: Colors.white,
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
                                      MainHeadingText(
                                        text: 'HR Department', color: MyColors.black, fontFamily: 'semibold', fontSize: 16,),
                                      vSizedBox05,
                                      ParagraphText(
                                        text: 'Ecom Ads PVT Ltd, Tiruchengode',
                                      ),
                                      vSizedBox,
                                      ParagraphText(
                                        text: 'Department Head',
                                      ),
                                      vSizedBox,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatarcustom(
                                            image: MyImages.avatr8,
                                            height: 20,
                                            width: 20,
                                            borderradius: 60,
                                          ),
                                          Stack(
                                            children: [
                                              for(var i=0; i<5; i++)
                                                Transform.translate(
                                                  offset: Offset(i<0? -65: i<1? -52 :i<2? -39 : i<3? -26 : i<4? -13: 0, 0),
                                                  child: CircleAvatarcustom(
                                                    image: image[i],
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                PopupmenuButtonCustom(
                                  onTapedit: (){
                                    bottomsheet(
                                      height: 450,
                                      context: context,
                                      child:
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          vSizedBox4,
                                          MainHeadingText(text: 'Edit Department', fontSize: 20, color: MyColors.black,),
                                          vSizedBox2,
                                          CustomTextField(controller: name, hintText: '',
                                            label: 'Department Name',
                                            showlabel: true,
                                            labelcolor: MyColors.black,
                                          ),
                                          vSizedBox2,
                                          CustomTextField(controller: name, hintText: '',
                                            label: 'Assign Department head',
                                            showlabel: true,
                                            labelcolor: MyColors.black,
                                          ),
                                          vSizedBox2,
                                          CustomTextField(controller: name, hintText: '',
                                            label: 'Branch',
                                            showlabel: true,
                                            labelcolor: MyColors.black,
                                          ),
                                          vSizedBox2,
                                          RoundEdgedButton(
                                            text: 'Submit',
                                            onTap: (){},
                                          ),
                                          vSizedBox4,
                                        ],
                                      ),
                                    );
                                  },
                                  deletemain: 'Delete This Department',
                                  deletesub: 'Do you wish to delete this Department ?',
                                )

                              ],
                            ),
                            // Divider(height: 40, color: Color(0xFFCAD8D8),)

                          ],
                        ),
                      ),
                      vSizedBox,
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
