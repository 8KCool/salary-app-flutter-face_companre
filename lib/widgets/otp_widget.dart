import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:salaryredesign/widgets/showSnackbar.dart';

import '../constants/error_constants.dart';

class OtpVerification extends StatefulWidget {
  final Color textColor;
  final Color bgColor;
  final Color borderColor;
  final String navigationFrom;
  String correctOtp;
  final Function load;
  final Function() wrongOtp;

  OtpVerification({
    required this.bgColor,
    required this.borderColor,
    required this.textColor,
    required this.navigationFrom,
    required this.correctOtp,
    required this.load,
    required this.wrongOtp,
  });

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
              child: PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: Colors.green,
                  backgroundColor: Colors.yellow,
                  fontWeight: FontWeight.bold,
                ),

                length: 6,

                animationType: AnimationType.fade,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (v) {
                  // if (v!.length < 3) {
                  //   // return "I'm from validator";
                  // } else {
                  //   return null;
                  // }
                },

                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 56,
                  fieldWidth: 46,
                  activeFillColor: widget.bgColor,
                  selectedFillColor: widget.bgColor,
                  inactiveFillColor: widget.bgColor,
                  activeColor: widget.borderColor,
                  inactiveColor: widget.borderColor,
                  selectedColor: widget.borderColor,

                ),
                hintCharacter: '-',
                cursorColor: widget.textColor,
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                errorAnimationController: errorController,
                controller: textEditingController,
                keyboardType: TextInputType.number,
                onCompleted: (v) {
                  print("Completed");
                },
                // onTap: () {
                //   print("Pressed");
                // },

                onChanged: (value) async {
                  print(value);
                  setState(() {
                    currentText = value;
                  });
                  if (currentText == widget.correctOtp) {
                    widget.load();

                    // Navigator.pushNamed(context, SelectUserTypeScreen.id);
                  } else if (currentText.length == 6) {
                    currentText = '';
                    textEditingController.clear();
                    widget.wrongOtp();
                    setState(() {});
                    showSnackbar(context, MyErrorConstants.wrongOtp);
                  }
                  setState(() {});
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            hasError ? "*Please fill up all the cells properly" : "",
            style: TextStyle(
                color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
