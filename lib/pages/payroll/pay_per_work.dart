import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/payroll/add_pay_per_work.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';
import 'package:salaryredesign/widgets/dropdown.dart';

import '../../widgets/customtextfield.dart';

class Pay_Per_Work_Page extends StatefulWidget {
  const Pay_Per_Work_Page({Key? key}) : super(key: key);

  @override
  State<Pay_Per_Work_Page> createState() => _Pay_Per_Work_PageState();
}

class _Pay_Per_Work_PageState extends State<Pay_Per_Work_Page> {
  TextEditingController search = TextEditingController();
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Pay Per Work', titlecenter: false),
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
                      MainHeadingText(text: 'Pay Per Work', fontSize: 20,),
                      hSizedBox,
                      hSizedBox05,
                      RoundEdgedButton(
                        text: 'Add Pay Per Work',
                        verticalPadding: 0,
                        horizontalPadding: 10,
                        minWidth: 100,
                        height: 35,
                        onTap: (){
                          push(context: context, screen: Add_Pay_Per_Work_Page());
                        },
                      )
                    ],
                  ),
                  vSizedBox,
                  CustomTextField(
                    controller: search,
                    hintText: 'Search',
                    prefixIcon: MyImages.search,
                    suffixIcon: MyImages.filter,
                    suffixheight: 20,
                    height: 52,
                    onTapsuffix: (){
                      bottomsheet(
                        height: 450,
                        context: context,
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            vSizedBox4,
                            MainHeadingText(text: 'Search Filter', fontSize: 16, color: MyColors.black,),
                            vSizedBox2,
                            CustomTextField(controller: name, hintText: '',
                              label: 'Date',
                              showlabel: true,
                              labelcolor: MyColors.black,
                            ),
                            vSizedBox2,
                            CustomTextField(controller: name, hintText: '',
                              label: 'Item Name',
                              showlabel: true,
                              labelcolor: MyColors.black,
                            ),
                            vSizedBox2,
                            CustomTextField(controller: name, hintText: '',
                              label: 'Status',
                              showlabel: true,
                              labelcolor: MyColors.black,
                            ),
                            vSizedBox2,
                            RoundEdgedButton(
                                text: 'SEARCH'
                            ),
                            vSizedBox4,
                          ],
                        ),
                      );
                    },
                  ),
                  vSizedBox2,

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainHeadingText(text: 'Summary'),
                      RoundEdgedButton(
                        text: 'Total Unpaid Amount : 1000',
                        verticalPadding: 0,
                        horizontalPadding: 10,
                        minWidth: 100,
                        textColor: Color(0xFF4F46E5),
                        color: Color(0xFFDBEAFE),
                        height: 35,
                        onTap: (){

                        },
                      )
                    ],
                  ),
                  Divider(height: 30,),
                  // vSizedBox2,
                  for(var i=0; i<3; i++)
                  Column(
                    children: [
                      GestureDetector(
                        child: List_bonus(
                          text: 'Shirt Stitching',
                          subtext: '29-07-2022 12:48',
                          price: '₹ 5,000',
                          headingcolor: MyColors.primaryColor,
                          img: MyImages.green_up,
                          deletemain: 'Delete This Pay Per Work',
                          deletesub: 'Do you wish to delete this Pay per Work?',
                          isimage: false,
                        ),
                        onTap: (){
                          bottomsheet(context: context,
                              height: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  vSizedBox4,
                                  List_bonus(
                                    text: 'Shirt Stitching',
                                    subtext: '29-07-2022 12:48',
                                    price: '₹ 5,000',
                                    headingcolor: MyColors.primaryColor,
                                    img: MyImages.green_up,
                                    deletemain: 'Delete This Bonus Detail',
                                    deletesub: 'Do you wish to delete this bonus detail ?',
                                    isimage: false,
                                    popupmenu: false,
                                  ),
                                  vSizedBox ,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ParagraphText(text: 'Unit', fontSize: 14,),
                                            vSizedBox05,
                                            MainHeadingText(text: '20', fontSize: 16,),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ParagraphText(text: 'Amount', fontSize: 14,),
                                            vSizedBox05,
                                            MainHeadingText(text: '₹ 25', fontSize: 16,),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ParagraphText(text: 'Total Amount', fontSize: 14,),
                                            vSizedBox05,
                                            MainHeadingText(text: '₹ 500', fontSize: 16,),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                  vSizedBox2,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ParagraphText(text: 'Assigned By', fontSize: 14,),
                                      vSizedBox05,
                                      MainHeadingText(text: 'Elavarasan Rajan', fontSize: 16,),
                                    ],
                                  ),
                                  vSizedBox2,
                                  RoundEdgedButton(
                                    text: 'MARK AS COMPLETED',
                                    color: MyColors.secondarycolor,
                                    onTap: (){
                                      Navigator.pop(context);
                                      bottomsheet(context: context,
                                          height: 450,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              vSizedBox4,
                                              List_bonus(
                                                text: 'Shirt Stitching',
                                                subtext: '29-07-2022 12:48',
                                                price: '₹ 5,000',
                                                headingcolor: MyColors.primaryColor,
                                                img: MyImages.green_up,
                                                deletemain: 'Delete This Bonus Detail',
                                                deletesub: 'Do you wish to delete this bonus detail ?',
                                                isimage: false,
                                                popupmenu: false,
                                              ),
                                              vSizedBox ,
                                              CustomTextField(
                                                controller: name,
                                                hintText: '',
                                                label: 'Description',
                                                showlabel: true,
                                              ),
                                              vSizedBox ,
                                              ParagraphText(text: 'Attachments', fontSize: 14, color: MyColors.black,),
                                              vSizedBox2,
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
                                              RoundEdgedButton(text: 'Done',)

                                            ],
                                          )
                                      );
                                    },
                                  )
                                  
                                ],
                              )
                          );
                        },
                      ),
                      vSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ParagraphText(text: 'Unit', fontSize: 14,),
                                vSizedBox05,
                                MainHeadingText(text: '20', fontSize: 16,),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ParagraphText(text: 'Amount', fontSize: 14,),
                                vSizedBox05,
                                MainHeadingText(text: '₹ 25', fontSize: 16,),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ParagraphText(text: 'Total Amount', fontSize: 14,),
                                vSizedBox05,
                                MainHeadingText(text: '₹ 500', fontSize: 16,),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ParagraphText(text: 'Assigned By', fontSize: 14,),
                                vSizedBox05,
                                MainHeadingText(text: 'Elavarasa...', fontSize: 16,),
                              ],
                            ),
                          ),
                        ],
                      ),
                      vSizedBox,
                      Divider(),
                      vSizedBox2,
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
