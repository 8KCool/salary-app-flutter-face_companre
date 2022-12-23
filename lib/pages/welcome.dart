import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/select_type_page.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/sized_box.dart';
import 'Login_process/enter_phone_number.dart';


class Welcome_Page extends StatefulWidget {
  const Welcome_Page({Key? key}) : super(key: key);

  @override
  State<Welcome_Page> createState() => _Welcome_PageState();
}


class _Welcome_PageState extends State<Welcome_Page> {

  PageController controller = PageController();
  page1(){
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
        ),
        Positioned(
          top: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                vSizedBox2,
               GestureDetector(
                 child: Container(
                   width: MediaQuery.of(context).size.width,
                   padding: EdgeInsets.only(right: 16),
                   child: GestureDetector(
                     onTap: (){
                       push(context: context, screen: Enter_Phone_Number());
                     },
                     child: ParagraphText(
                         text: 'Skip',
                       color: Colors.black,
                       fontSize: 14,
                       fontFamily: 'bold',
                       textAlign:TextAlign.end,
                     ),
                   ),
                 ),
               onTap: (){

               },
               ),
                vSizedBox4,
                Center(
                  child: Image.asset(
                    width: MediaQuery.of(context).size.width,
                    MyImages.sliderone,
                    height: 260,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric( horizontal: 24),
            height: 420,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36),
                topRight: Radius.circular(36),
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vSizedBox16,
                vSizedBox16,
                MainHeadingText(text: 'Keep healthy \nwork-life balance',
                  color: MyColors.headingcolor,
                  fontSize: 24,
                  fontFamily: 'bold',
                  height: 1.8,
                ),
                vSizedBox16,
                ParagraphText(
                  text: 'Lorem ipsum dolor sit amet, consectetur adi piscing elit. Cursus sit suspendisse aliquam eget lorem viverra tincidunt.',
                  color: MyColors.paragraphcolor,
                  fontSize: 16,
                  height: 1.7,
                ),
                vSizedBox4,

              ],
            ),
          ),
        )
      ],
    );
  }
  page2(){
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
        ),
        Positioned(
          top: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                vSizedBox2,
                GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: (){
                        push(context: context, screen: Enter_Phone_Number());
                      },
                      child: ParagraphText(
                        text: 'Skip',
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'bold',
                        textAlign:TextAlign.end,
                      ),
                    ),
                  ),
                  onTap: (){

                  },
                ),
                vSizedBox4,
                Center(
                  child: Image.asset(
                    width: MediaQuery.of(context).size.width,
                    MyImages.slidertwo,
                    height: 260,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric( horizontal: 24),
            height: 420,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vSizedBox16,
                vSizedBox16,
                MainHeadingText(text: 'Track your work &\nget result',
                  color: MyColors.headingcolor,
                  fontSize: 22,
                  fontFamily: 'bold',
                  height: 1.5,
                ),
                vSizedBox16,
                ParagraphText(
                  text: 'Lorem ipsum dolor sit amet, consectetur adi piscing elit. Cursus sit suspendisse aliquam eget lorem viverra tincidunt.',
                  color: MyColors.paragraphcolor,
                  fontSize: 20,
                  height: 1.5,
                ),
                vSizedBox4,

              ],
            ),
          ),
        )
      ],
    );
  }
  page3(){
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
        ),
        Positioned(
          top: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                vSizedBox2,
                GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: (){
                        push(context: context, screen: Enter_Phone_Number());
                      },
                      child: ParagraphText(
                        text: 'Skip',
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'bold',
                        textAlign:TextAlign.end,
                      ),
                    ),
                  ),
                  onTap: (){

                  },
                ),
                vSizedBox4,
                Center(
                  child: Image.asset(
                    width: MediaQuery.of(context).size.width,
                    MyImages.sliderthree,
                    height: 260,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric( horizontal: 24),
            height: 420,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vSizedBox16,
                vSizedBox16,
                MainHeadingText(text: 'Stay organized \nwith team',
                  color: MyColors.headingcolor,
                  fontSize: 22,
                  fontFamily: 'bold',
                  height: 1.5,
                ),
                vSizedBox16,
                ParagraphText(
                  text: 'Lorem ipsum dolor sit amet, consectetur adi piscing elit. Cursus sit suspendisse aliquam eget lorem viverra tincidunt.',
                  color: MyColors.paragraphcolor,
                  fontSize: 20,
                  height: 1.5,
                ),
                vSizedBox4,

              ],
            ),
          ),
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFF0FDFF),
      body: SafeArea(
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView.builder(
                itemCount: 3,
                controller: controller,
                itemBuilder: (context, index){
                  switch(index){
                    case 0: return page1();
                    case 1: return page2();
                    case 2: return page3();
                    default: return page1();
                  }
                },
              ),
              Positioned(
                bottom: 40,
                // alignment: Alignment.center,
                child: Container(

                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                          controller: controller,  // PageController
                          count:  3,
                          effect: ExpandingDotsEffect(
                            // activeStrokeWidth: 2.6,
                            // activeDotScale: 1.3,
                            // maxVisibleDots: 5,
                            radius: 8,
                            spacing: 6,
                            dotHeight: 8,
                            dotWidth: 15,
                            activeDotColor: MyColors.primaryColor,
                            dotColor: Color(0xFF567DF4).withOpacity(0.2),

                          ),  // your preferred effect
                          onDotClicked: (index){

                          }
                      ),
                      // if (page1())

                      GestureDetector(
                        onTap: (){
                            // controller.jumpToPage(1);
                          push(context: context, screen: Enter_Phone_Number());
                        },
                        child:Image.asset(
                          MyImages.btnone,
                          height: 88,
                        ),
                      ),
                      // RoundEdgedButton(
                      //     text: 'next',
                      //     textColor: Colors.white,
                      //     width: 100,
                      //   onTap: (){
                      //       controller.jumpToPage(1);
                      //   },
                      // ),
                    ],
                  ),
                ) ,
              ),
              // Positioned(
              //   bottom: 20,
              //   right: 32,
              //   child: GestureDetector(
              //     onTap: (){
              //       // Navigator.pushNamed(context, LoginPage.id);
              //     },
              //     child: Container(
              //       decoration: BoxDecoration(
              //           color: MyColors.primaryColor,
              //           borderRadius: BorderRadius.circular(12)
              //       ),
              //       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              //       child: Icon(Icons.arrow_forward, color: Colors.white,),
              //     ),
              //   ),
              // ),

            ],
          ),
        ),
      ),
    );
  }
}
