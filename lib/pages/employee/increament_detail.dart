import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/employee/add_increament.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';
import 'package:salaryredesign/widgets/dropdown.dart';

import '../../constants/image_urls.dart';
import '../../constants/sized_box.dart';
import '../../widgets/avatar.dart';

class Increament_Detail_Page extends StatefulWidget {
  const Increament_Detail_Page({Key? key}) : super(key: key);

  @override
  State<Increament_Detail_Page> createState() => _Increament_Detail_PageState();
}


class _Increament_Detail_PageState extends State<Increament_Detail_Page> {

  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Increment Detail',
      actions: [
        TextButton(onPressed: (){
          push(context: context, screen: Add_increament_Page());
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
            vSizedBox4,
            for(var i=0; i<2; i++)
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ParagraphText(text: 'Date', fontSize: 14,),
                                        vSizedBox05,
                                        MainHeadingText(text: '22-07-2022', fontSize: 16,),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ParagraphText(text: 'Previous Salary', fontSize: 14,),
                                        vSizedBox05,
                                        MainHeadingText(text: '₹ 15,000', fontSize: 16,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              vSizedBox2,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ParagraphText(text: 'Increment Amount', fontSize: 14,),
                                        vSizedBox05,
                                        MainHeadingText(text: '₹ 5,000', fontSize: 16,),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ParagraphText(text: 'New Salary', fontSize: 14,),
                                        vSizedBox05,
                                        MainHeadingText(text: '₹ 20,000', fontSize: 16,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      PopupMenuButton(
                        // icon: Icon(Icons.more_vert, color: Colors.black,),
                        child: Icon(Icons.more_vert, color: MyColors.labelcolor,),
                        elevation: 1,
                        offset: Offset(-30, 0),
                        padding: EdgeInsets.all(0),
                        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                          const PopupMenuItem(

                            child: ListTile(
                              minLeadingWidth: 25,
                              contentPadding: EdgeInsets.all(0),
                              visualDensity:
                              VisualDensity(horizontal: -4, vertical: -4),
                              title: Text('Edit'),
                              leading: ImageIcon(
                                AssetImage(
                                  MyImages.change,
                                ),
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            child: ListTile(

                              contentPadding: EdgeInsets.all(0),
                              minLeadingWidth: 25,
                              visualDensity:
                              VisualDensity(horizontal: -4, vertical: -4),
                              title: Text('Delete'),
                              leading: ImageIcon(
                                AssetImage(
                                  MyImages.bin,
                                ),
                              ),
                            ),
                            onTap: (){
                              print('hkh');
                              Future.delayed(
                                  const Duration(seconds: 0),
                              () =>
                              showCustomDialogBox(
                                  context: context,
                                  child: Column(
                                    children: [
                                      vSizedBox,
                                      Image.asset(MyImages.delete, height: 35, width: 35,),
                                      vSizedBox2,
                                      MainHeadingText(text: 'Delete This Increment Detail', color: MyColors.black,),
                                      vSizedBox2,
                                      ParagraphText(text: 'Do you wish to delete this increment detail ?'),
                                      vSizedBox4,
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: RoundEdgedButton(
                                                text: 'Cancel',
                                                color: Color(0xFFF3F4F6),
                                                textColor: MyColors.black,
                                              )),
                                          hSizedBox,
                                          Expanded(
                                              child: RoundEdgedButton(
                                                text: 'Delete',
                                              )),
                                        ],
                                      ),
                                    ],
                                  )
                              ));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                vSizedBox,
              ],
            ),

          ],
        ),
      ),
    );
  }
}
