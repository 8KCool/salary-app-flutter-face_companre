import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/constans.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/face_recognition/face_recognition_complete.dart';
import 'package:salaryredesign/pages/face_recognition/face_recognition_start_page.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/buttons.dart';

class Face_Recognition_Processing_Page extends StatefulWidget {
  final File image ;
  const Face_Recognition_Processing_Page({Key? key,required this.image}) : super(key: key);

  @override
  State<Face_Recognition_Processing_Page> createState() => _Face_Recognition_Processing_PageState();
}

class _Face_Recognition_Processing_PageState extends State<Face_Recognition_Processing_Page> with TickerProviderStateMixin {

  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {






        // Timer(Duration(seconds: 5),(){
        //   push(context: context, screen: Face_Recognition_Complete_Page());
        // });
      });
    });

    Future.delayed(const Duration(milliseconds: 5000), () {


      setState(() {
        pushReplacement(context: context, screen: Face_Recognition_Complete_Page(image: widget.image,));

        // Here you can write your code for open new view
      });

    });
    controller.repeat(reverse: true    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
      child: Scaffold(
       //  appBar: AppBar(
       //    // title: Text('Processing...'),
       // automaticallyImplyLeading: false,
       //    leading: IconButton(icon: Icon(Icons.arrow_back_ios),
       //      onPressed: () {
       //
       //      },),
       //  ),
        body: Stack(
          children: [
            Container(
              width: width(context),
              height: MediaQuery.of(context).size.height,
              child: Image.file(widget.image,
              fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: MyColors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                height: 180,

                padding: horizontal_pad,
                child: Center(
                    child: Column(
                        children: [
                          vSizedBox2,
                          MainHeadingText(
                            text: 'Hold still, we\'re processing',
                            color: MyColors.white,
                            fontSize: 25,
                          ),
                          vSizedBox4,
                          vSizedBox05,
                          ParagraphText(text: '50% Recognized',
                          color: MyColors.white, fontSize: 16, fontFamily: 'semibold',
                          ),
                          vSizedBox2,
                          vSizedBox,
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: MyColors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: LinearProgressIndicator(
                                value: controller.value,
                                semanticsLabel: 'Linear progress indicator',
                                backgroundColor: MyColors.white,
                                minHeight: 8,
                                valueColor: AlwaysStoppedAnimation<Color>
                                  (MyColors.primaryColor),
                              ),
                            ),
                          ),
                        ],
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
