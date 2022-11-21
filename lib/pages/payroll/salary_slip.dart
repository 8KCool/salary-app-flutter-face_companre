import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/constans.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:salaryredesign/widgets/buttons.dart';

class Salary_Slip_Page extends StatefulWidget {

  const Salary_Slip_Page({Key? key}) : super(key: key);

  @override
  State<Salary_Slip_Page> createState() => _Salary_Slip_PageState();
}

final dataMap = <String, double>{
  "white":0.5,
  "Deductions": 9,
  "black":0.5,
  "Earnings": 20,
};

final colorList = <Color>[
  MyColors.white,
  Colors.red,
  Colors.white30,
  MyColors.primaryColor,
];

class _Salary_Slip_PageState extends State<Salary_Slip_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: appBar(context: context, titlecenter: false, title: 'Payslip Summary'),
      body: SingleChildScrollView(
        child: Container(
          width: width(context),
          padding: horizontal_pad,
          child: Column(
            children: [
              vSizedBox4,
              ParagraphText(text: 'You have earned gross pay of Febrary month',color: MyColors.black,),
              vSizedBox16,
              MainHeadingText(text: '01-02-2022 to 28-02-2022',fontSize: 16,),
              vSizedBox4,
              Stack(
                alignment: Alignment.center,
                children: [
                  Container( 
                    padding: EdgeInsets.symmetric(horizontal: 80),
                    child: PieChart(
                      dataMap: dataMap,
                      chartType: ChartType.ring,
                      // baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                      colorList: colorList,
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
                      ringStrokeWidth: 10,
                      initialAngleInDegree: -90,
                      chartLegendSpacing: 30,
                      totalValue: 30,
                      centerText: '₹ 82,500',
                      baseChartColor: MyColors.white,
                      centerTextStyle: TextStyle(
                        color: MyColors.primaryColor,
                        fontSize: 24,
                        fontFamily: 'bold'
                      ),
                    ),
                  ),
                  Positioned(
                    top: 115,
                      child: ParagraphText(text: 'Gross pay', color: Color(0xFF4B5563), fontSize: 16,)
                  )
                ],
              ),
              vSizedBox4,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: MyColors.primaryColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      hSizedBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainHeadingText(text: '70,000', fontSize: 16, fontFamily: 'bold',),
                          vSizedBox05,
                          ParagraphText(text: 'Earnings', color: Color(0xFF4B5563), fontSize: 16,)

                        ],
                      ),
                    ],
                  ),
                  hSizedBox8,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: MyColors.red,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      hSizedBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainHeadingText(text: '12,500', fontSize: 16, fontFamily: 'bold',),
                          vSizedBox05,
                          ParagraphText(text: 'Deductions', color: Color(0xFF4B5563), fontSize: 16,)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              vSizedBox4,
              RoundEdgedButton(text: 'DOWNLOAD SALARYSLIP'),
              vSizedBox2,
              Container(
                width: width(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeadingText(text: 'Earning Details', fontSize: 16, fontFamily: 'bold',),
                    vSizedBox2,
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xffEFEFEF),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ParagraphText(text: 'Basic Pay'),
                              MainHeadingText(text: '₹ 30,000',color: MyColors.primaryColor, fontSize: 16, fontFamily: 'bold',),
                            ],
                          ),
                          vSizedBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ParagraphText(text: 'HRA'),
                              MainHeadingText(text: '₹ 10,000',color: MyColors.primaryColor, fontSize: 16, fontFamily: 'bold',),
                            ],
                          ),
                          vSizedBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ParagraphText(text: 'Other Allowance'),
                              MainHeadingText(text: '₹ 15,000',color: MyColors.primaryColor, fontSize: 16, fontFamily: 'bold',),
                            ],
                          ),
                          vSizedBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ParagraphText(text: 'SPL Allowance'),
                              MainHeadingText(text: '₹ 10,000',color: MyColors.primaryColor, fontSize: 16, fontFamily: 'bold',),
                            ],
                          ),
                          vSizedBox4,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ParagraphText(text: 'Total Earnings', fontFamily: 'bold',color: Color(0xFF533C91),),
                              MainHeadingText(text: '₹ 70,000',color: MyColors.primaryColor, fontSize: 16, fontFamily: 'bold',),
                            ],
                          ),
                        ],
                      ),
                    ),
                    vSizedBox,
                    vSizedBox2,
                    MainHeadingText(text: 'Deductions', fontSize: 16, fontFamily: 'bold',),
                    vSizedBox2,
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xffEFEFEF),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ParagraphText(text: 'Basic Pay'),
                              MainHeadingText(text: '₹ 30,000',
                                color: MyColors.red, fontSize: 16, fontFamily: 'bold',),
                            ],
                          ),
                          vSizedBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ParagraphText(text: 'HRA'),
                              MainHeadingText(text: '₹ 10,000',color: MyColors.red, fontSize: 16, fontFamily: 'bold',),
                            ],
                          ),
                          vSizedBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ParagraphText(text: 'Other Allowance'),
                              MainHeadingText(text: '₹ 15,000',color: MyColors.red, fontSize: 16, fontFamily: 'bold',),
                            ],
                          ),
                          vSizedBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ParagraphText(text: 'SPL Allowance'),
                              MainHeadingText(text: '₹ 10,000',color: MyColors.red, fontSize: 16, fontFamily: 'bold',),
                            ],
                          ),
                          vSizedBox4,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ParagraphText(text: 'Total Earnings', fontFamily: 'bold',color: Color(0xFF533C91),),
                              MainHeadingText(text: '₹ 70,000',color: MyColors.red, fontSize: 16, fontFamily: 'bold',),
                            ],
                          ),
                        ],
                      ),
                    ),
                    vSizedBox,
                    vSizedBox2,
                    MainHeadingText(text: 'Employer Contribution', fontSize: 16, fontFamily: 'bold',),
                    vSizedBox2,
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xffEFEFEF),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ParagraphText(text: 'Basic Pay'),
                              MainHeadingText(text: '₹ 30,000',color: MyColors.secondarycolor, fontSize: 16, fontFamily: 'bold',),
                            ],
                          ),
                          vSizedBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ParagraphText(text: 'HRA'),
                              MainHeadingText(text: '₹ 10,000',color: MyColors.secondarycolor, fontSize: 16, fontFamily: 'bold',),
                            ],
                          ),
                          vSizedBox4,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ParagraphText(text: 'Total Earnings', fontFamily: 'bold',color: Color(0xFF533C91),),
                              MainHeadingText(text: '₹ 70,000',color: MyColors.secondarycolor, fontSize: 16, fontFamily: 'bold',),
                            ],
                          ),
                        ],
                      ),
                    ),
                    vSizedBox6,
                  ],
                ),
              )


            ],
          ),
        ),
      ),

    );
  }
}
