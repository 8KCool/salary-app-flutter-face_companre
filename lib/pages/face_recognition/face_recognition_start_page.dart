import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/constans.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/face_recognition/face_recognition_processing.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/buttons.dart';

import '../employee/face_attendance.dart';
import 'package:camera/camera.dart';
class Face_Recognition_Start_Page extends StatefulWidget {
  const Face_Recognition_Start_Page({Key? key}) : super(key: key);

  @override
  State<Face_Recognition_Start_Page> createState() => _Face_Recognition_Start_PageState();
}

class _Face_Recognition_Start_PageState extends State<Face_Recognition_Start_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: MyColors.white,
              height: MediaQuery.of(context).size.height - 300,
              padding: EdgeInsets.only(top: 100),
              child: Center(
                  child: Image.asset(
                    MyImages.face_detect,
                    height: 170,
                    width: 170,
                    fit: BoxFit.fitWidth,
                    // width: 300,
                  )
              ),
            ),
            Container(
              color: MyColors.white,
              height: 300,
              padding: horizontal_pad,
              child: Center(
                  child: Column(
                      children: [
                        vSizedBox2,
                        MainHeadingText(
                          text: 'Face Recognition',
                          color: MyColors.black,
                          fontSize: 32,
                        ),
                        vSizedBox,
                        vSizedBox05,
                        ParagraphText(text: 'Scan your face for verify identity',
                        color: MyColors.black, fontSize: 20,
                        ),
                        vSizedBox2,
                        vSizedBox,
                        RoundEdgedButton(
                          text: 'START SCAN',
                          borderRadius: 5,
                          fontfamily: 'bold',
                          onTap: () async {

                            push(context: context, screen: CameraExampleHome());
                            // push(context: context, screen: Face_Recognition_Processing_Page());
                          },
                        )
                      ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
