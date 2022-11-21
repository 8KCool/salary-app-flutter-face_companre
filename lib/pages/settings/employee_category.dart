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

class EmployeeCategoryPage extends StatefulWidget {
  const EmployeeCategoryPage({Key? key}) : super(key: key);

  @override
  State<EmployeeCategoryPage> createState() => _EmployeeCategoryPageState();
}

class _EmployeeCategoryPageState extends State<EmployeeCategoryPage> {
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
      appBar: appBar(context: context, title: 'Employee Category Settings', titlecenter: false),
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
                      MainHeadingText(text: 'Employee Category', fontSize: 20,),
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
                                MainHeadingText(text: 'Add Employee Category', fontSize: 20, color: MyColors.black,),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '',
                                  label: 'Employee Category Type',
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
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: MyColors.white
                        ),
                        child: Column(
                          children: [
                            for(var i=0; i < 3; i++)
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          MainHeadingText(text: 'Permanent', color: MyColors.black, fontSize: 16,),
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
                                              MainHeadingText(text: 'Edit Employer Category', fontSize: 20, color: MyColors.black,),
                                              vSizedBox2,
                                              CustomTextField(controller: name, hintText: '',
                                                label: 'Employer Category Type',
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
                                      deletemain: 'Delete This Employee Category',
                                      deletesub: 'Do you wish to delete this Employee Category?',
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
