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

class DesignationSettingPage extends StatefulWidget {
  const DesignationSettingPage({Key? key}) : super(key: key);

  @override
  State<DesignationSettingPage> createState() => _DesignationSettingPageState();
}

class _DesignationSettingPageState extends State<DesignationSettingPage> {
  TextEditingController name = TextEditingController();
  List image=[
    MyImages.avtarone,
    MyImages.avatr8,
    MyImages.avatr3,
    MyImages.avatr4,
    MyImages.avatr5,
    MyImages.avatr6,
  ];
  List role = ['Director', 'Accountant'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Designation Settings', titlecenter: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                )
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainHeadingText(text: 'Designation Settings', fontSize: 20,),
                      hSizedBox,
                      hSizedBox05,
                      RoundEdgedButton(
                        text: 'Add Type',
                        verticalPadding: 0,
                        color: MyColors.primaryColor,
                        minWidth: 0,
                        horizontalPadding: 10,
                        height: 35,
                        onTap: (){
                          bottomsheet(
                            height: 250,
                              context: context,
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                vSizedBox4,
                                MainHeadingText(text: 'Designation', fontSize: 20, color: MyColors.black,),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '',
                                  label: 'Employee Designation',
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
                  vSizedBox
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
                  vSizedBox,
                  // for(var i=0; i<2; i++)
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height - 20,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: MyColors.white
                        ),
                        child: Column(
                          children: [
                            for(var i=0; i < 2; i++)
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          MainHeadingText(text: role[i], color: MyColors.black, fontSize: 16,),
                                        ],
                                      ),
                                    ),
                                    PopupmenuButtonCustom(
                                      onTapedit: (){
                                        bottomsheet(
                                          height: 250,
                                          context: context,
                                          child:
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              vSizedBox4,
                                              MainHeadingText(text: 'Designation', fontSize: 20, color: MyColors.black,),
                                              vSizedBox2,
                                              CustomTextField(controller: name, hintText: '',
                                                label: 'Employee Designation',
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
                                      deletemain: 'Delete This Designation',
                                      deletesub: 'Do you wish to delete this Designation?',
                                    )
                                  ],
                                ),
                                CustomDivider(),
                              ],
                            )
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
