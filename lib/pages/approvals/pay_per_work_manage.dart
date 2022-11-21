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

import '../../widgets/customtextfield.dart';

class Manage_Pay_Per_Work_Page extends StatefulWidget {
  const Manage_Pay_Per_Work_Page({Key? key}) : super(key: key);

  @override
  State<Manage_Pay_Per_Work_Page> createState() => _Manage_Pay_Per_Work_PageState();
}

class _Manage_Pay_Per_Work_PageState extends State<Manage_Pay_Per_Work_Page> {
  TextEditingController search = TextEditingController();
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Pay Per Work', titlecenter: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainHeadingText(text: 'Pay Per Work', fontSize: 20,),
                      hSizedBox,
                      hSizedBox05,
                      RoundEdgedButton(
                        text: 'Add Pay Per Work',
                        verticalPadding: 0,
                        horizontalPadding: 10,
                        minWidth: 100,
                        height: 35,
                        onTap: (){
                          push(context: context, screen: Add_Pay_Per_Work_Page());
                        },
                      )
                    ],
                  ),
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
                        height: 550,
                        context: context,
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            vSizedBox4,
                            MainHeadingText(text: 'Pay per work', fontSize: 20, color: MyColors.black,),
                            vSizedBox2,
                            CustomTextField(controller: name, hintText: '',
                              label: 'Select Date',
                              showlabel: true,
                              labelcolor: MyColors.black,
                              suffixIcon: MyImages.date,
                              suffixheight: 20,
                            ),
                            vSizedBox2,
                            CustomTextField(controller: name, hintText: '',
                              label: 'Employee search',
                              showlabel: true,
                              labelcolor: MyColors.black,
                              prefixIcon: MyImages.search,
                              suffixheight: 20,
                            ),
                            DropDwon(
                              label: 'Item Name',
                              items: [
                                '','',
                              ],
                            ),
                            DropDwon(
                              label: 'Select Status',
                              items: [
                                '','',
                              ],
                            ),
                            vSizedBox2,
                            RoundEdgedButton(
                                text: 'SEARCH',
                              fontSize: 16,
                            ),
                            vSizedBox4,
                          ],
                        ),
                      );
                    },
                  ),
                  vSizedBox2,

                ],
              ),
            ),
            vSizedBox,
            Container(
              height: MediaQuery.of(context).size.height - 220,
              color: MyColors.disabledcolor,
              child: DefaultTabController(
                initialIndex: 0,
                length: 2,
                child: Scaffold(
                  backgroundColor: MyColors.disabledcolor,
                  body: Column(
                    children: [
                      Container(
                        color: MyColors.white,
                        child: TabBar(
                          padding: EdgeInsets.symmetric(vertical: 0),
                          indicatorColor: MyColors.yellow,
                          indicatorWeight: 3,
                          tabs: <Widget>[
                            Tab(
                              child: Text('PENDING', style: TextStyle(
                                  color: MyColors.black,
                                  fontSize: 16,
                                  fontFamily: 'bold'
                              ),),
                            ),
                            Tab(
                              child: Text('HISTORY',style: TextStyle(
                                  color: MyColors.black,
                                  fontSize: 16,
                                  fontFamily: 'bold'
                              ),),
                            ),
                          ],
                        ),
                      ),
                      vSizedBox,
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            SingleChildScrollView(
                              child: Container(
                                color: MyColors.disabledcolor,
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                child: Column(
                                  children: [
                                    for(var i=0; i<2; i++)
                                      GestureDetector(
                                        child: Pay_per_work_list(
                                          text: 'Praveen Kumar',
                                          subtext: '25-07-2022 15:06',
                                          img: MyImages.avtarone,
                                          deletemain: 'Delete This Pay per work Detail',
                                          deletesub: 'Do you wish to delete this pay per work detail ?',
                                        ),
                                        onTap: (){
                                          bottomsheet(
                                              radius: 0,
                                              height: 525,
                                              context: context,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  vSizedBox2,
                                                  MainHeadingText(text: 'View Pay Per Work Approval', fontSize: 20,),
                                                  vSizedBox,
                                                  Pay_per_work_detail_list(
                                                    text: 'Praveen Kumar',
                                                    subtext: '25-07-2022 15:06',
                                                    img: MyImages.avtarone,
                                                    chipcolor: MyColors.pending,
                                                    horizontalpad: 0,
                                                    privilaged_leave: true,
                                                  ),
                                                ],
                                              )
                                          );
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Container(
                                color: MyColors.disabledcolor,
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                child: Column(
                                  children: [
                                    for(var i=0; i<2; i++)
                                      GestureDetector(
                                        child: Pay_per_work_list(
                                          text: 'Praveen Kumar',
                                          subtext: '25-07-2022 15:06',
                                          img: MyImages.avtarone,
                                          deletemain: 'Delete This Pay per work Detail',
                                          deletesub: 'Do you wish to delete this pay per work detail ?',
                                        ),
                                        onTap: (){
                                          bottomsheet(
                                              radius: 0,
                                              height: 660,
                                              context: context,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  vSizedBox2,
                                                  MainHeadingText(text: 'View Pay Per Work Approval', fontSize: 20,),
                                                  vSizedBox,
                                                  Pay_per_work_detail_list(
                                                    text: 'Praveen Kumar',
                                                    subtext: '25-07-2022 15:06',
                                                    img: MyImages.avtarone,
                                                    chipcolor: MyColors.pending,
                                                    horizontalpad: 0,
                                                    privilaged_leave: true,
                                                    btns: false,
                                                      empl_comment: true,
                                                  ),
                                                ],
                                              )
                                          );
                                        },
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
