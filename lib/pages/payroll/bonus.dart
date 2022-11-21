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
import 'package:salaryredesign/widgets/dropdown.dart';

import '../../widgets/customtextfield.dart';

class Bonus_Page extends StatefulWidget {
  const Bonus_Page({Key? key}) : super(key: key);

  @override
  State<Bonus_Page> createState() => _Bonus_PageState();
}

class _Bonus_PageState extends State<Bonus_Page> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Bonus', titlecenter: false),
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
                    children: [
                      MainHeadingText(text: 'Bonus', fontSize: 20,),
                      hSizedBox,
                      hSizedBox05,
                      RoundEdgedButton(
                        text: 'Add Bonus',
                        verticalPadding: 0,
                        horizontalPadding: 0,
                        width: 100,
                        height: 35,
                        onTap: (){
                          bottomsheet(
                            height: 450,
                              context: context,
                              child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                vSizedBox4,
                                MainHeadingText(text: 'Add Bonus', fontSize: 16, color: MyColors.black,),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '',
                                  label: 'Bonus Month',
                                  showlabel: true,
                                  labelcolor: MyColors.black,
                                ),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '',
                                  label: 'Bonus Description',
                                  showlabel: true,
                                  labelcolor: MyColors.black,
                                ),
                                vSizedBox2,
                                CustomTextField(controller: name, hintText: '',
                                  label: 'Bonus Amount',
                                  showlabel: true,
                                  labelcolor: MyColors.black,
                                ),
                                vSizedBox2,
                                RoundEdgedButton(
                                    text: 'ADD BONUS'
                                ),
                                vSizedBox4,
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: DropDwon(
                          label: 'Bonus Month',
                          items: [
                            '','Jan', 'Fab'
                          ],
                        ),
                      ),
                      hSizedBox05,
                      GestureDetector(
                        onTap: (){

                        },
                        child: Image.asset(MyImages.search_full, height: 52,),
                      )
                    ],
                  ),
                  vSizedBox4,

                ],
              ),
            ),
            vSizedBox,
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainHeadingText(text: 'Summary'),
                  vSizedBox4,
                  List_bonus(
                    text: '14-07-2022',
                    subtext: 'Partially paid',
                    price: '₹ 5,000',
                    img: MyImages.green_up,
                    deletemain: 'Delete This Bonus Detail',
                    deletesub: 'Do you wish to delete this bonus detail ?',
                  ),
                  List_bonus(
                    text: '14-07-2022',
                    subtext: 'Partially paid',
                    price: '₹ 5,000',
                    img: MyImages.red_up,
                    deletemain: 'Delete This Bonus Detail',
                    deletesub: 'Do you wish to delete this bonus detail ?',
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
