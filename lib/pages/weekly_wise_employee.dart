import 'package:flutter/material.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';

import '../constants/colors.dart';
import '../constants/image_urls.dart';
import '../constants/sized_box.dart';
import '../functions/navigation_functions.dart';
import '../widgets/appbar.dart';
import '../widgets/buttons.dart';
import '../widgets/customtextfield.dart';
import '../widgets/dropdown.dart';

class WeeklyWiseEmployee extends StatefulWidget {
  const WeeklyWiseEmployee({Key? key}) : super(key: key);

  @override
  State<WeeklyWiseEmployee> createState() => _WeeklyWiseEmployeeState();
}

List bgColor = [Color(0xFEFEF9C3), Color(0xFE2563EB), Color(0xFE16A34A)];
List tag = ['Pending', 'Finalized', 'Processed'];

class _WeeklyWiseEmployeeState extends State<WeeklyWiseEmployee> {

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
                  height: 170,
                  decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainHeadingText(text: 'Elavarasan Rajan', fontSize: 20, color: MyColors.white,),
                      vSizedBox05,
                      ParagraphText(text: 'Welcome to pay summary details', fontSize: 16, color: MyColors.white,),
                      vSizedBox2,
                      MainHeadingText(text: '₹ 90,000', fontSize: 28, color: MyColors.white,),
                      vSizedBox05,
                      ParagraphText(text: 'Total Outstanding', fontSize: 16, color: MyColors.white,)
                    ],
                  )
                ),
                vSizedBox,
                for(var i=0; i<3; i++)
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: MyColors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                MainHeadingText(text: 'July Week ${i+1}', fontSize: 16,),
                                hSizedBox2,
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: bgColor[i],
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: ParagraphText(text: tag[i], color: i==0 ? Color(0xFECA8A04) : Colors.white, fontSize: 14,),
                                )
                              ],
                            ),
                          ),
                          MainHeadingText(text: '₹ 30,000', color: MyColors.green, fontSize: 16,),
                        ],
                      ),
                      vSizedBox,
                      MainHeadingText(text: '01-07-2022 to  Till Now', fontSize: 14, color: MyColors.bordercolor,),
                      vSizedBox,
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: i == 0 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
                              children: [
                                MainHeadingText(text: 'View', color: MyColors.primaryColor, fontSize: 14,),
                                hSizedBox,
                                hSizedBox05,
                                if(i==0)
                                MainHeadingText(text: 'Calculate', color: MyColors.primaryColor, fontSize: 14,),
                                if(i==0)
                                hSizedBox,
                                hSizedBox05,
                                if(i==0 || i==1)
                                MainHeadingText(text: 'Process', color: MyColors.primaryColor, fontSize: 14,),
                              ],
                            ),
                          ),
                          Expanded(child: Column())
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
