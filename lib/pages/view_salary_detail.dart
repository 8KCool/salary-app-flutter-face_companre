import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';

import '../constants/image_urls.dart';
import '../functions/navigation_functions.dart';
import '../widgets/rowItem.dart';

class ViewSalaryDetail extends StatefulWidget {
  const ViewSalaryDetail({Key? key}) : super(key: key);

  @override
  State<ViewSalaryDetail> createState() => _ViewSalaryDetailState();
}

class _ViewSalaryDetailState extends State<ViewSalaryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: appBar(context: context, title: 'Salary Calculation', titlecenter: false),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Column(
                children: [
                  ParagraphText(text: 'You have earned gross pay of Febrary month', color: MyColors.headingcolor,),
                  vSizedBox,
                  MainHeadingText(text: '01-02-2022 to 28-02-2022', fontSize: 16,),
                  vSizedBox2,
                ],
              )),
              Row(
                children: [
                  MainHeadingText(text: 'Attendance Detail', fontFamily: 'bold',),
                ],
              ),
              vSizedBox,
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: MyColors.disabledcolor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ParagraphText(text: 'Payable Days'),
                        ParagraphText(text: '31 Days', color: MyColors.primaryColor, fontFamily: 'bold',),
                      ],
                    ),
                    vSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ParagraphText(text: 'Worked On'),
                        ParagraphText(text: '20 Days', color: MyColors.primaryColor, fontFamily: 'bold',),
                      ],
                    ),
                    vSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ParagraphText(text: 'Week off'),
                        ParagraphText(text: '6 Days', color: MyColors.primaryColor, fontFamily: 'bold',),
                      ],
                    ),
                    vSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ParagraphText(text: 'Public Holiday Day'),
                        ParagraphText(text: '1 Day', color: MyColors.primaryColor, fontFamily: 'bold',),
                      ],
                    ),
                    vSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ParagraphText(text: 'Paid Leaves'),
                        ParagraphText(text: '2 Days', color: MyColors.primaryColor, fontFamily: 'bold',),
                      ],
                    ),
                    vSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ParagraphText(text: 'Unpaid Leaves'),
                        ParagraphText(text: '2 Days', color: MyColors.primaryColor, fontFamily: 'bold',),
                      ],
                    ),
                    vSizedBox2,
                    RoundEdgedButton(text: 'EDIT ATTENDANCE')
                  ],
                ),

              ),
              vSizedBox4,
              MainHeadingText(text: 'Earnings'),
              vSizedBox2,
              RowItem(text: 'Basic Salary', price: '₹ 20,000'),
              vSizedBox,
              RowItem(text: 'Allowance', price: '₹ 10,000'),
              vSizedBox,
              RowItem(text: 'Overtime', price: '₹ 1,000', isAdd: true),
              vSizedBox,
              RowItem(text: 'Bonus ', price: '₹ 1,500', isAdd: true),
              vSizedBox,
              RowItem(text: 'Pay Per Work Wages', price: '₹ 500', isAdd: true),
              vSizedBox4,

              MainHeadingText(text: 'Deductions'),
              vSizedBox2,
              RowItem(text: 'TDS', isAdd: true, price: '₹ 0'),
              vSizedBox,
              RowItem(text: 'PF', price: '₹ 1,500.75'),
              vSizedBox,
              RowItem(text: 'ESI', price: '₹ 88.90'),
              vSizedBox,
              RowItem(text: 'PT ', price: '₹ 0'),
              vSizedBox,
              RowItem(text: 'Deduction', price: '₹ 500', isAdd: true),
              vSizedBox,
              RowItem(text: 'Loan', isUnpaid: true, price: '₹ 500', isAdd: true),
              vSizedBox,
              RowItem(text: 'Advance', isUnpaid: true, price: '₹ 500', isAdd: true),

              vSizedBox2,
              vSizedBox,
              RoundEdgedButton(text: 'FINALIZE SALARY',
                onTap: (){
                  print('hkh');
                  Future.delayed(
                      const Duration(seconds: 0),
                          () =>
                          showCustomDialogBox(
                              context: context,
                              child: Column(
                                children: [
                                  vSizedBox,
                                  MainHeadingText(text: 'Are You Sure?', color: MyColors.black,),
                                  vSizedBox2,
                                  ParagraphText(text: 'Are you Sure you want to Confirm?'),
                                  vSizedBox,
                                  ParagraphText(text: 'You cannot make changes to calculation after this'),
                                  vSizedBox4,
                                  MainHeadingText(text: 'Salary Amount is : ₹ 25,000', color: Color(0xFE16A34A),),
                                  vSizedBox4,
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: RoundEdgedButton(
                                            text: 'Cancel',
                                            color: Color(0xFFF3F4F6),
                                            textColor: MyColors.black,
                                          )),
                                      hSizedBox,
                                      Expanded(
                                          child: RoundEdgedButton(
                                            text: 'Finalize Salary',
                                          )),
                                    ],
                                  ),
                                ],
                              )
                          ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
