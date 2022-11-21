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
import 'package:salaryredesign/widgets/dropdownbottomsheet.dart';

import '../../widgets/customtextfield.dart';

class WorkRateTemplate extends StatefulWidget {
  const WorkRateTemplate({Key? key}) : super(key: key);

  @override
  State<WorkRateTemplate> createState() => _WorkRateTemplateState();
}

enum SingingCharacter { lafayette, jefferson }

class _WorkRateTemplateState extends State<WorkRateTemplate> {
  TextEditingController name = TextEditingController();
  SingingCharacter? _character = SingingCharacter.lafayette;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Work Rates Settings', titlecenter: false),
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
                      MainHeadingText(text: 'Work Rates Settings', fontSize: 16,),
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
                            height: 450,
                            context: context,
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                vSizedBox4,
                                MainHeadingText(text: 'Add New Work Rates', fontSize: 20, color: MyColors.black,),
                                vSizedBox4,
                                CustomTextField(controller: name, hintText: '', label: 'Title', showlabel: true,),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '', label: 'Description', showlabel: true,),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '', label: 'Work Rate', showlabel: true,),
                                vSizedBox4,
                                RoundEdgedButton(
                                  text: 'Save',
                                  onTap: (){},
                                  fontSize: 16,
                                  fontfamily: 'bold',
                                ),
                                vSizedBox2,
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  vSizedBox2,
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(controller: name, hintText: ''),
                      ),
                      hSizedBox,
                      Image.asset('assets/images/search_full.png', width: 50,),
                    ],
                  ),
                ],
              ),
            ),
            vSizedBox,
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            vSizedBox05,
                            MainHeadingText(text: 'Shirt Full Finish', color: MyColors.black, fontSize: 16,),
                            vSizedBox05,
                            ParagraphText(
                              text: 'shirt full finishing  with attach colar and bottom',
                              fontSize: 14,
                              color: MyColors.labelcolor,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                        child: MainHeadingText(text: '₹ 25', color: MyColors.black, fontSize: 16,),
                      ),
                      PopupmenuButtonCustom(
                        onTapedit: (){
                          bottomsheet(
                            height: 450,
                            context: context,
                            child:
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  vSizedBox4,
                                  MainHeadingText(text: 'Edit Work Rates', fontSize: 20, color: MyColors.black,),
                                  vSizedBox4,
                                  CustomTextField(controller: name, hintText: '', label: 'Title', showlabel: true,),
                                  vSizedBox2,
                                  CustomTextField(controller: name, hintText: '', label: 'Description', showlabel: true,),
                                  vSizedBox2,
                                  CustomTextField(controller: name, hintText: '', label: 'Work Rate', showlabel: true,),
                                  vSizedBox4,
                                  RoundEdgedButton(
                                    text: 'Update Work Rates',
                                    onTap: (){},
                                    fontSize: 16,
                                    fontfamily: 'bold',
                                  ),
                                  vSizedBox2,
                                ],
                              ),
                            ),
                          );
                        },
                        deletemain: 'Delete This Work Rates',
                        deletesub: 'Do you wish to delete this Work Rates?',
                      )
                    ],
                  ),
                ],
              ),
            ),
            vSizedBox,
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            vSizedBox05,
                            MainHeadingText(text: 'Front & Back Attach', color: MyColors.black, fontSize: 16,),
                            vSizedBox05,
                            ParagraphText(
                              text: 'shirt full finishing  with attach colar and bottom',
                              fontSize: 14,
                              color: MyColors.labelcolor,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                        child: MainHeadingText(text: '₹ 25', color: MyColors.black, fontSize: 16,),
                      ),
                      PopupmenuButtonCustom(
                        onTapedit: (){
                          bottomsheet(
                            height: 450,
                            context: context,
                            child:
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  vSizedBox4,
                                  MainHeadingText(text: 'Edit Work Rates', fontSize: 20, color: MyColors.black,),
                                  vSizedBox4,
                                  CustomTextField(controller: name, hintText: '', label: 'Title', showlabel: true,),
                                  vSizedBox2,
                                  CustomTextField(controller: name, hintText: '', label: 'Description', showlabel: true,),
                                  vSizedBox2,
                                  CustomTextField(controller: name, hintText: '', label: 'Work Rate', showlabel: true,),
                                  vSizedBox4,
                                  RoundEdgedButton(
                                    text: 'Update Work Rates',
                                    onTap: (){},
                                    fontSize: 16,
                                    fontfamily: 'bold',
                                  ),
                                  vSizedBox2,
                                ],
                              ),
                            ),
                          );
                        },
                        deletemain: 'Delete This Work Rates',
                        deletesub: 'Do you wish to delete this Work Rates?',
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
