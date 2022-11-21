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
import 'package:flutter_switch/flutter_switch.dart';


import '../../widgets/customtextfield.dart';

class PoliciesPage extends StatefulWidget {
  const PoliciesPage({Key? key}) : super(key: key);

  @override
  State<PoliciesPage> createState() => _PoliciesPageState();
}

class _PoliciesPageState extends State<PoliciesPage> {
  TextEditingController search = TextEditingController();
  TextEditingController name = TextEditingController();
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Policies', titlecenter: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 110,
              color: MyColors.disabledcolor,
              child: DefaultTabController(
                initialIndex: 0,
                length: 2,
                child: Scaffold(
                  backgroundColor: MyColors.disabledcolor,
                  body: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 5, right: 10, left: 10),
                        decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(18),
                            bottomRight: Radius.circular(18),
                          )
                        ),
                        child: TabBar(
                          padding: EdgeInsets.symmetric(vertical: 0),
                          indicatorColor: MyColors.yellow,
                          indicatorWeight: 3,
                          tabs: <Widget>[
                            Tab(
                              child: Text('POLICY ADDED', style: TextStyle(
                                color: MyColors.black,
                                fontSize: 16,
                                fontFamily: 'bold'
                              ),),
                            ),
                            Tab(
                              child: Text('ADD NEW POLICY',style: TextStyle(
                                color: MyColors.black,
                                fontSize: 16,
                                fontFamily: 'bold'
                              ),),
                            ),
                          ],
                        ),
                      ),
                      vSizedBox05,
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            SingleChildScrollView(
                              child: Container(
                                decoration: BoxDecoration(
                                   color: MyColors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  )
                                ),
                                height: MediaQuery.of(context).size.height - 165,
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: MainHeadingText(fontFamily: 'semibold', fontSize: 14, text: 'Policy No : 01 [ P01 ]', color: MyColors.primaryColor),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  FlutterSwitch(
                                                    width: 40.0,
                                                    height: 18.0,
                                                    valueFontSize: 25.0,
                                                    toggleSize: 15.0,
                                                    value: status,
                                                    borderRadius: 30.0,
                                                    padding: 1.0,
                                                    onToggle: (val) {
                                                      setState(() {
                                                        status = val;
                                                      });
                                                    },
                                                  ),
                                                  hSizedBox2,
                                                  GestureDetector(
                                                    onTap: () {
                                                      bottomsheet(
                                                        height: 640,
                                                        context: context,
                                                        child:
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            vSizedBox4,
                                                            MainHeadingText(text: 'Edit policy', fontSize: 20, color: MyColors.black,),
                                                            vSizedBox2,
                                                            ParagraphText(color: MyColors.headingcolor, text: 'P01: If employee has not been coming for consecutive 10 days, then generate an  alert on next entry.'),
                                                            DropDwon(
                                                              islabel: true,
                                                              label: 'X Value',
                                                              items: [''],
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
                                                            vSizedBox,
                                                            vSizedBox05,
                                                            CustomTextField(controller: name, hintText: '', showlabel: true, label: 'Effective From',),
                                                            vSizedBox,

                                                            ParagraphText(text: 'This new policy will be effective from 15th Jun 2022 onwards.'),
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
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Image.asset('assets/images/punch_edit.png', width: 18,),
                                                        hSizedBox05,
                                                        MainHeadingText(text: 'Edit', color: MyColors.primaryColor, fontSize: 16,)
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )

                                          ],
                                        ),
                                        vSizedBox,
                                        ParagraphText(color: MyColors.headingcolor, text: 'If employee has not  been coming for consecutive 10 days, then generate an alert on next entry.')
                                      ],
                                    ),
                                    CustomDivider(),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: MainHeadingText(fontFamily: 'semibold', fontSize: 14, text: 'Policy No : 01 [ P01 ]', color: MyColors.primaryColor),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  FlutterSwitch(
                                                    width: 40.0,
                                                    height: 18.0,
                                                    valueFontSize: 25.0,
                                                    toggleSize: 15.0,
                                                    value: status,
                                                    borderRadius: 30.0,
                                                    padding: 1.0,
                                                    onToggle: (val) {
                                                      setState(() {
                                                        status = val;
                                                      });
                                                    },
                                                  ),
                                                  hSizedBox2,
                                                  GestureDetector(
                                                    onTap: () {
                                                      bottomsheet(
                                                        height: 640,
                                                        context: context,
                                                        child:
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            vSizedBox4,
                                                            MainHeadingText(text: 'Edit policy', fontSize: 20, color: MyColors.black,),
                                                            vSizedBox2,
                                                            ParagraphText(color: MyColors.headingcolor, text: 'P01: If employee has not been coming for consecutive 10 days, then generate an  alert on next entry.'),
                                                            DropDwon(
                                                              islabel: true,
                                                              label: 'X Value',
                                                              items: [''],
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
                                                            vSizedBox,
                                                            vSizedBox05,
                                                            CustomTextField(controller: name, hintText: '', showlabel: true, label: 'Effective From',),
                                                            vSizedBox,

                                                            ParagraphText(text: 'This new policy will be effective from 15th Jun 2022 onwards.'),
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
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Image.asset('assets/images/punch_edit.png', width: 18,),
                                                        hSizedBox05,
                                                        MainHeadingText(text: 'Edit', color: MyColors.primaryColor, fontSize: 16,)
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )

                                          ],
                                        ),
                                        vSizedBox,
                                        ParagraphText(color: MyColors.headingcolor, text: 'If employee has not  been coming for consecutive 10 days, then generate an alert on next entry.')
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Container(
                                height: MediaQuery.of(context).size.height - 165,
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                decoration: BoxDecoration(
                                  color: MyColors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  )
                                ),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: MainHeadingText(fontFamily: 'semibold', fontSize: 14, text: 'Policy No : 01 [ P01 ]', color: MyColors.primaryColor),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  FlutterSwitch(
                                                    width: 40.0,
                                                    height: 18.0,
                                                    valueFontSize: 25.0,
                                                    toggleSize: 15.0,
                                                    value: status,
                                                    borderRadius: 30.0,
                                                    padding: 1.0,
                                                    onToggle: (val) {
                                                      setState(() {
                                                        status = val;
                                                      });
                                                    },
                                                  ),
                                                  hSizedBox2,
                                                  GestureDetector(
                                                    onTap: () {
                                                      bottomsheet(
                                                        height: 640,
                                                        context: context,
                                                        child:
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            vSizedBox4,
                                                            MainHeadingText(text: 'Edit policy', fontSize: 20, color: MyColors.black,),
                                                            vSizedBox2,
                                                            ParagraphText(color: MyColors.headingcolor, text: 'P01: If employee has not been coming for consecutive 10 days, then generate an  alert on next entry.'),
                                                            DropDwon(
                                                              islabel: true,
                                                              label: 'X Value',
                                                              items: [''],
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
                                                            vSizedBox,
                                                            vSizedBox05,
                                                            CustomTextField(controller: name, hintText: '', showlabel: true, label: 'Effective From',),
                                                            vSizedBox,

                                                            ParagraphText(text: 'This new policy will be effective from 15th Jun 2022 onwards.'),
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
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Image.asset('assets/images/punch_edit.png', width: 18,),
                                                        hSizedBox05,
                                                        MainHeadingText(text: 'Edit', color: MyColors.primaryColor, fontSize: 16,)
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )

                                          ],
                                        ),
                                        vSizedBox,
                                        ParagraphText(color: MyColors.headingcolor, text: 'If employee has not  been coming for consecutive 10 days, then generate an alert on next entry.')
                                      ],
                                    ),
                                    CustomDivider(),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: MainHeadingText(fontFamily: 'semibold', fontSize: 14, text: 'Policy No : 01 [ P01 ]', color: MyColors.primaryColor),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  FlutterSwitch(
                                                    width: 40.0,
                                                    height: 18.0,
                                                    valueFontSize: 25.0,
                                                    toggleSize: 15.0,
                                                    value: status,
                                                    borderRadius: 30.0,
                                                    padding: 1.0,
                                                    onToggle: (val) {
                                                      setState(() {
                                                        status = val;
                                                      });
                                                    },
                                                  ),
                                                  hSizedBox2,
                                                  GestureDetector(
                                                    onTap: () {
                                                      bottomsheet(
                                                        height: 640,
                                                        context: context,
                                                        child:
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            vSizedBox4,
                                                            MainHeadingText(text: 'Edit policy', fontSize: 20, color: MyColors.black,),
                                                            vSizedBox2,
                                                            ParagraphText(color: MyColors.headingcolor, text: 'P01: If employee has not been coming for consecutive 10 days, then generate an  alert on next entry.'),
                                                            DropDwon(
                                                              islabel: true,
                                                              label: 'X Value',
                                                              items: [''],
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
                                                            vSizedBox,
                                                            vSizedBox05,
                                                            CustomTextField(controller: name, hintText: '', showlabel: true, label: 'Effective From',),
                                                            vSizedBox,

                                                            ParagraphText(text: 'This new policy will be effective from 15th Jun 2022 onwards.'),
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
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Image.asset('assets/images/punch_edit.png', width: 18,),
                                                        hSizedBox05,
                                                        MainHeadingText(text: 'Edit', color: MyColors.primaryColor, fontSize: 16,)
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )

                                          ],
                                        ),
                                        vSizedBox,
                                        ParagraphText(color: MyColors.headingcolor, text: 'If employee has not  been coming for consecutive 10 days, then generate an alert on next entry.')
                                      ],
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
