import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/constans.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/Login_process/enter_details.dart';
import 'package:salaryredesign/pages/tab_pages/bottom_tab.dart';
import 'package:salaryredesign/pages/tab_pages/dashboard.dart';
import 'package:salaryredesign/pages/update_payment_detail_1.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/lists.dart';


final SimpleDialog dialog1 = SimpleDialog(
  backgroundColor: Colors.transparent,
  clipBehavior: Clip.antiAliasWithSaveLayer,
  insetPadding: EdgeInsets.all(0),
  contentPadding: EdgeInsets.all(0),
  // title: Text('Allow Liza to see', textAlign: TextAlign.center,),
  children: [
    SimpleDialogItem(),
  ],
);
class SimpleDialogItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SimpleDialogOption(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height - 470,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: MyColors.primaryColor
          ),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ParagraphText(
              text: 'Choose Organization',
              fontSize: 20,
              fontFamily: 'bold',
              color: Colors.black,
            ),
            vSizedBox2,
            GestureDetector(
              onTap: (){
                push(context: context, screen: Enter_Detail_Page(phone: '',));
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(
                                0.0,
                                4.0,
                              ),
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                            ),
                          ]
                        ),
                          child: Image.asset(
                            MyImages.organization_choose, height: 60, width: 60,)
                      ),
                      hSizedBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainHeadingText(text: 'EcomAds Private Limted', fontSize: 16, fontFamily: 'bold',),
                          vSizedBox05,
                          ParagraphText(text: 'Id : 687676EB89',
                            fontSize: 14,
                            color: Colors.black,
                            )
                        ],
                      )
                    ],
                  ),
                  Divider(height: 30,)
                ],
              ),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(
                                0.0,
                                4.0,
                              ),
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                            ),
                          ]
                        ),
                          child: Image.asset(
                            MyImages.organization_choose, height: 60, width: 60,)
                      ),
                      hSizedBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainHeadingText(text: 'Ecom Apps Private Limited', fontSize: 16, fontFamily: 'bold',),
                          vSizedBox05,
                          ParagraphText(text: 'Id : 687676EB89',
                            fontSize: 14,
                            color: Colors.black,
                            )
                        ],
                      )
                    ],
                  ),
                  Divider(height: 30,)
                ],
              ),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(
                                0.0,
                                4.0,
                              ),
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                            ),
                          ]
                        ),
                          child: Image.asset(
                            MyImages.organization_choose, height: 60, width: 60,)
                      ),
                      hSizedBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainHeadingText(text: 'Glow Jobs Private Limited', fontSize: 16, fontFamily: 'bold',),
                          vSizedBox05,
                          ParagraphText(text: 'Id : 687676EB89',
                            fontSize: 14,
                            color: Colors.black,
                            )
                        ],
                      )
                    ],
                  ),
                  Divider(height: 30,)
                ],
              ),
            ),

          ],
        ),
      ),
      // onPressed: onPressed,

    );
  }

  void setState(Null Function() param0) {}
}




class SuccessFullySalaryProcess extends StatefulWidget {
  const SuccessFullySalaryProcess({Key? key}) : super(key: key);

  @override
  State<SuccessFullySalaryProcess> createState() => _SuccessFullySalaryProcessState();
}

class _SuccessFullySalaryProcessState extends State<SuccessFullySalaryProcess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                vSizedBox4,
                vSizedBox4,
                Image.asset(MyImages.congrtulation, width: 276, ),
                vSizedBox4,
                vSizedBox4,
                MainHeadingText(
                  text: 'It’s Done',
                  fontFamily: 'bold',
                  fontSize: 32,
                  color: MyColors.primaryColor,
                ),
                vSizedBox2,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ParagraphText(
                    text: 'Your salary was processed successfully.',
                    color: MyColors.labelcolor,
                    textAlign: TextAlign.center,
                    fontSize: 20,
                  ),
                ),


              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RoundEdgedButton(
                      text: 'Update Details', textColor: Colors.white,
                    onTap: (){
                      // showDialog<void>(context: context, builder: (context) => dialog1);
                      push(context: context, screen: PaymentDetail1());
                    },
                  ),
                  vSizedBox,
                  RoundEdgedButton(
                    text: 'Skip',
                    textColor: MyColors.paragraphcolor,
                    fontfamily: 'regular',
                    color: Colors.transparent,
                    onTap: (){
                      // push(context: context, screen: Dashboard_Page());
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
