import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/approvals/leave_request.dart';
import 'package:salaryredesign/pages/approvals/permission_request.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';

import '../constants/sized_box.dart';

class NotificationPage1 extends StatefulWidget {
  const NotificationPage1({Key? key}) : super(key: key);

  @override
  State<NotificationPage1> createState() => _NotificationPage1State();
}

class _NotificationPage1State extends State<NotificationPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: 'Notification', titlecenter: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainHeadingText(text: 'Today', fontSize: 18,),
            vSizedBox,
            GestureDetector(
              onTap: () => push(context: context, screen: Leave_Request_Page()),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('assets/images/01.jpg', width: 60, height: 60)
                  ),
                  hSizedBox,
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'Adrian Watson ',
                        style: TextStyle(fontFamily: 'bold', fontSize: 16, color: MyColors.black),
                        children: const <TextSpan>[
                          TextSpan(text: 'is a requested leave for 2 days.', style: TextStyle(color: MyColors.bordercolor, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  hSizedBox4,
                  ParagraphText(text: '2 mins', fontSize: 16,)
                ],
              ),
            ),
            CustomDivider(),
            GestureDetector(
              onTap: () => Permission_Request_Page(),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset('assets/images/04.jpg', width: 60, height: 60)
                  ),
                  hSizedBox,
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'Adrian Watson ',
                        style: TextStyle(fontFamily: 'bold', fontSize: 16, color: MyColors.black),
                        children: const <TextSpan>[
                          TextSpan(text: 'is a requested leave for 2 days.', style: TextStyle(color: MyColors.bordercolor, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  hSizedBox4,
                  ParagraphText(text: '42 mins', fontSize: 16,)
                ],
              ),
            ),
            CustomDivider(),
            vSizedBox,

            MainHeadingText(text: 'Yesterday', fontSize: 18,),
            vSizedBox,
            GestureDetector(
              onTap: () => push(context: context, screen: Leave_Request_Page()),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset('assets/images/11.jpg', width: 60, height: 60)
                  ),
                  hSizedBox,
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'Adrian Watson ',
                        style: TextStyle(fontFamily: 'bold', fontSize: 16, color: MyColors.black),
                        children: const <TextSpan>[
                          TextSpan(text: 'is a requested leave for 2 days.', style: TextStyle(color: MyColors.bordercolor, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  hSizedBox4,
                  ParagraphText(text: '13:20', fontSize: 16,)
                ],
              ),
            ),
            CustomDivider(),
            vSizedBox,

            MainHeadingText(text: 'Sat 15 Oct 22', fontSize: 18,),
            vSizedBox,
            GestureDetector(
              onTap: () => push(context: context, screen: Leave_Request_Page()),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset('assets/images/06.jpg', width: 60, height: 60)
                  ),
                  hSizedBox,
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'Adrian Watson ',
                        style: TextStyle(fontFamily: 'bold', fontSize: 16, color: MyColors.black),
                        children: const <TextSpan>[
                          TextSpan(text: 'is a requested leave for 2 days.', style: TextStyle(color: MyColors.bordercolor, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  hSizedBox4,
                  ParagraphText(text: '15:26', fontSize: 16,)
                ],
              ),
            ),
            CustomDivider(),
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('assets/images/05.jpg', width: 60, height: 60)
                ),
                hSizedBox,
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'Adrian Watson ',
                      style: TextStyle(fontFamily: 'bold', fontSize: 16, color: MyColors.black),
                      children: const <TextSpan>[
                        TextSpan(text: 'is a requested leave for 2 days.', style: TextStyle(color: MyColors.bordercolor, fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                hSizedBox4,
                ParagraphText(text: '17:06', fontSize: 16,)
              ],
            ),
            CustomDivider(),
            vSizedBox,
          ],
        ),
      ),
    );
  }
}
