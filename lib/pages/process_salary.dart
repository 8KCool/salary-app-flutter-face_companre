import 'package:flutter/material.dart';
import 'package:salaryredesign/pages/salary_process_successfully.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';

import '../constants/colors.dart';
import '../constants/image_urls.dart';
import '../constants/sized_box.dart';
import '../functions/navigation_functions.dart';
import '../widgets/appbar.dart';
import '../widgets/buttons.dart';
import '../widgets/customtextfield.dart';
import '../widgets/dropdown.dart';

class ProcessSalary extends StatefulWidget {
  const ProcessSalary({Key? key}) : super(key: key);

  @override
  State<ProcessSalary> createState() => _ProcessSalaryState();
}

class _ProcessSalaryState extends State<ProcessSalary> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(
        context: context,
        title: 'Salary Calculation',
        titlecenter: false,
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(height: MediaQuery.of(context).size.height - 80,),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(16),
                  height: 100,
                  decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainHeadingText(text: '₹ 90,000', fontSize: 28, color: MyColors.white,),
                      vSizedBox05,
                      ParagraphText(text: 'Total Outstanding', fontSize: 16, color: MyColors.white,)
                    ],
                  )
                ),
                vSizedBox,
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      vSizedBox,
                      CustomTextField(
                        controller: search,
                        hintText: 'Search',
                        prefixIcon: MyImages.search,
                        suffixIcon: MyImages.filter,
                        suffixheight: 20,
                        height: 52,
                        onTapsuffix: (){
                          bottomsheet(
                            height: 660,
                            context: context,
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                vSizedBox4,
                                MainHeadingText(text: 'Filters', fontSize: 20, color: MyColors.black,),
                                vSizedBox2,
                                DropDwon(
                                  label: 'Select Branch',
                                  items: [
                                    '','',
                                  ],
                                ),
                                DropDwon(
                                  label: 'Select Department',
                                  items: [
                                    '','',
                                  ],
                                ),
                                DropDwon(
                                  label: 'Select Role',
                                  items: [
                                    '','',
                                  ],
                                ),
                                DropDwon(
                                  label: 'Select Employee Category',
                                  items: [
                                    '','',
                                  ],
                                ),
                                DropDwon(
                                  label: 'Select Destination',
                                  items: [
                                    '','',
                                  ],
                                ),
                                vSizedBox2,
                                RoundEdgedButton(
                                    text: 'SEARCH'
                                ),
                                vSizedBox4,
                              ],
                            ),
                          );
                        },
                      ),
                      vSizedBox,
                    ],
                  ),
                ),
                vSizedBox,
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      vSizedBox05,
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 30,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFEDBEAFE),
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              child: Center(child: MainHeadingText(text: 'MAY 2022', fontFamily: 'regular', fontSize: 14, color: MyColors.primaryColor,)),
                            ),
                          ),
                          hSizedBox,
                          SizedBox(
                            width: 100,
                            height: 30,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFEFCE7F3),
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              child: Center(child: MainHeadingText(text: 'JUN 2022', fontFamily: 'regular', fontSize: 14, color: Color(0xFEDB2777),)),
                            ),
                          ),
                          hSizedBox,
                          SizedBox(
                            width: 100,
                            height: 30,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFEDBEAFE),
                                borderRadius: BorderRadius.circular(100)
                              ),
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              child: Center(child: MainHeadingText(text: 'JUL 2022', fontFamily: 'regular', fontSize: 14, color: MyColors.primaryColor,)),
                            ),
                          ),
                        ],
                      ),
                      vSizedBox05,
                    ],
                  ),
                ),
                vSizedBox,
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MainHeadingText(text: 'Summary', fontSize: 18,),
                          ParagraphText(text: 'Select All', color: MyColors.headingcolor,)
                        ],
                      ),
                      vSizedBox2,
                      Row(
                        children: [
                          Image.asset('assets/images/20.png', width: 50,),
                          hSizedBox,
                          hSizedBox05,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 97,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    MainHeadingText(text:'Praveen Kumar', fontSize: 16,),
                                    MainHeadingText(text:'₹ 20,000', fontSize: 16,),
                                  ],
                                ),
                              ),
                              vSizedBox,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  MainHeadingText(text: 'View', color: MyColors.primaryColor, fontSize: 14,),
                                  hSizedBox,
                                  hSizedBox05,
                                  MainHeadingText(text: 'Calculate', color: MyColors.primaryColor, fontSize: 14,),
                                  hSizedBox,
                                  hSizedBox05,
                                  MainHeadingText(text: 'Process', color: MyColors.primaryColor, fontSize: 14,),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      CustomDivider(),
                      Row(
                        children: [
                          Image.asset('assets/images/20.png', width: 50,),
                          hSizedBox,
                          hSizedBox05,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 97,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    MainHeadingText(text:'Praveen Kumar', fontSize: 16,),
                                    MainHeadingText(text:'₹ 20,000', fontSize: 16,),
                                  ],
                                ),
                              ),
                              vSizedBox,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  MainHeadingText(text: 'View', color: MyColors.primaryColor, fontSize: 14,),
                                  hSizedBox,
                                  hSizedBox05,
                                  MainHeadingText(text: 'Calculate', color: MyColors.primaryColor, fontSize: 14,),
                                  hSizedBox,
                                  hSizedBox05,
                                  MainHeadingText(text: 'Process', color: MyColors.primaryColor, fontSize: 14,),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                child: RoundEdgedButton(text: 'PROCESS SALARY', width: MediaQuery.of(context).size.width - 40,
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
                                    ParagraphText(textAlign: TextAlign.center, text: 'Are you Sure? you want to process salary to Elavarasan?'),
                                    vSizedBox4,
                                    MainHeadingText(text: 'Salary Amount is : ₹ 25,000', fontSize: 16, color: Color(0xFE16A34A),),
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
                                            child: GestureDetector(
                                              onTap: () => push(context: context, screen: SuccessFullySalaryProcess()),
                                              child: RoundEdgedButton(
                                                text: 'Process Salary',
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                )
                            ));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
