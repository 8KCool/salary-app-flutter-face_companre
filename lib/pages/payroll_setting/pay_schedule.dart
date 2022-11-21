import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/constans.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/all_employee.dart';
import 'package:salaryredesign/pages/approvals/attendance_approval.dart';
import 'package:salaryredesign/pages/attandance_page.dart';
import 'package:salaryredesign/pages/payroll_setting/monthly_salary_cycle.dart';
import 'package:salaryredesign/pages/payroll_setting/weekly_salary_cycle.dart';
import 'package:salaryredesign/pages/settings/branch_settings.dart';
import 'package:salaryredesign/pages/settings/holiday_settings.dart';
import 'package:salaryredesign/pages/settings/other_settings.dart';
import 'package:salaryredesign/pages/settings/shift_settings.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';

import '../../widgets/custom_widgets.dart';

class PaySchedule extends StatefulWidget {
  const PaySchedule({Key? key}) : super(key: key);

  @override
  State<PaySchedule> createState() => _PayScheduleState();
}

class _PayScheduleState extends State<PaySchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.disabledcolor,
      appBar: appBar(
          context: context,
          title: 'Ecomads Private Limited',
          implyLeading: false,
          titlecenter: false,
          leading: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          appBarColor: MyColors.primaryColor,
          titleColor: Colors.white,
          actions: [
            Icon(Icons.notifications_outlined),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.help_outline_outlined,
              ),
            ),
          ]
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_outlined, size: 20, color: MyColors.primaryColor,),
                    hSizedBox,
                    ParagraphText(text: 'Pay Schedule', color: MyColors.primaryColor,)
                  ],
                ),
              ),
            ),
            vSizedBox2,
            Padding(
              padding: horizontal_pad + EdgeInsets.symmetric(horizontal: 36),
              child: Column(
                children: [
                  clickable_list(
                    image: false,
                    text: 'Monthly Pay Shedule',
                    colorborderleft: Color(0xFFB98548),
                    onTap: (){
                      push(context: context, screen: MonthlySalaryCycle());
                    },
                  ),
                  clickable_list(
                    image: false,
                    text: 'Weekly Pay Shedule',
                    colorborderleft: Color(0XFE4875B9),
                    onTap: (){
                      push(context: context, screen: WeeklySalaryCycle());
                    },
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
