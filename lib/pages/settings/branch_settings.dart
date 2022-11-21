import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/settings/add_branch.dart';
import 'package:salaryredesign/pages/settings/edit_branch.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';
import 'package:salaryredesign/widgets/dropdown.dart';

import '../../widgets/customtextfield.dart';

class Branch_Settings_Page extends StatefulWidget {
  const Branch_Settings_Page({Key? key}) : super(key: key);

  @override
  State<Branch_Settings_Page> createState() => _Branch_Settings_PageState();
}

class _Branch_Settings_PageState extends State<Branch_Settings_Page> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Branches', titlecenter: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainHeadingText(text: 'Branches', fontSize: 20,),
                      hSizedBox,
                      hSizedBox05,
                      RoundEdgedButton(
                        text: 'Add New',
                        verticalPadding: 0,
                        horizontalPadding: 0,
                        width: 100,
                        height: 35,
                        onTap: (){
                          push(context: context, screen: Add_Branch_Page());
                        },
                      )
                    ],
                  ),
                  vSizedBox,
                ],
              ),
            ),
            vSizedBox,
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 200,
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeadingText(text: 'Summary'),
                    vSizedBox4,
                    for(var i=0; i<10; i++)
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Image.asset(MyImages.map_green, height: 36, width: 36,),
                                vSizedBox,
                                MainHeadingText(text: '200 M', fontSize: 14,),
                                vSizedBox05,
                                ParagraphText(text: 'Radius', fontSize: 14, color: MyColors.labelcolor,),
                              ],
                            ),
                            hSizedBox,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MainHeadingText(text: 'Ecom Ads PVT Ltd, Tiruchengode', fontSize: 16,),
                                  vSizedBox05,
                                  ParagraphText(
                                    text: '20/5, Molasiyar maaligai, Old bustand, Tiruchengode',
                                    fontSize: 14,
                                    color: MyColors.labelcolor,
                                  ),
                                 vSizedBox,
                                  Row(
                                    children: [
                                      ParagraphText(text: 'Branch Manager', fontSize: 14, color: MyColors.black,),
                                      hSizedBox,
                                      ParagraphText(text: ': Karthika', fontSize: 14, color: MyColors.primaryColor,),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                            PopupmenuButtonCustom(
                              onTapedit: (){
                                push(context: context, screen: Edit_Branch_Page());
                              },
                              deletemain: 'Delete This Branch',
                              deletesub: 'Do you wish to delete this Branch?',
                            )

                          ],
                        ),
                        Divider(height: 40, color: Color(0xFFCAD8D8),)

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
