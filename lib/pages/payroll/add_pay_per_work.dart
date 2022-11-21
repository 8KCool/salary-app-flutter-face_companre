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
import '../../widgets/custom_widgets.dart';

class Add_Pay_Per_Work_Page extends StatefulWidget {
  const Add_Pay_Per_Work_Page({Key? key}) : super(key: key);

  @override
  State<Add_Pay_Per_Work_Page> createState() => _Add_Pay_Per_Work_PageState();
}


class _Add_Pay_Per_Work_PageState extends State<Add_Pay_Per_Work_Page> {

  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Add Pay Per Work', titlecenter: false,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              // margin: EdgeInsets.symmetric(horizontal: 11),
              // height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: MyColors.white,
                borderRadius: BorderRadius.circular(4)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      vSizedBox2,
                      CustomTextField(controller: name, hintText: '',
                        label: 'Date',
                        showlabel: true,
                        labelcolor: MyColors.black,
                      ),
                      vSizedBox2,
                      CustomTextField(controller: name, hintText: '',
                        label: 'Item Name',
                        prefixIcon: MyImages.search,
                        suffixheight: 20,
                        showlabel: true,
                        labelcolor: MyColors.black,
                      ),
                      vSizedBox2,
                      CustomTextField(controller: name, hintText: '',
                        label: 'Work Rate',
                        showlabel: true,
                        labelcolor: MyColors.black,
                      ),
                      vSizedBox2,
                      CustomTextField(controller: name, hintText: '',
                        label: 'No of Units',
                        showlabel: true,
                        labelcolor: MyColors.black,
                      ),
                      vSizedBox2,
                      CustomTextField(controller: name, hintText: '',
                        label: 'Description',
                        showlabel: true,
                        labelcolor: MyColors.black,
                      ),
                      vSizedBox2,
                      ParagraphText(text: 'Attachments', fontSize: 14, color: MyColors.black,),
                      vSizedBox,
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: MyColors.bordercolor.withOpacity(0.5)
                          )
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(MyImages.attachments, height: 24,),
                              hSizedBox,
                              ParagraphText(text: 'ATTACH FILE', fontSize: 14, fontFamily: 'bold', color: Color(0xFF4B5563),)
                            ],
                          ),
                        ),
                      ),
                      vSizedBox4,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          list_with_icon(text: 'Cv.pdf', img: MyImages.filter, icon: true,),
                          Icon(Icons.close, size: 16,)
                        ],
                      ) ,
                      vSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Opacity(opacity: 0.3,child: list_with_icon(text: 'Cv.pdf', img: MyImages.filter, icon: true,)),
                          Stack(
                            children: [
                              Container(
                                width: 40,
                                height: 5,
                                decoration: BoxDecoration(
                                    color: MyColors.primaryColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                              Container(
                                width: 28,
                                height: 5,
                                decoration: BoxDecoration(
                                    color: MyColors.primaryColor,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              )
                            ],
                          )
                        ],
                      ) ,
                      vSizedBox2,
                      RoundEdgedButton(
                          text: 'ADD PAY PER WORK'
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
