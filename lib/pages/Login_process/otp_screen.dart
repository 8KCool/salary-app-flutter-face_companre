import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';

import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/Login_process/congratulations.dart';
import 'package:salaryredesign/pages/Login_process/enter_details.dart';

import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';

import 'package:salaryredesign/widgets/showSnackbar.dart';

import '../../constants/globalFunction.dart';
import '../../constants/globalkeys.dart';
import '../../constants/image_urls.dart';
import '../../providers/clock.dart';
import '../../services/api_urls.dart';
import '../../services/local_services.dart';
import '../../services/webservices.dart';
import '../../widgets/CustomLoader.dart';
import '../../widgets/CustomTexts.dart';
import '../../widgets/otp_widget.dart';
import '../employee/employee_dshboard.dart';
import '../tab_pages/bottom_tab.dart';

import '../webviewPages/new_web_view_tab.dart';

class Enter_OTP_Page extends StatefulWidget {
  final String phone;
  final String otp;

  const Enter_OTP_Page({Key? key, required this.phone, required this.otp})
      : super(key: key);

  @override
  State<Enter_OTP_Page> createState() => _Enter_OTP_PageState(otp);
}

class _Enter_OTP_PageState extends State<Enter_OTP_Page> {

  _Enter_OTP_PageState(this.newotp);
  Timer? timer;
  String newotp;
  ValueNotifier<bool> isOtpVerified = ValueNotifier(false);
  ValueNotifier<bool> verifyLoading = ValueNotifier(false);
  verifyOtp(bool isVerified) async {
    if (isVerified) {
      verifyLoading.value = true;
      print('phone-------${widget.phone}');
      Map<String, dynamic> data = {'phone': widget.phone.toString()};

      var res = await Webservices.postData(
          apiUrl: ApiUrls.loginPost,
          body: data,
          context: context,
          showSuccessMessage: true);

      print('resiss--------${res}');
      print(
          'resiss--------is${res['success'].runtimeType} and ${res['message']}');

      if (res['success'].toString() == 'true') {
        log('data for session -------------${res['userData']}');
        // verifyLoading.value = false;
        print('otp------------${res['type']}');
        if (res['type'].toString() == '1') {
          Provider.of<GlobalModal>(context, listen: false).cancelTimer();

          push(
              context: context,
              screen: Enter_Detail_Page(
                phone: widget.phone,
              ));
        } else if (res['userData']['client_emp'] == null) {
          await Provider.of<GlobalModal>(context, listen: false)
              .addUserDetail(res['userData'], context);
          globalHeaders = {
            'Authorization':
                'Bearer ${Provider.of<GlobalModal>(context, listen: false).userData!.token}',
          };
          log('global header assign by ankita --------------------$globalHeaders');
          // await setWebWiewController(context,'${ApiUrls.siteBaseUrl}staff/dashboard');
          // push(context: context, screen: Congratulations_Page(isEmp: false,));
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => NewTabScreen()),
              (Route<dynamic> route) => false);
          user = res['userData'];
          // log("token ----------------${res['userData']}");
        } else if (res['userData']['client_emp'] != null) {
          await Provider.of<GlobalModal>(context, listen: false)
              .addUserDetail(res['userData'], context);
          // push(context: context, screen: newTabsPage());
          usertoken =
              '${await Provider.of<GlobalModal>(context, listen: false).userData!.token}';
          // await setWebWiewController(context,'${ApiUrls.siteBaseUrl}staff/dashboard',globalSettingController);
          // await setWebWiewController(context,'${ApiUrls.siteBaseUrl}staff/dashboard',globalmyAccountController);
          ///
          // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          // Tabbarscreen(key:MyGlobalKeys.tabbarKey,)), (Route<dynamic> route) => false);
          ///
          // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          //     ManishHomePage()), (Route<dynamic> route) => false);

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => NewTabScreen()),
              (Route<dynamic> route) => false);

          ///
          // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          //     TabsPage()), (Route<dynamic> route) => false);
          // await MyLocalServices.updateSharedPreferences(res['userData']);

