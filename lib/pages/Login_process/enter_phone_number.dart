import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/Login_process/enter_OTP.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';

import '../../constants/image_urls.dart';
import '../../providers/clock.dart';
import '../../services/api_urls.dart';
import '../../services/local_services.dart';
import '../../services/webservices.dart';
import '../../widgets/CustomTexts.dart';
import '../../widgets/customLoader.dart';
import '../../widgets/showSnackbar.dart';

class Enter_Phone_Number extends StatefulWidget {
  const Enter_Phone_Number({Key? key}) : super(key: key);

  @override
  State<Enter_Phone_Number> createState() => _Enter_Phone_NumberState();
}

class _Enter_Phone_NumberState extends State<Enter_Phone_Number> {
  TextEditingController mobilenumber = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    sharedPreference.setString('is_visit', 'true');
    super.initState();
  }
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
                    // IconButton(
                    //     onPressed: (){
                    //       Navigator.of(context).pop();
                    //     },
                    //     icon: Icon(Icons.arrow_back_ios, color: Colors.white,)
                    // ),
                    hSizedBox2,
                    MainHeadingText(text: 'Enter your mobile number',
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

                  CustomTextFieldwithFlag(
                    controller: mobilenumber,
                    hintText: '',
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
                      globalModal.loadingShow();
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


                        var res = await Webservices.postData(
                            apiUrl: ApiUrls.login,
                            body: data,
                            context: context,
                            showSuccessMessage: true);
                        print('data for phone------------$data');
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