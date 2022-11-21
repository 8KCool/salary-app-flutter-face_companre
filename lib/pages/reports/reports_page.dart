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

class Reports_Page extends StatefulWidget {
  const Reports_Page({Key? key}) : super(key: key);

  @override
  State<Reports_Page> createState() => _Reports_PageState();
}

class _Reports_PageState extends State<Reports_Page> {
  TextEditingController search = TextEditingController();
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Reports', titlecenter: false),
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
                        color: MyColors.white,
                        child: TabBar(
                          padding: EdgeInsets.symmetric(vertical: 0),
                          indicatorColor: MyColors.yellow,
                          indicatorWeight: 3,
                          tabs: <Widget>[
                            Tab(
                              child: Text('NEW REQUEST', style: TextStyle(
                                  color: MyColors.black,
                                  fontSize: 16,
                                  fontFamily: 'bold'
                              ),),
                            ),
                            Tab(
                              child: Text('DOWNLOAD',style: TextStyle(
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
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  children: [
                                    vSizedBox2,
                                    CustomTextField(controller: name, hintText: '',
                                      label: 'Report Type',
                                      showlabel: true,
                                      labelcolor: MyColors.black,
                                    ),
                                    vSizedBox,
                                    CustomTextField(controller: name, hintText: '',
                                      label: 'Select Branch',
                                      showlabel: true,
                                      labelcolor: MyColors.black,
                                    ),
                                    vSizedBox,
                                    CustomTextField(controller: name, hintText: '',
                                      label: 'Select Period',
                                      showlabel: true,
                                      labelcolor: MyColors.black,
                                    ),
                                    vSizedBox,
                                    CustomTextField(controller: name, hintText: '',
                                      label: 'Select Format',
                                      showlabel: true,
                                      labelcolor: MyColors.black,
                                    ),
                                    vSizedBox,
                                    CustomTextField(controller: name, hintText: '',
                                      label: 'Search User',
                                      showlabel: true,
                                      labelcolor: MyColors.black,
                                    ),
                                    vSizedBox2,
                                    RoundEdgedButton(
                                        text: 'Generate Report'
                                    ),
                                    vSizedBox4,
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
                                        child: Reports_list(
                                          datetext: '01 Jan 2022 - 31 Jan 2022',
                                          chiptext: 'hello',
                                          text: 'Payments',
                                          subtext: '04-08-2022',
                                          img: MyImages.pdf,
                                          popupmenu: true,
                                          deletemain: 'Delete This Report',
                                          deletesub: 'Do you wish to delete this Report ?',
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