          user = res['userData'];
        }
      } else {
        Navigator.popUntil(context, (route) => route.isFirst);
        await Future.delayed(Duration(milliseconds: 200));
        showSnackbar(
            MyGlobalKeys.navigatorKey.currentContext!, '${res['message']}');
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<GlobalModal>(context, listen: false).isShow = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<GlobalModal>(builder: (context, globalModal, child) {
        return globalModal.load
            ? CustomLoader()
            : SingleChildScrollView(
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    globalModal.cancelTimer();
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  )),
                              hSizedBox2,
                              MainHeadingText(
                                text: 'Enter OTP',
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'bold',
                                height: 1.5,
                              ),
                            ],
                          ),
                          vSizedBox16,
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: ParagraphText(
                              // text: 'Enter the verification code we just sent\nyou on your phone number',
                              text: 'Enter the verification code',
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
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        // height: MediaQuery.of(context).size.height - 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(36),
                              topRight: Radius.circular(36),
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            vSizedBox16,
                            vSizedBox16,

                            vSizedBox2,
                            vSizedBox2,

                            // CustomOtpWidget(otpLength: 6),
                            OtpVerification(
                              bgColor: Colors.white,
                              borderColor:
                                  MyColors.bordercolor.withOpacity(0.05),
                              textColor: Colors.black,
                              navigationFrom: 'navigationFrom',
                              correctOtp: newotp,
                              load: () {
                                isOtpVerified.value = true;
                                print('the otp is true');
                              },
                              wrongOtp: () {
                                isOtpVerified.value = false;
                              },
                            ),
                            vSizedBox2,
                            globalModal.isShow
                                ? Center(
                                    child: RoundEdgedButton(
                                      text: 'Resend OTP',
                                      textColor: MyColors.primaryColor,
                                      color: MyColors.headingcolor
                                          .withOpacity(0.1),
                                      borderRadius: 6,
                                      width: 200,
                                      fontSize: 16,
                                      onTap: () async {

                                        print('phone-------${widget.phone}');
                                        Map<String, dynamic> data = {
                                          'phone': widget.phone.toString()
                                        };

                                        globalModal.loadingShow();
                                        var res = await Webservices.postData(
                                            apiUrl: ApiUrls.resendOtp,
                                            body: data,
                                            context: context,
                                            showSuccessMessage: true);

                                        globalModal.loadingHide();

                                        if (res['success'].toString() ==
                                            'true') {
                                          showSnackbar(context,
                                              res['message'].toString());
                                          print(
                                              'otp------------${res['data']['otp']}');
                                          newotp =
                                              res['data']['otp'].toString();
                                          globalModal.cancelTimer();
                                          globalModal.isShow = false;
                                          globalModal.startTimer();

                                          //token
                                          // Provider.of<GlobalModal>(context, listen: false).startTimer();
                                        }
                                      },
                                    ),
                                  )
                                : Center(
                                    child: Text(''),
                                  ),
                            vSizedBox2,
                            Center(child: Consumer<GlobalModal>(
                                builder: (context, clock, child) {
                              return clock.isShow
                                  ? Text('')
                                  : ParagraphText(
                                      text:
                                          'You can request OTP after ${clock.clock}',
                                      color: MyColors.orange,
                                      fontSize: 14,
                                    );
                            })),
                            vSizedBox4,
                            vSizedBox2,
                            ValueListenableBuilder<bool>(
                              valueListenable: isOtpVerified,
                              builder: (context, value, child) {
                                return ValueListenableBuilder<bool>(
                                    valueListenable: verifyLoading,
                                    builder: (context, verifyLoadingValue, child) {
                                    return RoundEdgedButton(
                                      text: 'Verify',
                                      textColor: Colors.white,
                                      is_Loading: verifyLoadingValue,
                                      onTap: () async {
                                        verifyOtp(value);
                                      },
                                    );
                                  }
                                );
                              }
                            ),
                            vSizedBox4,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }


}
