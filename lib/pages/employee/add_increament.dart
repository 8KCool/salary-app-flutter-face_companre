import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';
import 'package:salaryredesign/widgets/dropdown.dart';

import '../../constants/image_urls.dart';
import '../../constants/sized_box.dart';
import '../../widgets/avatar.dart';

class Add_increament_Page extends StatefulWidget {
  const Add_increament_Page({Key? key}) : super(key: key);

  @override
  State<Add_increament_Page> createState() => _Add_increament_PageState();
}


class _Add_increament_PageState extends State<Add_increament_Page> {

  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Increment Detail',
          actions: [
            TextButton(onPressed: (){

            },
              child: Row(
                children: [
                  ParagraphText(text: '+', fontSize: 25, color: MyColors.white,),
                  hSizedBox05,
                  ParagraphText(text: 'Add', color: MyColors.white,),

                ],
              ),
            )
          ]
      ) ,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            vSizedBox,
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 11),
              height: MediaQuery.of(context).size.height - 120,
              decoration: BoxDecoration(
                color: MyColors.white,
                borderRadius: BorderRadius.circular(4)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vSizedBox4,
                  MainHeadingText(text: 'Add Increment' , color: MyColors.black,),
                  Column(
                    children: [
                      vSizedBox2,
                      CustomTextField(controller: name, hintText: '',
                        label: 'Date',
                        showlabel: true,
                        labelcolor: MyColors.black,
                      ),
                      vSizedBox2,
                      CustomTextField(controller: name, hintText: '',
                        label: 'Current Salary',
                        showlabel: true,
                        labelcolor: MyColors.black,
                      ),
                      vSizedBox2,
                      CustomTextField(controller: name, hintText: '',
                        label: 'Increment Amount',
                        showlabel: true,
                        labelcolor: MyColors.black,
                      ),
                      vSizedBox2,
                      CustomTextField(controller: name, hintText: '',
                        label: 'New Salary',
                        showlabel: true,
                        labelcolor: MyColors.black,
                      ),
                      vSizedBox2,
                      RoundEdgedButton(
                          text: 'Save'
                      ),
                      vSizedBox4,
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
