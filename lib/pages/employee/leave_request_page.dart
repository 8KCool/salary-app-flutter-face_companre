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
import 'package:pie_chart/pie_chart.dart';

import '../../constants/constans.dart';
import '../../widgets/customtextfield.dart';

class My_Leave_Request_Page extends StatefulWidget {
  const My_Leave_Request_Page({Key? key}) : super(key: key);

  @override
  State<My_Leave_Request_Page> createState() => _My_Leave_Request_PageState();
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
  MyColors.secondarycolor,
];
final colorList2 = <Color>[
  Color(0xFFDC2626),
];

class _My_Leave_Request_PageState extends State<My_Leave_Request_Page> {
  TextEditingController search = TextEditingController();
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'My Leave History', titlecenter: false),
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
                      vSizedBox05,
                      Container(
                        padding: EdgeInsets.all(16),
                        width: MediaQuery.of(context).size.width,
                        color: MyColors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainHeadingText(text: 'Available Leaves'),
                            vSizedBox,
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      PieChart(
                                        dataMap: dataMap,
                                        chartType: ChartType.ring,
                                        // baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                                        colorList: colorList,
                                        chartRadius: 60,
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
                                        text: 'Casual Leave',
                                        fontSize: 14,
                                        color: MyColors.black,
                                      )
                                    ],
                                  ),
                                ),
                                hSizedBox,
                                Expanded(
                                  child: Column(
                                    children: [
                                      PieChart(
                                        dataMap: dataMap1,
                                        chartType: ChartType.ring,
                                        // baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                                        colorList: colorList1,
                                        chartRadius: 60,
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
                                        centerText: '2',
                                        baseChartColor: Color(0xFFDFDFDF),
                                        centerTextStyle: TextStyle(
                                            color: MyColors.secondarycolor,
                                            fontSize: 24,
                                            fontFamily: 'bold'
                                        ),
                                      ),
                                      ParagraphText(
                                        text: 'Sick Leave',
                                        fontSize: 14,
                                        color: MyColors.black,
                                      )
                                    ],
                                  ),
                                ),
                                hSizedBox,
                                Expanded(
                                  child: Column(
                                    children: [
                                      PieChart(
                                        dataMap: dataMap2,
                                        chartType: ChartType.ring,
                                        // baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                                        colorList: colorList2,
                                        chartRadius: 60,
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
                                        centerText: '3',
                                        baseChartColor: Color(0xFFDFDFDF),
                                        centerTextStyle: TextStyle(
                                            color: Color(0xFFDC2626),
                                            fontSize: 24,
                                            fontFamily: 'bold'
                                        ),
                                      ),
                                      ParagraphText(
                                        text: 'Previleged Leave',
                                        fontSize: 14,
                                        color: MyColors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      vSizedBox,
                      Container(
                        color: MyColors.white,
                        child: TabBar(
                          padding: EdgeInsets.symmetric(vertical: 0),
                          indicatorColor: MyColors.yellow,
                          indicatorWeight: 3,
                          tabs: <Widget>[
                            Tab(
                              child: Text(
                                'NEW REQUEST',
                                style: TextStyle(
                                  color: MyColors.black,
                                  fontSize: 16,
                                  fontFamily: 'bold'
                              ),
                              ),

                            ),
                            Tab(
                              child: Text(
                                'HISTORY',
                                style: TextStyle(
                                  color: MyColors.black,
                                  fontSize: 16,
                                  fontFamily: 'bold'
                              ),
                              ),
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
                                height: MediaQuery.of(context).size.height - 125,
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DropDwon(
                                      label: 'Leave Type',
                                      items: [''],
                                      labelcolor: MyColors.black,
                                      fontsize: 14,
                                    ),
                                    vSizedBox2,
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomTextField(controller: name, hintText: '',
                                            label: 'From Date',
                                            showlabel: true,
                                            labelcolor: MyColors.black,
                                            suffixIcon: MyImages.date,
                                            suffixheight: 24,
                                          ),
                                        ),
                                        hSizedBox,
                                        Expanded(
                                          child: CustomTextField(controller: name, hintText: '',
                                            label: 'To Date',
                                            showlabel: true,
                                            labelcolor: MyColors.black,
                                            suffixIcon: MyImages.date,
                                            suffixheight: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                    DropDwon(
                                      label: 'Select Day',
                                      items: [''],
                                      labelcolor: MyColors.black,
                                      fontsize: 14,
                                    ),
                                    vSizedBox,
                                    CustomTextField(controller: name, hintText: '',
                                      label: 'Reason',
                                      showlabel: true,
                                      labelcolor: MyColors.black,
                                      maxLines: 4,
                                    ),
                                    vSizedBox2,
                                    ParagraphText(text: 'Attachments', fontSize: 14, color: MyColors.black,),
                                    vSizedBox,
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          border: Border.all(
                                              color: MyColors.bordercolor.withOpacity(0.5)
                                          )
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset(MyImages.attachments, height: 24,),
                                            hSizedBox,
                                            ParagraphText(text: 'ATTACH FILE', fontSize: 14, fontFamily: 'bold', color: Color(0xFF4B5563),)
                                          ],
                                        ),
                                      ),
                                    ),
                                    vSizedBox4,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        list_with_icon(text: 'Cv.pdf', img: MyImages.filter, icon: true,),
                                        Icon(Icons.close, size: 16,)
                                      ],
                                    ) ,
                                    vSizedBox,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Opacity(opacity: 0.3,child: list_with_icon(text: 'Cv.pdf', img: MyImages.filter, icon: true,)),
                                        Stack(
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 5,
                                              decoration: BoxDecoration(
                                                  color: MyColors.primaryColor.withOpacity(0.2),
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                            ),
                                            Container(
                                              width: 28,
                                              height: 5,
                                              decoration: BoxDecoration(
                                                  color: MyColors.primaryColor,
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ) ,
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
                                        child: Leave_Request_list(
                                          text: 'Praveen Kumar',
                                          subtext: '25-07-2022 15:06',
                                          img: MyImages.avtarone,
                                          chipcolor: MyColors.pending,
                                          btns: false,
                                        ),
                                        onTap: (){
                                          bottomsheet(
                                              radius: 0,
                                              height: 480,
                                              context: context,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  vSizedBox2,
                                                  MainHeadingText(text: 'View Leave Request', fontSize: 20,),
                                                  vSizedBox,
                                                  Leave_Request_list(
                                                    text: 'Praveen Kumar',
                                                    subtext: '25-07-2022 15:06',
                                                    img: MyImages.avtarone,
                                                    chipcolor: MyColors.pending,
                                                    horizontalpad: 0,
                                                    privilaged_leave: true,
                                                    btns: false,
                                                  ),
                                                  Container(
                                                    width: width(context),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        ParagraphText(
                                                          text: 'Premkumar',
                                                          fontSize: 16,
                                                          color: MyColors.black,
                                                          fontFamily: 'semibold',
                                                        ),
                                                        vSizedBox05,
                                                        ParagraphText(
                                                          // color: MyColors.black,
                                                          text: 'Approved By',
                                                          fontSize: 14,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  vSizedBox2,
                                                  Container(
                                                    width: width(context),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        ParagraphText(
                                                          text: 'Reject Reason',
                                                          fontSize: 16,
                                                          color: MyColors.black,
                                                          fontFamily: 'semibold',
                                                        ),
                                                        vSizedBox05,
                                                        ParagraphText(
                                                          // color: MyColors.black,
                                                          text: 'You have work so I rejected',
                                                          fontSize: 14,
                                                        ),
                                                      ],
                                                    ),
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
