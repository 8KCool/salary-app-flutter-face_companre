import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';
class CustomOtpWidget extends StatefulWidget {
  final int otpLength;
  const CustomOtpWidget({Key? key,required this.otpLength}) : super(key: key);

  @override
  State<CustomOtpWidget> createState() => _CustomOtpWidgetState();
}

class _CustomOtpWidgetState extends State<CustomOtpWidget> {
  List<TextEditingController> controllers=[];
  List<FocusNode> focus=[];
  initializeControllers(){
    for(var i=0;i<widget.otpLength;i++){
      controllers.add(TextEditingController());
      focus.add(FocusNode());

    }

  }
  @override
  void initState() {
    // TODO: implement initState
    initializeControllers();
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 7,
        children: [
          for(var i=0;i<widget.otpLength;i++)
            Container(
              width: 50,
              height: 58,
              child: CustomTextField(
              height: 58,
              controller: controllers[i],
              focusnode: focus[i],
              keyboardtype: TextInputType.number,
              hintText: '-',
              borderradius: 10,
              hintcolor: MyColors.headingcolor,
              fontsize: 24,
              maxlength: 1,
              bordercolor: MyColors.bordercolor.withOpacity(0.1),
              onchange: (str){
                print(str);
                // if(otp1.text.length==1){
                //   FocusScope.of(context).requestFocus(otp2focus);
                // }
              },
          ),
            )
        ],

      ),
    );
  }
}
