import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  TextEditingController name = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context: context, title: 'Notification Settings', titlecenter: false, ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainHeadingText(text: 'Notification Settings', fontFamily: 'bold', fontSize: 20,),
            vSizedBox4,
            vSizedBox,
            MainHeadingText(text: 'Restrict Employee Puch Device', fontSize: 16, fontFamily: 'bold',),
            vSizedBox05,
            ParagraphText(text: 'Restrict employee to puch from multiple device.', fontSize: 14, color: MyColors.headingcolor,),
            vSizedBox4,
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 15,
                        child: Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      hSizedBox,
                      ParagraphText(text: 'Push Notification', fontSize: 14, color: MyColors.headingcolor,),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 15,
                        child: Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      hSizedBox,
                      ParagraphText(text: 'SMS', fontSize: 14, color: MyColors.headingcolor,),
                    ],
                  ),
                ),
              ],
            ),
            vSizedBox2,
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 15,
                        child: Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      hSizedBox,
                      ParagraphText(text: 'Whatsapp', fontSize: 14, color: MyColors.headingcolor,),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 15,
                        child: Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      hSizedBox,
                      ParagraphText(text: 'Email', fontSize: 14, color: MyColors.headingcolor,),
                    ],
                  ),
                ),
              ],
            ),
            CustomDivider(),

            MainHeadingText(text: 'Notify Admin On Employee Punch', fontSize: 16, fontFamily: 'bold',),
            vSizedBox05,
            ParagraphText(text: 'It will sendnotification to admin when employee punches.', fontSize: 14, color: MyColors.headingcolor,),
            vSizedBox4,
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 15,
                        child: Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      hSizedBox,
                      ParagraphText(text: 'Push Notification', fontSize: 14, color: MyColors.headingcolor,),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 15,
                        child: Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      hSizedBox,
                      ParagraphText(text: 'SMS', fontSize: 14, color: MyColors.headingcolor,),
                    ],
                  ),
                ),
              ],
            ),
            vSizedBox2,
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 15,
                        child: Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      hSizedBox,
                      ParagraphText(text: 'Whatsapp', fontSize: 14, color: MyColors.headingcolor,),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 15,
                        child: Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      hSizedBox,
                      ParagraphText(text: 'Email', fontSize: 14, color: MyColors.headingcolor,),
                    ],
                  ),
                ),
              ],
            ),
            CustomDivider(),

            MainHeadingText(text: 'Remarks On Punch', fontSize: 16, fontFamily: 'bold',),
            vSizedBox05,
            ParagraphText(text: 'If enabled, System will ask for remarks when the user punches.', fontSize: 14, color: MyColors.headingcolor,),
            vSizedBox4,
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 15,
                        child: Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      hSizedBox,
                      ParagraphText(text: 'Push Notification', fontSize: 14, color: MyColors.headingcolor,),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 15,
                        child: Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      hSizedBox,
                      ParagraphText(text: 'SMS', fontSize: 14, color: MyColors.headingcolor,),
                    ],
                  ),
                ),
              ],
            ),
            vSizedBox2,
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 15,
                        child: Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      hSizedBox,
                      ParagraphText(text: 'Whatsapp', fontSize: 14, color: MyColors.headingcolor,),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 15,
                        child: Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      hSizedBox,
                      ParagraphText(text: 'Email', fontSize: 14, color: MyColors.headingcolor,),
                    ],
                  ),
                ),
              ],
            ),
            CustomDivider(),

            vSizedBox4,
            RoundEdgedButton(text: 'Submit')
          ],
        ),
      ),
    );
  }
}
