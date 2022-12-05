import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';

import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/Login_process/congratulations.dart';
import 'package:salaryredesign/pages/Login_process/enter_details.dart';

import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';

import 'package:salaryredesign/widgets/showSnackbar.dart';

import '../../constants/globalkeys.dart';
import '../../constants/image_urls.dart';
import '../../providers/clock.dart';
import '../../services/api_urls.dart';
import '../../services/local_services.dart';
import '../../services/webservices.dart';
import '../../widgets/CustomLoader.dart';
import '../../widgets/CustomTexts.dart';
import '../employee/employee_dshboard.dart';
import '../tab_pages/bottom_tab.dart';


class Enter_OTP_Page extends StatefulWidget {
  final String phone;
  final String otp;

  const Enter_OTP_Page({Key? key,required this.phone,required this.otp}) : super(key: key);

  @override
  State<Enter_OTP_Page> createState() => _Enter_OTP_PageState();
}

class _Enter_OTP_PageState extends State<Enter_OTP_Page> {
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController otp6 = TextEditingController();
  FocusNode otp1focus=FocusNode();
  FocusNode otp2focus=FocusNode();
  FocusNode otp3focus=FocusNode();
  FocusNode otp4focus=FocusNode();
  FocusNode otp5focus=FocusNode();
  FocusNode otp6focus=FocusNode();
  BuildContext? c ;
  Timer? timer=null;
  bool loader=false;
  String newotp='';
  // List controller=[
  //   '${otp1.text}',
  // ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newotp=widget.otp;
    Provider.of<GlobalModal>(context, listen: false).isShow=false;

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<GlobalModal>(
          builder: (context,globalModal,child) {
            return globalModal.load?CustomLoader():SingleChildScrollView(
              child: Column(
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
                                  globalModal.cancelTimer();
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(Icons.arrow_back, color: Colors.white,)
                            ),
                            hSizedBox2,
                            MainHeadingText(text: 'Enter OTP',
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
                            text: 'Enter the verification code we just sent\nyou on your phone number',
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          vSizedBox16,
                          vSizedBox16,

                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(4),
                                gradient: new LinearGradient(
                                    stops: [0.01, 0.01],
                                    colors: [
                                      MyColors.orange,
                                      MyColors.orange.withOpacity(0.1),
                                    ]
                                ),
                              ),
                              child: Center(
                                  child: MainHeadingText(
                                    text: 'OTP INPUT',
                                    fontSize: 20,
                                    fontFamily: 'bold',
                                    color: MyColors.headingcolor,
                                  )
                              )
                          ),
                          vSizedBox2,
                          vSizedBox2,
                          // CustomOtpWidget(otpLength: 6),
                          Wrap(
                            spacing: 7,
                            children: [
                              Container(
                                width: 50,
                                height: 58,
                                child: CustomTextFieldOtp(
                                  height: 58,
                                  controller: otp1,
                                  focusnode: otp1focus,
                                  keyboardtype: TextInputType.number,
                                  hintText: '-',
                                  borderradius: 10,
                                  hintcolor: MyColors.headingcolor,
                                  fontsize: 24,
                                  maxlength: 1,
                                  bordercolor: MyColors.bordercolor.withOpacity(0.1),
                                  onchange: (str){
                                    print(str);
                                    if(otp1.text.length==1){
                                      FocusScope.of(context).requestFocus(otp2focus);
                                    }
                                  },
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 58,
                                child: CustomTextFieldOtp(
                                  height: 58,
                                  controller: otp2,
                                  focusnode: otp2focus,
                                  keyboardtype: TextInputType.number,
                                  hintText: '-',
                                  borderradius: 10,
                                  hintcolor: MyColors.headingcolor,
                                  fontsize: 24,
                                  maxlength: 1,
                                  bordercolor: MyColors.bordercolor.withOpacity(0.1),
                                  onchange: (str){
                                    print(str);
                                    if(otp2.text.length==1){
                                      FocusScope.of(context).requestFocus(otp3focus);
                                    }
                                    else if(otp2.text.length==0){
                                      FocusScope.of(context).requestFocus(otp1focus);
                                    }
                                  },
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 58,
                                child: CustomTextFieldOtp(
                                  height: 58,
                                  controller: otp3,
                                  focusnode: otp3focus,
                                  keyboardtype: TextInputType.number,
                                  hintText: '-',
                                  borderradius: 10,
                                  hintcolor: MyColors.headingcolor,
                                  fontsize: 24,
                                  maxlength: 1,
                                  bordercolor: MyColors.bordercolor.withOpacity(0.1),
                                  onchange: (str){
                                    print(str);
                                    if(otp3.text.length==1){
                                      FocusScope.of(context).requestFocus(otp4focus);
                                    }
                                    else if(otp3.text.length==0){
                                      FocusScope.of(context).requestFocus(otp2focus);
                                    }
                                  },
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 58,
                                child: CustomTextFieldOtp(
                                  height: 58,
                                  controller: otp4,
                                  focusnode: otp4focus,
                                  keyboardtype: TextInputType.number,
                                  hintText: '-',
                                  borderradius: 10,
                                  hintcolor: MyColors.headingcolor,
                                  fontsize: 24,
                                  maxlength: 1,
                                  bordercolor: MyColors.bordercolor.withOpacity(0.1),
                                  onchange: (str){
                                    print(str);
                                    if(otp4.text.length==1){
                                      FocusScope.of(context).requestFocus(otp5focus);
                                    }
                                    else if(otp4.text.length==0){
                                      FocusScope.of(context).requestFocus(otp3focus);
                                    }
                                  },
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 58,
                                child: CustomTextFieldOtp(
                                  height: 58,
                                  controller: otp5,
                                  focusnode: otp5focus,
                                  keyboardtype: TextInputType.number,
                                  hintText: '-',
                                  borderradius: 10,
                                  hintcolor: MyColors.headingcolor,
                                  fontsize: 24,
                                  maxlength: 1,
                                  bordercolor: MyColors.bordercolor.withOpacity(0.1),
                                  onchange: (str){
                                    print(str);
                                    if(otp5.text.length==1){
                                      FocusScope.of(context).requestFocus(otp6focus);
                                    }
                                    else if(otp5.text.length==0){
                                      FocusScope.of(context).requestFocus(otp4focus);
                                    }
                                  },
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 58,
                                child: CustomTextFieldOtp(
                                  height: 58,
                                  maxlength: 1,
                                  controller: otp6,
                                  focusnode: otp6focus,
                                  keyboardtype: TextInputType.number,
                                  hintText: '-',
                                  borderradius: 10,
                                  hintcolor: MyColors.headingcolor,
                                  fontsize: 24,
                                  bordercolor: MyColors.bordercolor.withOpacity(0.1),
                                  onchange: (str){
                                    print(str);
                                    if(otp6.text.length==1){
                                      FocusScope.of(context).requestFocus(otp6focus);
                                    }
                                    else if(otp6.text.length==0){
                                      FocusScope.of(context).requestFocus(otp5focus);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          vSizedBox2,
                          globalModal.isShow?Center(
                            child: RoundEdgedButton(
                              text: 'Resend OTP',
                              textColor: MyColors.primaryColor,
                              color: MyColors.headingcolor.withOpacity(0.1),
                              borderRadius: 6,
                              width: 200,
                              fontSize: 16,
                              onTap: ()async{
                                print('phone-------${widget.phone}');
                                Map<String,dynamic>data={
                                  'phone':widget.phone.toString()
                                };

                                globalModal.loadingShow();
                                var res = await Webservices.postData(
                                    apiUrl: ApiUrls.resendOtp,
                                    body: data,
                                    context: context,
                                    showSuccessMessage: true);

                                globalModal.loadingHide();

                                if(res['success'].toString()=='true'){
                                  showSnackbar(context, res['message'].toString());
                                  print('otp------------${res['data']['otp']}');
                                  newotp=res['data']['otp'].toString();
                                  globalModal.cancelTimer();
                                  globalModal.isShow=false;
                                  globalModal.startTimer();

                                  //token
                                  // Provider.of<GlobalModal>(context, listen: false).startTimer();
                                }
                              },
                            ),
                          ):Center(child: Text(''),),
                          vSizedBox2,
                          Center(
                              child: Consumer<GlobalModal>(
                                  builder: (context , clock ,child){
                                    return  clock.isShow?Text(''):ParagraphText(
                                      text: 'You can request OTP after ${clock.clock}',
                                      color: MyColors.orange,
                                      fontSize: 14,
                                    );
                                  }

                              )
                          ),
                          vSizedBox4,
                          vSizedBox2,
                          RoundEdgedButton(text: 'Verify', textColor: Colors.white,
                            onTap: () async {
                              String otp='${otp1.text}${otp2.text}${otp3.text}${otp4.text}${otp5.text}${otp6.text}';
                              print('otp ---check---555------${otp.toString()}----${newotp}');
                              print('otp ---check---999----------${newotp}');

                              if(otp==newotp) {
                                print('phone-------${widget.phone}');
                                Map<String, dynamic>data = {
                                  'phone': widget.phone.toString()
                                };

                                var res = await Webservices.postData(
                                    apiUrl: ApiUrls.loginPost,
                                    body: data,
                                    context: context,
                                    showSuccessMessage: true);

                                print('res--------${res}');

                                if (res['success'].toString() == 'true') {

                                  print('otp------------${res['type']}');
                                  if(res['type'].toString()=='1'){
                                    Provider.of<GlobalModal>(context, listen: false).cancelTimer();

                                    push(context: context, screen: Enter_Detail_Page(phone: widget.phone,));
                                  }
                                  else if(res['userData']['client_emp']==null){
                                    await Provider.of<GlobalModal>(context, listen: false).addUserDetail(res['userData'],context);
                                    // await MyLocalServices.updateSharedPreferences(res['userData']);

                                    push(context: context, screen: Congratulations_Page(isEmp: false,));

                                    user=res['userData'];
                                    // log("token ----------------${res['userData']}");
                                  }
                                  else if(res['userData']['client_emp']!=null){
                                    await Provider.of<GlobalModal>(context, listen: false).addUserDetail(res['userData'],context);
                                    // push(context: context, screen: newTabsPage());
                                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                        TabsPage()), (Route<dynamic> route) => false);
                                    // await MyLocalServices.updateSharedPreferences(res['userData']);

                                    user=res['userData'];
                                  }

                                }
                              }
                              else{
                                showSnackbar(context, 'Please enter valid otp.');
                              }
                              // showDialog<void>(context: context, builder: (context) => dialog1);

                            },
                          ),
                          vSizedBox4,
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            );
          }
      ),
    );
  }
}
