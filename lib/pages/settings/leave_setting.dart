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
import 'package:pie_chart/pie_chart.dart';

import 'edit_leave_policy.dart';

class LeaveSetting extends StatefulWidget {
  const LeaveSetting({Key? key}) : super(key: key);

  @override
  State<LeaveSetting> createState() => _LeaveSettingState();
}
final dataMap = <String, double>{
  "leave": 20,
};
final dataMap1 = <String, double>{
  "leave": 20,
};
final dataMap2 = <String, double>{
  "leave": 20,
};

final colorList = <Color>[
  MyColors.primaryColor,
];
final colorList1 = <Color>[
  Color(0XFEFFCC42),
];
final colorList2 = <Color>[
  Color(0xFFDC2626),
];

class _LeaveSettingState extends State<LeaveSetting> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Leave Settings', titlecenter: false),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainHeadingText(text: 'Leave Settings', fontSize: 20,),
                  vSizedBox4,
                  MainHeadingText(text: 'Setup Leave Type', fontSize: 14,fontFamily: 'semibold',),
                  vSizedBox05,
                  MainHeadingText(text: 'Setup organization leave type to monthly or yearly.', fontSize: 14,),
                  vSizedBox,
                  DropDwon(
                    label: 'Leave Type',
                    items: [
                      '','Jan', 'Fab'
                    ],
                  ),
                  vSizedBox,
                  RoundEdgedButton(text: 'Save', height: 38, minWidth: 100),
                  vSizedBox4,

                ],
              ),
            ),
            vSizedBox,
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      MainHeadingText(text: 'Leave Type'),
                      hSizedBox2,
                      RoundEdgedButton(text: 'Add New', minWidth: 70, horizontalPadding: 10, height: 34,)
                    ],
                  ),
                  vSizedBox4,
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainHeadingText(text: 'Previlaged Leave (PL)', color: MyColors.headingcolor, fontSize: 16,),
                                vSizedBox,
                                MainHeadingText(text: 'Max. Allowed Days: 2 Days', color: MyColors.labelcolor, fontSize: 14,),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              PieChart(
                                dataMap: dataMap,
                                chartType: ChartType.ring,
                                // baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                                colorList: colorList,
                                chartRadius: 40,
                                chartValuesOptions: ChartValuesOptions(
                                  showChartValuesInPercentage: true,
                                  showChartValueBackground: false,
                                  showChartValuesOutside: false,
                                  showChartValues: false,

                                ),
                                legendOptions: LegendOptions(
                                  showLegendsInRow: true,
                                  legendPosition: LegendPosition.bottom,
                                  showLegends: false,
                                  // legendShape: _BoxShape.circle,
                                  legendTextStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ringStrokeWidth: 8,
                                initialAngleInDegree: -90,
                                chartLegendSpacing: 5,
                                totalValue: 30,
                                centerText: '5',
                                baseChartColor: Color(0xFFDFDFDF),
                                centerTextStyle: TextStyle(
                                    color: MyColors.primaryColor,
                                    fontSize: 24,
                                    fontFamily: 'bold'
                                ),
                              ),
                              ParagraphText(
                                text: 'Allot Days',
                                fontSize: 14,
                                color: MyColors.black,
                              )
                            ],
                          ),
                          hSizedBox05,
                          PopupmenuButtonCustom(
                            onTapedit: (){
                              push(context: context, screen: EditLeavePolicy());
                            },
                            deletemain: 'Are you sure you want to delete this holiday.',
                            issubheading: false,
                          )

                        ],
                      ),
                      Divider(height: 40, color: Color(0xFFCAD8D8),)
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainHeadingText(text: 'Casual Leave   (CL)', color: MyColors.headingcolor, fontSize: 16,),
                                vSizedBox,
                                MainHeadingText(text: 'Max. Allowed Days: 2 Days', color: MyColors.labelcolor, fontSize: 14,),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              PieChart(
                                dataMap: dataMap2,
                                chartType: ChartType.ring,
                                // baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                                colorList: colorList1,
                                chartRadius: 40,
                                chartValuesOptions: ChartValuesOptions(
                                  showChartValuesInPercentage: true,
                                  showChartValueBackground: false,
                                  showChartValuesOutside: false,
                                  showChartValues: false,

                                ),
                                legendOptions: LegendOptions(
                                  showLegendsInRow: true,
                                  legendPosition: LegendPosition.bottom,
                                  showLegends: false,
                                  // legendShape: _BoxShape.circle,
                                  legendTextStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ringStrokeWidth: 8,
                                initialAngleInDegree: -90,
                                chartLegendSpacing: 5,
                                totalValue: 30,
                                centerText: '5',
                                baseChartColor: Color(0xFFDFDFDF),
                                centerTextStyle: TextStyle(
                                    color: MyColors.primaryColor,
                                    fontSize: 24,
                                    fontFamily: 'bold'
                                ),
                              ),
                              ParagraphText(
                                text: 'Allot Days',
                                fontSize: 14,
                                color: MyColors.black,
                              )
                            ],
                          ),
                          hSizedBox05,
                          PopupmenuButtonCustom(
                            onTapedit: (){
                              push(context: context, screen: EditLeavePolicy());
                            },
                            deletemain: 'Are you sure you want to delete this holiday.',
                            issubheading: false,
                            editbtn: false,
                          )

                        ],
                      ),
                      Divider(height: 40, color: Color(0xFFCAD8D8),)
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
