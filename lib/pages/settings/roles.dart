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

import '../../widgets/customtextfield.dart';

class RolesPage extends StatefulWidget {
  const RolesPage({Key? key}) : super(key: key);

  @override
  State<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  TextEditingController name = TextEditingController();
  List image=[
    MyImages.avtarone,
    MyImages.avatr8,
    MyImages.avatr3,
    MyImages.avatr4,
    MyImages.avatr5,
    MyImages.avatr6,
  ];
  List role = ['Admin', 'Branch Manager', 'Employee'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Roles and Permision', titlecenter: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                )
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainHeadingText(text: 'Roles and Permision', fontSize: 20,),
                  vSizedBox
                ],
              ),
            ),
            vSizedBox,
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              // padding: EdgeInsets.all(16),
              // color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vSizedBox,
                  // for(var i=0; i<2; i++)
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height - 20,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: MyColors.white
                        ),
                        child: Column(
                          children: [
                            for(var i=0; i < 3; i++)
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          MainHeadingText(text: role[i], color: MyColors.black, fontSize: 16,),
                                        ],
                                      ),
                                    ),
                                    RoundEdgedButton(text: 'View', horizontalPadding: 0, minWidth: 90, height: 33,)
                                  ],
                                ),
                                CustomDivider(),
                              ],
                            )
                          ],
                        ),
                      ),
                      vSizedBox,
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
