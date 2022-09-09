import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/Login_process/enter_OTP.dart';
import 'package:salaryredesign/providers/clock.dart';
import 'package:salaryredesign/services/webservices.dart';
import 'package:salaryredesign/widgets/CustomLoader.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';

import '../../constants/image_urls.dart';
import '../../services/api_urls.dart';
import '../../widgets/CustomTexts.dart';
import '../../widgets/phonecode.dart';
import '../../widgets/showSnackbar.dart';
import 'package:country_picker/country_picker.dart';
class Enter_Phone_Number extends StatefulWidget {
  const Enter_Phone_Number({Key? key}) : super(key: key);

  @override
  State<Enter_Phone_Number> createState() => _Enter_Phone_NumberState();
}

class _Enter_Phone_NumberState extends State<Enter_Phone_Number> {
  TextEditingController mobilenumber = TextEditingController();
  TextEditingController phonecode = TextEditingController();
 String country11='';
  bool loader=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Consumer<GlobalModal>(
        builder: (context,globalModal,child) {
          return globalModal.load?CustomLoader():Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   height: MediaQuery.of(context).size.height,
              // ),
              Container(
                color: MyColors.primaryColor,
                width: MediaQuery.of(context).size.width,
                height: 260,
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    vSizedBox6,
                    // vSizedBox8,
                    Row(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.arrow_back, color: Colors.white,)
                        ),
                        hSizedBox2,
                        MainHeadingText(text: 'Enter Your Phone',
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'bold',
                          height: 1.5,
                        ),
                      ],
                    ),
                    vSizedBox16,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ParagraphText(
                        text: 'You will receive a 6 digit code for phone number\nverification',
                        color: Colors.white,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    vSizedBox4,
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(0, -50),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric( horizontal: 24),
                  // height: MediaQuery.of(context).size.height - 200,
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


                      // CustomPhoneNumberInputField(controller:phonecode,
                      //   onInputChanged:(Country v){
                      //     country11=v.phoneCode.toString();
                      //     print("country------"+v.phoneCode.toString());
                      //   },
                      //   selectedCountry: country11.toString(),
                      //
                      //
                      // ),
                      CustomTextField(
                          controller: mobilenumber,
                          hintText: '1234567890',
                          fontsize: 16,
                          label: 'Mobile Number',
                          showlabel: true,
                          isflag: true,
                          keyboardtype: TextInputType.number,

                      ),
                      vSizedBox2,
                      RoundEdgedButton(
                          text: 'Get OTP',
                          textColor: Colors.white,
                          onTap: () async {
                            print('get otp --------------------');
                            String phonePattern =
                                r'^(\+?\d{1,4}[\s-])?(?!0+\s+,?$)\d{10}\s*,?$';
                            RegExp pnumber = new RegExp(phonePattern);
                            if (mobilenumber.text == '') {
                              showSnackbar(
                                  context, 'Please Enter your phone Number.');
                            } else if (!pnumber.hasMatch(mobilenumber.text)) {
                              showSnackbar(context,
                                  'Please Enter your valid phone Number.');
                            }
                            else{
                              Map<String,dynamic>data={
                                'phone':mobilenumber.text
                              };
                              // Provider.of<GlobalModal>(context, listen: false).loadingShow();
                              globalModal.loadingShow();

                              var res = await Webservices.postData(
                                  apiUrl: ApiUrls.login,
                                  body: data,
                                  context: context,
                                  showSuccessMessage: true);
                              // Provider.of<GlobalModal>(context, listen: false).loadingHide();
                               globalModal.loadingHide();
                              if(res['success'].toString()=='true'){
                            // Timer timer =Timer.periodic(new Duration(seconds: 1), (timer) {
                              Provider.of<GlobalModal>(context, listen: false).startTimer();
                              // debugPrint(timer.tick.toString());
                            // });



                            // new Timer(new Duration(seconds: 1), () {
                            //   Provider.of<ClockModal>(context, listen: false).addTime();
                            //   debugPrint("Print after 5 seconds");
                            // });

                                push(context: context, screen: Enter_OTP_Page(phone:mobilenumber.text, otp:res['data']['otp'].toString() ,));
                              }

                            }
                            //
                          },
                      ),

                      vSizedBox4,



                    ],
                  ),
                ),
              ),

            ],
          );
        }
      ),
    );
  }
}
