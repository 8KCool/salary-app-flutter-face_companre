import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/attandance_page.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';

import '../widgets/customtextfield.dart';

class All_Employee_Page extends StatefulWidget {
  const All_Employee_Page({Key? key}) : super(key: key);

  @override
  State<All_Employee_Page> createState() => _All_Employee_PageState();
}

List images = [
  MyImages.avatrtwo,
  MyImages.avatr3,
  MyImages.avatr4,
  MyImages.avatr5,
  MyImages.avatr6,
  MyImages.avatr7,
  MyImages.avatr8,
  MyImages.avatr9,
  MyImages.avatr10,
  MyImages.avatr11,
  MyImages.avatr12,
];

List Name = [
  'John Smith',
  'Peter John',
  'Nora Luise',
  'Albus Potter',
  'Ron visely',
  'Ronit Sharma',
  'Lorem Ipsum',
  'John Smith',
  'Peter John',
  'Ron visely',
];

class _All_Employee_PageState extends State<All_Employee_Page> {
  TextEditingController search= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      appBar: appBar(
          context: context,
          title: 'Ecomads Private Limited',
          implyLeading: false,
          titlecenter: false,
          leading: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          appBarColor: MyColors.primaryColor,
          titleColor: Colors.white,
          actions: [
            Icon(Icons.notifications_outlined),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.help_outline_outlined,
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.arrow_back, color: Colors.black,)
                          ),
                          hSizedBox,
                          MainHeadingText(text: 'All Employees',
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'bold',
                            height: 1.5,
                          ),
                        ],
                      ),
                      RoundEdgedButton(
                        text: 'ADD NEW',
                        textColor: Colors.white,
                        fontSize: 14,
                        minWidth: 90,
                        height: 35,
                        horizontalPadding: 0,

                      )
                    ],
                  ),
                  vSizedBox2,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: CustomTextField(
                      controller: search,
                      hintText: 'Search',
                      prefixIcon: MyImages.search,
                      suffixIcon: MyImages.filter,
                      suffixheight: 20,
                      height: 52,
                    ),
                  ),
                  vSizedBox,
                ],
              )
            ),
            vSizedBox,
            for (var i = 0; i < 3; i++)
              Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              // margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      images[i],
                      height: 60,
                      width: 60,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hSizedBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: Name[i] + ' ',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: 'bold'),
                          ),
                        ),
                        vSizedBox05,
                        ParagraphText(text: 'Branch Manager',fontSize: 14, color: MyColors.labelcolor,)
                      ],
                    ),
                  ),
                 Image.asset(MyImages.call, height: 36,),
                 hSizedBox,
                 Image.asset(MyImages.whatsapp, height: 36,),
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
            ),
          ],
        ),
      ),
    );
  }
}
