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

class Loan_Page extends StatefulWidget {
  const Loan_Page({Key? key}) : super(key: key);

  @override
  State<Loan_Page> createState() => _Loan_PageState();
}

class _Loan_PageState extends State<Loan_Page> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Loan', titlecenter: false),
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
                    children: [
                      MainHeadingText(text: 'Loan', fontSize: 20,),
                      hSizedBox,
                      hSizedBox05,
                      RoundEdgedButton(
                        text: 'Add',
                        verticalPadding: 0,
                        color: MyColors.secondarycolor,
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
                                MainHeadingText(text: 'Add Loan', fontSize: 16, color: MyColors.black,),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '',
                                  label: 'Date Of Payment',
                                  showlabel: true,
                                  labelcolor: MyColors.black,
                                ),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '',
                                  label: 'Payment Amount',
                                  showlabel: true,
                                  labelcolor: MyColors.black,
                                ),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '',
                                  label: 'Notes',
                                  showlabel: true,
                                  labelcolor: MyColors.black,
                                ),
                                vSizedBox2,
                                RoundEdgedButton(
                                    text: 'ADD LOAN'
                                ),
                                vSizedBox4,
                              ],
                            ),
                          );
                        },
                      ),
                      hSizedBox05,hSizedBox,
                      RoundEdgedButton(
                        text: 'Deduct',
                        verticalPadding: 0,
                        color: MyColors.red,
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
                                MainHeadingText(text: 'Deduct Loan', fontSize: 16, color: MyColors.black,),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '',
                                  label: 'Date Of Payment',
                                  showlabel: true,
                                  labelcolor: MyColors.black,
                                ),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '',
                                  label: 'Payment Amount',
                                  showlabel: true,
                                  labelcolor: MyColors.black,
                                ),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '',
                                  label: 'Notes',
                                  showlabel: true,
                                  labelcolor: MyColors.black,
                                ),
                                vSizedBox2,
                                RoundEdgedButton(
                                    text: 'DEDUCT LOAN'
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
                  List_bonus(
                    text: '14-07-2022',
                    subtext: 'Employee gets handloan...',
                    price: '₹ 1,000',
                    img: MyImages.red_up,
                    deletemain: 'Delete This Employee Loan Detail',
                    deletesub: 'Do you wish to delete this employee Loan detail ?',
                  ),
                  vSizedBox,
                  List_bonus(
                    text: '14-07-2022',
                    subtext: 'July salary',
                    price: '₹ 5,000',
                    img: MyImages.green_up,
                    deletemain: 'Delete This Employee Loan Detail',
                    deletesub: 'Do you wish to delete this employee Loan detail ?',
                  ),
                  vSizedBox,
                  List_bonus(
                    text: '14-07-2022',
                    subtext: 'Employee gets loan for bike...',
                    price: '₹ 5,000',
                    img: MyImages.red_up,
                    deletemain: 'Delete This Employee Loan Detail',
                    deletesub: 'Do you wish to delete this employee Loan detail ?',
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
