import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/update_payment_detail_2.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';
import 'package:salaryredesign/widgets/dropdown.dart';

import '../../constants/image_urls.dart';
import '../../constants/sized_box.dart';
import '../../widgets/avatar.dart';

class PaymentDetail1 extends StatefulWidget {
  const PaymentDetail1({Key? key}) : super(key: key);

  @override
  State<PaymentDetail1> createState() => _PaymentDetail1State();
}
bool bank = true;
bool upi = false;


class _PaymentDetail1State extends State<PaymentDetail1> {

  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Update Payment Details', titlecenter: false) ,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            vSizedBox,
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 120,
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vSizedBox,
                  MainHeadingText(text: 'Update Payment Details', fontSize: 16, fontFamily: 'bold',),
                  vSizedBox2,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: RoundEdgedButton(
                                text: 'Cash',
                                borderRadius: 5,
                                bordercolor: MyColors.black,
                                color: bank?Color(0xFEDBEAFE): MyColors.white,
                                textColor: MyColors.black,
                                onTap: (){
                                  setState((){
                                    bank = true;
                                    upi = false;
                                  });
                                },
                              )
                          ),
                          hSizedBox4,
                          Expanded(

                              child: RoundEdgedButton(
                                text: 'Cheque',
                                borderRadius: 5,
                                bordercolor: MyColors.black,
                                color: upi? Color(0xFEDBEAFE): MyColors.white,
                                textColor: MyColors.black,
                                onTap: (){
                                  setState((){
                                    bank = false;
                                    upi = true;
                                  });
                                },
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  vSizedBox4,
                  if(bank)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainHeadingText(text: 'Enter the following details', fontSize: 16, fontFamily: 'bold',),
                      vSizedBox05,
                      ParagraphText(text: 'Payment Mode : Cash', color: MyColors.black,),
                      vSizedBox4,
                      CustomTextField(controller: name, hintText: '',
                        label: 'Amount',
                        showlabel: true,
                        labelcolor: MyColors.black,
                      ),
                      vSizedBox2,
                      CustomTextField(controller: name, hintText: '',
                        label: 'Date',
                        showlabel: true,
                        labelcolor: MyColors.black,
                      ),
                      vSizedBox8,
                      RoundEdgedButton(
                        onTap: () => push(context: context, screen: PaymentDetail2()),
                        text: 'Update'
                      ),
                      vSizedBox4,
                    ],
                  ),
                  if(upi)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainHeadingText(text: 'Enter the following details', fontSize: 16, fontFamily: 'bold',),
                      vSizedBox05,
                      ParagraphText(text: 'Payment Mode : Cheque', color: MyColors.black,),
                      vSizedBox4,
                      CustomTextField(controller: name, hintText: '',
                        label: 'Amount',
                        showlabel: true,
                        labelcolor: MyColors.black,
                      ),
                      vSizedBox2,
                      CustomTextField(controller: name, hintText: '',
                        label: 'Cheque Number',
                        showlabel: true,
                        labelcolor: MyColors.black,
                      ),
                      vSizedBox2,
                      CustomTextField(controller: name, hintText: '',
                        label: 'Cheque Date',
                        showlabel: true,
                        labelcolor: MyColors.black,
                      ),
                      vSizedBox8,
                      RoundEdgedButton(
                          onTap: () => push(context: context, screen: PaymentDetail2()),
                          text: 'Update'
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
