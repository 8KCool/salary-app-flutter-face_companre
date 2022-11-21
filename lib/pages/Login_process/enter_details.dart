import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/Login_process/congratulations.dart';
import 'package:salaryredesign/pages/Login_process/enter_OTP.dart';
import 'package:salaryredesign/providers/clock.dart';
import 'package:salaryredesign/services/api_urls.dart';
import 'package:salaryredesign/services/webservices.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:salaryredesign/widgets/showSnackbar.dart';

import '../../constants/globalkeys.dart';
import '../../constants/image_urls.dart';
import '../../services/local_services.dart';
import '../../widgets/CustomTexts.dart';


enum SingingCharacter { one, two, three, four }
class Enter_Detail_Page extends StatefulWidget {
  final String phone;
  Enter_Detail_Page({Key? key,required this.phone}) : super(key: key);

  @override
  State<Enter_Detail_Page> createState() => _Enter_Detail_PageState();
}

class _Enter_Detail_PageState extends State<Enter_Detail_Page> {
  SingingCharacter? _character = SingingCharacter.one;
  String dropvalue='0 - 10';
  TextEditingController mobilenumber = TextEditingController();
  TextEditingController oc_company_name = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController numberofstaff = TextEditingController();

  // mobile:8357865101,
  // oc_company_name:the demo company,
  // name:Anish shrivastava,
  // email:anish885dd469@gmail.com,
  // numberofstaff:10
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   height: MediaQuery.of(context).size.height,
            // ),
            Container(
              color: MyColors.primaryColor,
              width: MediaQuery.of(context).size.width,
              height: 190,
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
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      hSizedBox2,
                      MainHeadingText(
                        text: 'Enter Details',
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'bold',
                        height: 1.5,
                      ),
                    ],
                  ),
                  // vSizedBox16,
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  //   child: ParagraphText(
                  //     text: 'You will receive a 6 digit code for phone number\nverification',
                  //     color: Colors.white,
                  //     fontSize: 16,
                  //     height: 1.5,
                  //   ),
                  // ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    vSizedBox16,
                    vSizedBox16,
                    CustomTextField(
                      controller: oc_company_name,
                      hintText: 'Placeholder',
                      fontsize: 14,
                      label: 'Company Name',
                      showlabel: true,
                      labelcolor: MyColors.labelcolor,
                      bordercolor: MyColors.labelcolor,
                      hintcolor: MyColors.labelcolor,
                    ),
                    vSizedBox2,
                    CustomTextField(
                      controller: name,
                      hintText: 'Placeholder',
                      fontsize: 14,
                      label: 'Owner / Admin Name',
                      showlabel: true,
                      labelcolor: MyColors.labelcolor,
                      bordercolor: MyColors.labelcolor,
                      hintcolor: MyColors.labelcolor,
                    ),
                    vSizedBox2,
                    CustomTextField(
                      controller: email,
                      hintText: 'Placeholder',
                      fontsize: 14,
                      label: 'Email Address',
                      showlabel: true,
                      labelcolor: MyColors.labelcolor,
                      bordercolor: MyColors.labelcolor,
                      hintcolor: MyColors.labelcolor,
                    ),
                    vSizedBox2,
                    ParagraphText(
                      text: 'Select Employee Count',
                      fontSize: 14,
                      color: MyColors.bordercolor,
                    ),
                    SizedBox(height: 7),
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 52,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: MyColors.labelcolor)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: ParagraphText(
                                text: dropvalue,
                                fontSize: 14,
                                color: MyColors.bordercolor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Image.asset(
                                MyImages.down_arrow,
                                height: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        showModalBottomSheet<void>(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                                builder: (BuildContext context, StateSetter setState) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        )
                                    ),
                                    height: 400,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        vSizedBox4,
                                        MainHeadingText(
                                          text: 'Enter Employee Count',
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontFamily: 'bold',
                                        ),
                                        vSizedBox2,
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Theme(
                                              data:  Theme.of(context).copyWith(
                                                  unselectedWidgetColor: MyColors.primaryColor,
                                                  backgroundColor: Colors.white
                                              ),
                                              child: Radio<SingingCharacter>(
                                                value: SingingCharacter.one,
                                                activeColor: MyColors.primaryColor,
                                                groupValue: _character,
                                                onChanged: (SingingCharacter? value) {
                                                  setState(() {
                                                    _character = value;
                                                    dropvalue='0 - 10';
                                                    numberofstaff.text='10';
                                                    _character = SingingCharacter.one;
                                                  });
                                                  this.setState((){});
                                                },
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                hSizedBox,
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    ParagraphText(
                                                      text: '0 - 10',
                                                      fontSize: 16,
                                                      fontFamily: 'bold',
                                                      color: Colors.black,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),


                                          ],
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Theme(
                                              data:  Theme.of(context).copyWith(
                                                  unselectedWidgetColor: MyColors.primaryColor,
                                                  backgroundColor: Colors.white
                                              ),
                                              child: Radio<SingingCharacter>(
                                                value: SingingCharacter.two,
                                                activeColor: MyColors.primaryColor,
                                                groupValue: _character,
                                                onChanged: (SingingCharacter? value) {
                                                  setState(() {
                                                    _character = value;
                                                    dropvalue='11 - 20';
                                                    numberofstaff.text='20';
                                                    _character = SingingCharacter.two;
                                                    print(_character);
                                                  });
                                                  this.setState((){});
                                                },
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                hSizedBox,
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    ParagraphText(
                                                      text: '11 - 20',
                                                      fontSize: 16,
                                                      fontFamily: 'bold',
                                                      color: Colors.black,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),


                                          ],
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Theme(
                                              data:  Theme.of(context).copyWith(
                                                  unselectedWidgetColor: MyColors.primaryColor,
                                                  backgroundColor: Colors.white
                                              ),
                                              child: Radio<SingingCharacter>(
                                                value: SingingCharacter.three,
                                                activeColor: MyColors.primaryColor,
                                                groupValue: _character,
                                                onChanged: (SingingCharacter? value) {
                                                  setState(() {
                                                    _character = value;
                                                    dropvalue='21 - 50';

                                                    numberofstaff.text='50';
                                                  });
                                                },
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                hSizedBox,
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    ParagraphText(
                                                      text: '21 - 50',
                                                      fontSize: 16,
                                                      fontFamily: 'semibold',
                                                      color: Colors.black,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),


                                          ],
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Theme(
                                              data:  Theme.of(context).copyWith(
                                                  unselectedWidgetColor: MyColors.primaryColor,
                                                  backgroundColor: Colors.white
                                              ),
                                              child: Radio<SingingCharacter>(
                                                value: SingingCharacter.four,
                                                activeColor: MyColors.primaryColor,
                                                groupValue: _character,
                                                onChanged: (SingingCharacter? value) {
                                                  setState(() {
                                                    print(value);
                                                    _character = value;
                                                    dropvalue='50 Above';

                                                    numberofstaff.text='100';
                                                  });
                                                },
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                hSizedBox,
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    ParagraphText(
                                                      text: '50 Above',
                                                      fontSize: 16,
                                                      fontFamily: 'semibold',
                                                      color: Colors.black,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),


                                          ],
                                        ),
                                        vSizedBox2,
                                        RoundEdgedButton(
                                          text: 'Continue',
                                          textColor: Colors.white,
                                          onTap: (){
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                }
                            );
                          },
                        );
                      },
                    ),
                    vSizedBox2,
                    RoundEdgedButton(
                      text: 'Save',
                      textColor: Colors.white,
                      onTap: () async {
                        String pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regex = new RegExp(pattern);
                        if(oc_company_name.text==''){
                          showSnackbar(context, 'Please enter company name');
                        }else if(name.text==''){
                          showSnackbar(context, 'Please enter your name');
                        }else if(email.text==''){
                          showSnackbar(context, 'Please enter your email');
                        }else if (!regex.hasMatch(email.text)) {
                          showSnackbar(
                              context, 'Please Enter your valid email.');
                        }else if(_character==''){
                          showSnackbar(context, 'Please select employee count');

                        }else{
                          Map<String,dynamic>data={
                            'mobile':widget.phone,
                            'oc_company_name':oc_company_name.text,
                            'name':name.text,
                            'email':email.text,
                            'numberofstaff':numberofstaff.text
                          };
                          print('data  for api-${data}');
                          var res=await Webservices.postData(apiUrl: ApiUrls.employerRegistration, body: data, context: context);
                          if(res['success'].toString()=='true'){
                            // print('Emp id--------${res['userData']['client_emp']}');
                            Provider.of<GlobalModal>(context, listen: false).addUserDetail(res['userData'],context);

                            // await MyLocalServices.updateSharedPreferences(res['userData'],context);
                            push(context: context, screen: Congratulations_Page(isEmp: false,));
                            user=res['userData'];
                          }
                          else{
                            showSnackbar(context, res['message']);
                          }

                        }

                      },
                    ),
                    vSizedBox4,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
