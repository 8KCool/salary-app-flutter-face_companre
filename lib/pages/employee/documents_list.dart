import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/employee/add_increament.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';
import 'package:salaryredesign/widgets/dropdown.dart';

import '../../constants/image_urls.dart';
import '../../constants/sized_box.dart';
import '../../widgets/avatar.dart';

class Documents_List_Page extends StatefulWidget {
  const Documents_List_Page({Key? key}) : super(key: key);

  @override
  State<Documents_List_Page> createState() => _Documents_List_PageState();
}


class _Documents_List_PageState extends State<Documents_List_Page> {

  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Document Storage',
      actions: [
        TextButton(onPressed: (){
          // push(context: context, screen: Add_increament_Page());
          bottomsheet(
              height: 200,
              context: context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vSizedBox2,
                  MainHeadingText(text: 'Add File'),
                  vSizedBox2,
                  list_with_icon(text: 'Choose Document', img: MyImages.choose_document,),
                  vSizedBox2,
                  list_with_icon(text: 'Choose Document', img: MyImages.gallary,),
                  vSizedBox2,
                  list_with_icon(text: 'Take a Picture', img: MyImages.camera_white,),


                ],
              )
          );
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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vSizedBox4,
            for(var i=0; i<1; i++)
              GestureDetector(
                onTap: (){
                  // push(context: context, screen: Employee_Profile_Details());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  // margin: EdgeInsets.all(10),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            child: Image.asset(
                              MyImages.pdf,
                              height: 48,
                              width: 48,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          hSizedBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'AadharCard.pdf',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: 'regular'
                                    ),
                                  ),
                                ),
                                // vSizedBox05,
                                // ParagraphText(text: 'Branch Manager',fontSize: 14, color: MyColors.labelcolor,)
                              ],
                            ),
                          ),
                          ParagraphText(text: '1.5Mb',fontSize: 16, color: MyColors.black,),
                          // Image.asset(MyImages.call, height: 36,),
                          // hSizedBox,
                          // Image.asset(MyImages.whatsapp, height: 36,),
                          // TextButton(
                          //     onPressed: () {},
                          //     child: ParagraphText(
                          //       text: 'View',
                          //       fontSize: 14,
                          //       fontFamily: 'bold',
                          //       color: MyColors.primaryColor,
                          //     ))
                        ],
                      ),
                      vSizedBox,
                      Divider()
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
