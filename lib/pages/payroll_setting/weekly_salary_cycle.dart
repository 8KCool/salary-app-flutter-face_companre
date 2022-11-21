import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/dropdown.dart';

import '../../functions/navigation_functions.dart';
import 'package:responsive_grid/responsive_grid.dart';


class WeeklySalaryCycle extends StatefulWidget {
  const WeeklySalaryCycle({Key? key}) : super(key: key);

  @override
  State<WeeklySalaryCycle> createState() => _WeeklySalaryCycleState();
}
enum SingingCharacter { lafayette, jefferson }
class _WeeklySalaryCycleState extends State<WeeklySalaryCycle> {
  SingingCharacter? _character = SingingCharacter.lafayette;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: 'Weekly Salary Cycle', titlecenter: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Stack(
          children: [
            Container(height: MediaQuery.of(context).size.height - 130,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainHeadingText(text: 'Weekly Salary Cycle', fontSize: 16,),
                DropDwon(label: 'Starting Day of Week', items: [''],),
                DropDwon(label: 'End Day of Week', items: [''],),
                vSizedBox2,
                vSizedBox,
                MainHeadingText(text: 'Daily / Hourly Salary Calculation Settings', color: MyColors.headingcolor, fontSize: 16,),
                vSizedBox2,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Radio<SingingCharacter>(
                      value: SingingCharacter.lafayette,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainHeadingText(text: 'Actual days in a month', color: MyColors.headingcolor, fontSize: 16,),
                          vSizedBox,
                          ParagraphText(text: 'Eg. If Employee A salary is 30,000, then for January the per day salary will be calculated like 30,000/31, then for February the per day salary will be calculated like 30,000/28 , then for April the per day salary will be calculated like 30,000/30')
                        ],
                      ),
                    )
                  ],
                ),
                vSizedBox2,
                vSizedBox,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Radio<SingingCharacter>(
                      value: SingingCharacter.jefferson,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainHeadingText(text: 'Organisation working days per month', color: MyColors.headingcolor, fontSize: 16,),
                          vSizedBox,
                          ParagraphText(text: 'Eg. If Employee A salary is 30,000, then for every month. the per day salary will be calculated based on days fixed')
                        ],
                      ),
                    )
                  ],
                ),
                vSizedBox2,
                Container(
                  width: 190,
                  height: 43,
                  decoration: BoxDecoration(
                    color: Color(0xFEDBEAFE),
                    border: Border.all(color: MyColors.primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        showCustomDialogBox(
                            context: context,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 14),
                                  child: MainHeadingText(text: 'Title'),
                                ),
                                vSizedBox4,
                                ResponsiveGridRow(
                                  children: [
                                    for(var i=0; i<6; i++)
                                    ResponsiveGridCol(
                                      xs: 2,
                                      child: Center(
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 18),
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: Color(0xFEDBEAFE),
                                            border: Border.all(color: MyColors.black, width: 1),
                                            borderRadius: BorderRadius.circular(4)
                                          ),
                                          child: Center(child: Text('${i+1}', style: TextStyle(fontSize: 14,),)),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ],
                            )
                        );
                      },
                      child: ParagraphText(text: 'Choose Days', fontSize: 20, color: MyColors.black,)
                    )
                  )
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: RoundEdgedButton(text: 'Save', height: 45,),
            )
          ],
        ),
      ),
    );
  }
}
