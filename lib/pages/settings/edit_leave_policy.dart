import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';
import 'package:salaryredesign/widgets/dropdown.dart';
import 'package:flutter_switch/flutter_switch.dart';

class EditLeavePolicy extends StatefulWidget {
  const EditLeavePolicy({Key? key}) : super(key: key);

  @override
  State<EditLeavePolicy> createState() => _EditLeavePolicyState();
}

class _EditLeavePolicyState extends State<EditLeavePolicy> {
  bool status = false;
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: 'Edit Leave Policy', titlecenter: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainHeadingText(text: 'Edit Leave Policy', fontFamily: 'bold',),
            vSizedBox4,
            CustomTextField(controller: name, hintText: '', label: 'Leave Type', showlabel: true,),
            vSizedBox,
            CustomTextField(controller: name, hintText: '', label: 'Leave Code', showlabel: true,),
            vSizedBox,
            CustomTextField(controller: name, hintText: '', label: 'Leave Days', showlabel: true,),
            vSizedBox,
            CustomTextField(controller: name, hintText: '', label: 'Total Max Allowed Days', showlabel: true,),
            DropDwon(label: 'Leave Approval Level', items: ['A', 'B', 'V'],),
            vSizedBox4,
            Row(
              children: [
                FlutterSwitch(
                  width: 40.0,
                  height: 18.0,
                  valueFontSize: 25.0,
                  toggleSize: 15.0,
                  value: status,
                  borderRadius: 30.0,
                  padding: 1.0,
                  onToggle: (val) {
                    setState(() {
                      status = val;
                    });
                  },
                ),
                hSizedBox2,
                MainHeadingText(text: 'Apply sandwich rule', fontSize: 14,)
              ],
            ),
            vSizedBox,
            Row(
              children: [
                FlutterSwitch(
                  width: 40.0,
                  height: 18.0,
                  valueFontSize: 25.0,
                  toggleSize: 15.0,
                  value: status,
                  borderRadius: 30.0,
                  padding: 1.0,
                  onToggle: (val) {
                    setState(() {
                      status = val;
                    });
                  },
                ),
                hSizedBox2,
                MainHeadingText(text: 'Apply Leave in Hours', fontSize: 14,)
              ],
            ),
            vSizedBox,
            Row(
              children: [
                FlutterSwitch(
                  width: 40.0,
                  height: 18.0,
                  valueFontSize: 25.0,
                  toggleSize: 15.0,
                  value: status,
                  borderRadius: 30.0,
                  padding: 1.0,
                  onToggle: (val) {
                    setState(() {
                      status = val;
                    });
                  },
                ),
                hSizedBox2,
                Expanded(child: MainHeadingText(text: 'This Leave type can\'t be clubbed with any other leave type.', fontSize: 14,))
              ],
            ),
            vSizedBox,
            Row(
              children: [
                FlutterSwitch(
                  width: 40.0,
                  height: 18.0,
                  valueFontSize: 25.0,
                  toggleSize: 15.0,
                  value: status,
                  borderRadius: 30.0,
                  padding: 1.0,
                  onToggle: (val) {
                    setState(() {
                      status = val;
                    });
                  },
                ),
                hSizedBox2,
                MainHeadingText(text: 'Show leave balance to employees.', fontSize: 14,)
              ],
            ),
            vSizedBox,
            Row(
              children: [
                FlutterSwitch(
                  width: 40.0,
                  height: 18.0,
                  valueFontSize: 25.0,
                  toggleSize: 15.0,
                  value: status,
                  borderRadius: 30.0,
                  padding: 1.0,
                  onToggle: (val) {
                    setState(() {
                      status = val;
                    });
                  },
                ),
                hSizedBox2,
                MainHeadingText(text: 'Encash remaining leaves at end of the month.', fontSize: 14,)
              ],
            ),
            vSizedBox,
            Row(
              children: [
                FlutterSwitch(
                  width: 40.0,
                  height: 18.0,
                  valueFontSize: 25.0,
                  toggleSize: 15.0,
                  value: status,
                  borderRadius: 30.0,
                  padding: 1.0,
                  onToggle: (val) {
                    setState(() {
                      status = val;
                    });
                  },
                ),
                hSizedBox2,
                MainHeadingText(text: 'Allow backdated leaves upto X days.', fontSize: 14,)
              ],
            ),
            vSizedBox,
            Row(
              children: [
                FlutterSwitch(
                  width: 40.0,
                  height: 18.0,
                  valueFontSize: 25.0,
                  toggleSize: 15.0,
                  value: status,
                  borderRadius: 30.0,
                  padding: 1.0,
                  onToggle: (val) {
                    setState(() {
                      status = val;
                    });
                  },
                ),
                hSizedBox2,
                Expanded(child: MainHeadingText(text: 'Allocate advance leaves upto X days', fontSize: 14,))
              ],
            ),
            vSizedBox,
            Row(
              children: [
                FlutterSwitch(
                  width: 40.0,
                  height: 18.0,
                  valueFontSize: 25.0,
                  toggleSize: 15.0,
                  value: status,
                  borderRadius: 30.0,
                  padding: 1.0,
                  onToggle: (val) {
                    setState(() {
                      status = val;
                    });
                  },
                ),
                hSizedBox2,
                Expanded(child: MainHeadingText(text: 'Allocate leaves after X days of joining', fontSize: 14,))
              ],
            ),
            vSizedBox,
            Row(
              children: [
                FlutterSwitch(
                  width: 40.0,
                  height: 18.0,
                  valueFontSize: 25.0,
                  toggleSize: 15.0,
                  value: status,
                  borderRadius: 30.0,
                  padding: 1.0,
                  onToggle: (val) {
                    setState(() {
                      status = val;
                    });
                  },
                ),
                hSizedBox2,
                Expanded(child: MainHeadingText(text: 'Attachment mandatory if leave more than X days', fontSize: 14,))
              ],
            ),
            vSizedBox4,
            RoundEdgedButton(text: 'Save', height: 40,)
          ],
        ),
      ),
    );
  }
}
