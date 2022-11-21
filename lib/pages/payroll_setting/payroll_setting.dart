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
import 'package:salaryredesign/pages/payroll/pay_per_work.dart';
import 'package:salaryredesign/pages/payroll_setting/pay_schedule.dart';
import 'package:salaryredesign/pages/payroll_setting/salary_template.dart';
import 'package:salaryredesign/pages/payroll_setting/weekly_salary_cycle.dart';
import 'package:salaryredesign/pages/payroll_setting/work_rate_template.dart';
import 'package:salaryredesign/pages/settings/branch_settings.dart';
import 'package:salaryredesign/pages/settings/holiday_settings.dart';
import 'package:salaryredesign/pages/settings/other_settings.dart';
import 'package:salaryredesign/pages/settings/shift_settings.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';

import '../../widgets/custom_widgets.dart';

class PayrollSetting extends StatefulWidget {
  const PayrollSetting({Key? key}) : super(key: key);

  @override
  State<PayrollSetting> createState() => _PayrollSettingState();
}

class _PayrollSettingState extends State<PayrollSetting> {
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
                    ParagraphText(text: 'Payroll Settings', color: MyColors.primaryColor,)
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
                    text: 'Pay shedule',
                    colorborderleft: Color(0xFF33CBCB),
                    onTap: (){
                      push(context: context, screen: PaySchedule());
                    },
                  ),
                  clickable_list(
                    image: false,
                    text: 'Salary Template',
                    onTap: (){
                      push(context: context, screen: SalaryTemplate());
                    },
                  ),
                  clickable_list(
                    image: false,
                    text: 'Work Rate Settings',
                    colorborderleft: Color(0xFF33CBCB),
                    onTap: (){
                      push(context: context, screen: WorkRateTemplate());
                    },
                  ),
                  clickable_list(
                    image: false,
                    text: 'Pay Per Work Employer',
                    colorborderleft: Color(0xFF33CBCB),
                    onTap: (){
                      push(context: context, screen: Pay_Per_Work_Page());
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
