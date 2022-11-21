import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/constans.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/employee/employee_dshboard.dart';
import 'package:salaryredesign/pages/face_recognition/face_recognition_start_page.dart';
import 'package:salaryredesign/pages/tab_pages/bottom_tab.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/buttons.dart';

class Face_Recognition_Complete_Page extends StatefulWidget {
  const Face_Recognition_Complete_Page({Key? key}) : super(key: key);

  @override
  State<Face_Recognition_Complete_Page> createState() => _Face_Recognition_Complete_PageState();
}

class _Face_Recognition_Complete_PageState extends State<Face_Recognition_Complete_Page>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width(context),
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/images/face_recog.png',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: MyColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              height: 230,
             
              padding: horizontal_pad,
              child: Center(
                  child: Column(
                      children: [
                        vSizedBox2,
                        vSizedBox,
                        MainHeadingText(
                          text: 'Scan Completed!',
                          color: MyColors.black,
                          fontSize: 30,
                        ),
                        vSizedBox2,
                        vSizedBox05,
                        ParagraphText(
                          text: 'Thanks for your effort, face recognition\nsuccessfully registered',
                          color: MyColors.black,
                          fontSize: 14,
                          fontFamily: 'regular',
                          textAlign: TextAlign.center,
                        ),
                        vSizedBox2,
                        vSizedBox,
                        RoundEdgedButton(
                          text: 'COMPLETE PROFILE',
                          borderRadius: 5,
                          fontfamily: 'bold',
                          onTap: (){
                            push(context: context, screen: TabsPage());
                          },
                        )
                      ],
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
