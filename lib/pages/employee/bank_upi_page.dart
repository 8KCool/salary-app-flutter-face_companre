import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/customLoader.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';
import 'package:salaryredesign/widgets/dropdown.dart';
import 'package:salaryredesign/widgets/showSnackbar.dart';

import '../../constants/image_urls.dart';
import '../../constants/sized_box.dart';
import '../../providers/clock.dart';
import '../../services/api_urls.dart';
import '../../services/webservices.dart';
import '../../widgets/avatar.dart';
import 'dart:convert' as convert;
class Bank_UPI_Page extends StatefulWidget {
  const Bank_UPI_Page({Key? key}) : super(key: key);

  @override
  State<Bank_UPI_Page> createState() => _Bank_UPI_PageState();
}
bool bank = true;
bool load = false;
bool upi = false;


class _Bank_UPI_PageState extends State<Bank_UPI_Page> {

  TextEditingController ac_name = TextEditingController();
  TextEditingController ac_number = TextEditingController();
  TextEditingController confrim_ac_number = TextEditingController();
  TextEditingController IFSC = TextEditingController();
  TextEditingController upiId = TextEditingController();
  getBankDetail()async{
    setState(() {
      load=true;
    });
    // Provider.of<GlobalModal>(context, listen: false).loadingShow();
    var res = await Webservices.getData(ApiUrls.getbankdetail,context);
    log('res from new api -----------$res');
    var jsonResponse = convert.jsonDecode(res.body);
    log('res from new api -------525----$jsonResponse');
    setState(() {
      load=false;
    });
   if(jsonResponse['success'].toString()=='true' && jsonResponse['data'].toString()!=''){
     ac_name.text=jsonResponse['data']['account_name'].toString()=='null'?'':jsonResponse['data']['account_name'].toString();
     ac_number.text=jsonResponse['data']['account_number'].toString()=='null'?'':jsonResponse['data']['account_number'].toString();
     IFSC.text=jsonResponse['data']['ifsc_code'].toString()=='null'?'':jsonResponse['data']['ifsc_code'].toString();
     upiId.text=jsonResponse['data']['upi_id'].toString()=='null'?'':jsonResponse['data']['upi_id'].toString();
     confrim_ac_number.text=jsonResponse['data']['account_number'].toString()=='null'?'':jsonResponse['data']['account_number'].toString();
   }
   setState(() {

   });
    // Provider.of<GlobalModal>(context, listen: false).loadingHide();
    // print('data from bank ------------${jsonResponse['status']}');

  }
  @override
  void initState() {
    // TODO: implement initState
    getBankDetail();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Bank / UPI') ,
      body: load?CustomLoader():SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            vSizedBox,
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 11),
              height: MediaQuery.of(context).size.height - 120,
              decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(4)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: MyColors.primaryColor,

                          )
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: RoundEdgedButton(
                                text: 'Bank',
                                borderRadius: 0,
                                color: bank?MyColors.primaryColor: MyColors.white,
                                textColor: bank?MyColors.white: MyColors.black,
                                onTap: (){
                                  setState((){
                                    bank = true;
                                    upi = false;
                                  });
                                },
                              )
                          ),
                          Expanded(
                              child: RoundEdgedButton(
                                text: 'UPI ID',
                                borderRadius: 0,
                                color: upi? MyColors.primaryColor: MyColors.white,
                                textColor: upi? MyColors.white: MyColors.black,
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
                      children: [
                        vSizedBox2,
                        CustomTextField(controller: ac_name, hintText: '',
                          label: 'Account Name',
                          showlabel: true,
                          labelcolor: MyColors.black,
                        ),
                        vSizedBox2,
                        CustomTextField(controller: ac_number, hintText: '',
                          label: 'Account Number',
                          showlabel: true,
                          labelcolor: MyColors.black,
                          keyboardtype: TextInputType.number,
                          // obscureText: true,
                        ),
                        vSizedBox2,
                        CustomTextField(controller: confrim_ac_number, hintText: '',
                          label: 'Confirm Account Number',
                          showlabel: true,
                          labelcolor: MyColors.black,
                          keyboardtype: TextInputType.number,
                          // obscureText: true,


                        ),
                        vSizedBox2,
                        CustomTextField(controller: IFSC, hintText: '',
                          label: 'IFSC Code',
                          showlabel: true,
                          labelcolor: MyColors.black,
                        ),
                        vSizedBox2,
                        RoundEdgedButton(
                          text: 'Save',
                          onTap: ()async{
                            if(ac_name.text==''){
                              showSnackbar(context, 'Please enter account name.');
                            }else if(ac_number.text==''){
                              showSnackbar(context, 'Please enter account number.');
                            }else if(confrim_ac_number.text==''){
                              showSnackbar(context, 'Please enter confirm account number.');
                            }else if(IFSC.text==''){
                              showSnackbar(context, 'Please enter IFSC');
                            }else if(ac_number.text!=confrim_ac_number.text){
                              showSnackbar(context, 'Account number should be same as Confirm account number.');
                            }
                            else{
                              Map<String,dynamic>data={
                                'account_name':ac_name.text,
                                'account_number':ac_number.text,
                                'ifsc_code':IFSC.text
                              };
                              print('data for save bank detail -$data');
                              setState(() {
                                load=true;
                              });
                              var res = await Webservices.postData(apiUrl: ApiUrls.getbankdetailstore, body: data, context: context);
                        setState(() {
                          load=false;
                        });
                              showSnackbar(context, res['message']);
                              // Navigator.pop(context);
                            }

                          },
                        ),
                        vSizedBox4,
                      ],
                    ),
                  if(upi)
                    Column(
                      children: [
                        vSizedBox2,
                        CustomTextField(controller: upiId, hintText: '',
                          label: 'UPI ID',
                          showlabel: true,
                          labelcolor: MyColors.black,
                        ),
                        vSizedBox2,
                        RoundEdgedButton(
                          text: 'Save',
                          onTap: ()async{
                            if(upiId.text==''){
                              showSnackbar(context, 'Please enter UPI Id');
                            }
                            else{
                              Map<String,dynamic>data={
                                'upi':upiId.text,
                              };
                              // globalModal.loadingShow();
                              setState(() {
                                load=true;
                              });
                              var res = await Webservices.postData(apiUrl: ApiUrls.getupistore, body: data, context: context);
                              // globalModal.loadingHide();
                              setState(() {
                                load=false;
                              });
                              showSnackbar(context, res['message']);
                              // Navigator.pop(context);
                            }
                          },
                        ),
                        vSizedBox4,
                      ],
                    ),

                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
