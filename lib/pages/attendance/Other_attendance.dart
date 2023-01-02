import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/sized_box.dart';

import '../../constants/colors.dart';
import '../../functions/navigation_functions.dart';
import '../../services/api_urls.dart';
import '../../services/webservices.dart';
import '../../widgets/buttons.dart';
import '../../widgets/customtextfield.dart';
import '../../widgets/showSnackbar.dart';
import 'newfacedetect.dart';
class OtherAttendancePage extends StatefulWidget {
  const OtherAttendancePage({Key? key}) : super(key: key);

  @override
  State<OtherAttendancePage> createState() => _OtherAttendancePageState();
}

class _OtherAttendancePageState extends State<OtherAttendancePage> {
  TextEditingController phone=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Choose Your Option',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700),),
        backgroundColor: MyColors.primaryColor,
        leading: GestureDetector(
            onTap: (){
            Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vSizedBox2,
            Text('Enter Employee Mobile Number',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xff4B5563)),textAlign: TextAlign.start,),
            vSizedBox,
            CustomTextField(controller: phone, hintText: '',keyboardtype: TextInputType.number,),
            vSizedBox4,
            RoundEdgedButton(text: 'SUBMIT',fontSize: 16,
            onTap: ()async{
    print('get otp --------------------');
    String phonePattern =
    r'^(\+?\d{1,4}[\s-])?(?!0+\s+,?$)\d{10}\s*,?$';
    RegExp pnumber = new RegExp(phonePattern);
    if (phone.text == '') {
    // globalModal.loadingHide();

    showSnackbar(

    context, 'Please Enter your phone Number.');
    } else if (!pnumber.hasMatch(phone.text)) {
    showSnackbar(context,
    'Please Enter your valid phone Number.');
    // globalModal.loadingHide();

    }
    else{
    Map<String,dynamic>data={
    'phone':phone.text
    };
    // Provider.of<GlobalModal>(context, listen: false).loadingShow();


    var res = await Webservices.postData(
    apiUrl: ApiUrls.otherAttendance,
    body: data,
    context: context,
    showSuccessMessage: true);
    print('data for phone------------$res');
    // Provider.of<GlobalModal>(context, listen: false).loadingHide();
    // globalModal.loadingHide();
    if(res['success'].toString()=='true'){
      push(context: context, screen: FaceCameraAttendance());

    }

            }})
          ],
        ),
      ),
    );
  }
}
