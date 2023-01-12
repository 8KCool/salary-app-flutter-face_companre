  import 'dart:developer';
import 'dart:convert' as convert;
import 'dart:io';
import 'package:intl/intl.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';
import 'package:salaryredesign/widgets/dropdown.dart';
import 'package:salaryredesign/widgets/showSnackbar.dart';

import '../../constants/image_urls.dart';
import '../../constants/sized_box.dart';
import '../../providers/clock.dart';
import '../../services/api_urls.dart';
import '../../services/webservices.dart';
import '../../widgets/CustomCircularImage.dart';
import '../../widgets/CustomLoader.dart';
import '../../widgets/avatar.dart';
import '../../widgets/image_picker.dart';
import '../../widgets/newdropdown.dart';

class Personal_details_Page extends StatefulWidget {
  const Personal_details_Page({Key? key}) : super(key: key);

  @override
  State<Personal_details_Page> createState() => _Personal_details_PageState();
}

class _Personal_details_PageState extends State<Personal_details_Page> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController gender1 = TextEditingController();
  TextEditingController aadhaar_number = TextEditingController();
  TextEditingController pan_number = TextEditingController();
  TextEditingController uan = TextEditingController();
  TextEditingController pfnumber = TextEditingController();
  TextEditingController esinumber = TextEditingController();
  TextEditingController co_name = TextEditingController();
  TextEditingController employee_no = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController billingName = TextEditingController();
  TextEditingController billingEmail = TextEditingController();
  TextEditingController billingPhone = TextEditingController();
  TextEditingController AdminName = TextEditingController();
  TextEditingController AdminEmail = TextEditingController();
  TextEditingController AdminPhone = TextEditingController();
  TextEditingController TechName = TextEditingController();
  TextEditingController TechEmail = TextEditingController();
  TextEditingController TechPhone = TextEditingController();

  File? image;
  String? image1;
  List stateList = [];
  DateTime? dateTime;
  bool isCompany = false;
  bool? check2 = false;
  bool load = false;
  getProfileData() async {
    setState(() {
      load=true;
    });
    // log("user detail -------------${Provider.of<GlobalModal>(context, listen: false).userData!.companyName}");
    // Provider.of<GlobalModal>(context, listen: false).loadingShow();
    var res = await Webservices.getData(ApiUrls.getNewProfileData, context);
    log('res from new api -----------$res');
    var jsonResponse = convert.jsonDecode(res.body);
    log('res from new api -----------$jsonResponse');
    // dashBoardData=jsonResponse['data'];
    if (jsonResponse['data']['client_emp'] == null) {
      isCompany = true;
      co_name.text = jsonResponse['data']['company_name'] ?? '';
      city.text = jsonResponse['data']['city'] ?? '';
      country.text = jsonResponse['data']['country'] ?? '';
      pincode.text = jsonResponse['data']['oc_pincode'] ?? '';
      employee_no.text = jsonResponse['data']['total_employees'].toString();
      address.text = jsonResponse['data']['street_address'] ?? '';
      check2 = jsonResponse['data']['street_address'].toString() == '0'
          ? false
          : true;
      if (jsonResponse['data']['street_address'].toString() != '0') {
        AdminName.text = jsonResponse['data']['ac_name'] ?? '';
        AdminEmail.text = jsonResponse['data']['ac_email'] ?? '';
        AdminPhone.text = jsonResponse['data']['ac_mobile'] ?? '';
        billingName.text = jsonResponse['data']['bc_name'] ?? '';
        billingEmail.text = jsonResponse['data']['bc_email'] ?? '';
        billingPhone.text = jsonResponse['data']['bc_mobile'] ?? '';
        TechName.text = jsonResponse['data']['tc_name'] ?? '';
        TechEmail.text = jsonResponse['data']['tc_email'] ?? '';
        TechPhone.text = jsonResponse['data']['tc_mobile'] ?? '';
      }
    }
    if (!isCompany) {
      address.text = jsonResponse['data']['postal_address']??'';
      dob.text = jsonResponse['data']['dob']??'';
      aadhaar_number.text = jsonResponse['data']['aadhaar_number']??'';
      pan_number.text = jsonResponse['data']['pan_number']??'';
      uan.text = jsonResponse['data']['uan']??'';
      pfnumber.text = jsonResponse['data']['pfnumber']??'';
      esinumber.text = jsonResponse['data']['esinumber']??"";
      gender1.text = jsonResponse['data']['gender'].toString();
      gender.text =
          jsonResponse['data']['gender'].toString() == '1' ? 'Male' : 'Female';
    }
    print('    isCompany           $isCompany');
    name.text = jsonResponse['data']['name'];
    phone.text = jsonResponse['data']['phone_number'];
    email.text = jsonResponse['data']['email'];
    phone.text = jsonResponse['data']['phone_number'];
    phone.text = jsonResponse['data']['phone_number'];
    image1 = jsonResponse['data']['profileImage'].toString();
    stateList = jsonResponse['state'];

    // gender1.text=jsonResponse['gender'];
    state.text = jsonResponse['data']['state'].toString() == '0' ||
            jsonResponse['data']['state'].toString() == 'null'
        ? ''
        : jsonResponse['data']['state'].toString();
    print('state.text-------------${state.text}');
    // Provider.of<GlobalModal>(context, listen: false).loadingHide();


    setState(() {
      load=false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Personal Details'),
      body: load?CustomLoader()
          : SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: MyColors.primaryColor,
              child: GestureDetector(
                onTap: () {
                  _showImage_popup(context);
                },
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: Colors.white, width: 2.5)),
                          child:
                          CustomCircularImage(
                            imageUrl: image1??'${ApiUrls.baseUrl}public/assets/company_logo/No_Image_Available.jpg',
                            image: image,
                            height: 95,
                            fileType: image == null
                                ? CustomFileType.network
                                : CustomFileType.file,
                            width: 95,
                          ),
                        ),
                        Positioned(
                            bottom: 10,
                            right: 0,
                            child: Image.asset(
                              MyImages.camera_white,
                              height: 30,
                            ))
                      ],
                    ),
                    vSizedBox4,
                  ],
                ),
              ),
            ),
            vSizedBox4,
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 11),
              decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(4)),
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vSizedBox4,
                  MainHeadingText(text: 'Personal Detail'),
                  vSizedBox4,
                  CustomTextField(
                    controller: name,
                    hintText: '',
                    label: 'Name',
                    showlabel: true,
                  ),
                  vSizedBox2,
                  if (isCompany)
                    CustomTextField(
                      controller: co_name,
                      hintText: '',
                      label: 'Company Name',
                      showlabel: true,
                    ),
                  if (isCompany) vSizedBox2,
                  CustomTextField(
                    controller: phone,
                    hintText: '',
                    label: 'Phone Number',
                    showlabel: true,
                    keyboardtype: TextInputType.number,
                    enable: false,
                  ),
                  vSizedBox2,
                  CustomTextField(
                    controller: email,
                    hintText: '',
                    label: 'Email Id',
                    showlabel: true,
                  ),
                  vSizedBox2,
                  CustomTextField(
                    controller: address,
                    hintText: '',
                    label: 'Postal Address',
                    showlabel: true,
                  ),
                  // vSizedBox2,
                  DropDwonNew(
                    islabel: true,
                    label: 'Select State',
                    hintlabel: 'Select State',
                    selectedValue: state.text == '' ? null : state.text,
                    items: stateList.map((e) {
                      return DropdownMenuItem<String>(
                        value: e['id'].toString(),
                        child: Text(e['name'].toString()),
                      );
                    }).toList(),
                    onChange: (String? value) {
                      if (value != null) {
                        print('value' + value);
                        state.text = value.toString();
                      }
                      setState(() {});
                    },
                  ),
                  // vSizedBox2,
                  if (isCompany)
                    Column(
                      children: [
                        vSizedBox2,
                        CustomTextField(
                          controller: city,
                          hintText: '',
                          label: 'City',
                          showlabel: true,
                        ),
                        vSizedBox2,
                        CustomTextField(
                          controller: pincode,
                          hintText: '',
                          label: 'Pin Code',
                          showlabel: true,
                        ),
                        vSizedBox2,
                        CustomTextField(
                          controller: country,
                          hintText: '',
                          label: 'Country',
                          showlabel: true,
                        ),
                        vSizedBox2,
                        CustomTextField(
                          controller: employee_no,
                          hintText: '',
                          label: 'No. Of Employees',
                          showlabel: true,
                          keyboardtype: TextInputType.number,
                        ),
                        vSizedBox2,
                        CheckboxListTile(
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 0),
                          controlAffinity: ListTileControlAffinity
                              .leading, //checkbox positioned at right
                          value: check2,
                          onChanged: (bool? value) {
                            setState(() {
                              check2 = value;
                            });
                          },
                          title: Text(
                              "If enable different Administrative Contact, Billing Contact, Technical Contact"),
                        ),
                        vSizedBox2,
                        if (check2!)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              MainHeadingText(
                                  text: 'Administrative Contact'),
                              vSizedBox4,
                              CustomTextField(
                                controller: AdminName,
                                hintText: '',
                                label: 'Name',
                                showlabel: true,
                              ),
                              vSizedBox2,
                              CustomTextField(
                                controller: AdminEmail,
                                hintText: '',
                                label: 'Email Id',
                                showlabel: true,
                              ),
                              vSizedBox2,
                              CustomTextField(
                                controller: AdminPhone,
                                hintText: '',
                                label: 'Phone Number',
                                showlabel: true,
                                keyboardtype: TextInputType.number,

                              ),
                              vSizedBox2,
                              MainHeadingText(text: 'Billing Contact'),
                              vSizedBox4,
                              CustomTextField(
                                controller: billingName,
                                hintText: '',
                                label: 'Name',
                                showlabel: true,
                              ),
                              vSizedBox2,
                              CustomTextField(
                                controller: billingEmail,
                                hintText: '',
                                label: 'Email Id',
                                showlabel: true,
                              ),
                              vSizedBox2,
                              CustomTextField(
                                controller: billingPhone,
                                hintText: '',
                                label: 'Phone Number',
                                showlabel: true,
                                keyboardtype: TextInputType.number,

                              ),
                              vSizedBox2,
                              MainHeadingText(
                                  text: 'Technical Contact'),
                              vSizedBox4,
                              CustomTextField(
                                controller: TechName,
                                hintText: '',
                                label: 'Name',
                                showlabel: true,
                              ),
                              vSizedBox2,
                              CustomTextField(
                                controller: TechEmail,
                                hintText: '',
                                label: 'Email Id',
                                showlabel: true,
                              ),
                              vSizedBox2,
                              CustomTextField(
                                controller: TechPhone,
                                hintText: '',
                                label: 'Phone Number',
                                showlabel: true,
                                keyboardtype: TextInputType.number,

                              ),
                              vSizedBox2,
                            ],
                          )
                      ],
                    ),
                  if (!isCompany) vSizedBox2,
                  if (!isCompany)
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            DateTime? temp = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1977),
                                lastDate: DateTime(2099));
                            // showTimePicker(context: context, initialTime: initialTime)
                            if (temp != null) {
                              dateTime = temp;
                              dob.text = DateFormat("yyyy-MM-dd")
                                  .format(dateTime!)
                                  .toString();
                            }
                            setState(() {});
                          },
                          child: CustomTextField(
                            controller: dob,
                            hintText: '',
                            label: 'Date of birth',
                            showlabel: true,
                            enable: false,
                          ),
                        ),
                        DropDwon(
                          label: 'Gender',
                          value: gender.text.toString() != ''
                              ? gender.text.toString()
                              : null,
                          items: ['Male', 'Female'],
                          onChange: (value) {
                            print(
                                'value-----------for gender ------------$value');
                            if (value != null) {
                              gender.text = value;
                              if (value == 'Male') {
                                gender1.text = '1';
                              } else {
                                gender1.text = '2';
                              }
                              setState(() {});
                            }
                          },
                        ),
                        vSizedBox2,
                        CustomTextField(
                            controller: aadhaar_number,
                            hintText: '',
                            label: 'Aadhaar Number',
                            showlabel: true,
                            keyboardtype: TextInputType.number),
                        vSizedBox2,
                        CustomTextField(
                          controller: pan_number, hintText: '',
                          label: 'PAN Number',
                          showlabel: true,
                          // keyboardtype:TextInputType.number
                        ),
                        vSizedBox2,
                        CustomTextField(
                          controller: uan, hintText: '',
                          label: 'UAN Number',
                          showlabel: true,
                          // keyboardtype:TextInputType.number
                        ),
                        vSizedBox2,
                        CustomTextField(
                          controller: pfnumber, hintText: '',
                          label: 'PF Number',
                          showlabel: true,
                          // keyboardtype:TextInputType.number
                        ),
                        vSizedBox2,
                        CustomTextField(
                          controller: esinumber,
                          hintText: '',
                          label: 'ESI Number',
                          showlabel: true,
                        ),
                        vSizedBox2,
                      ],
                    ),

                  RoundEdgedButton(
                      text: 'Save',
                      onTap: () async {
                        String pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regex = new RegExp(pattern);
                        String phonePattern =
                            r'^(\+?\d{1,4}[\s-])?(?!0+\s+,?$)\d{10}\s*,?$';
                        RegExp pnumber = new RegExp(phonePattern);

                        if (name.text == '') {
                          showSnackbar(
                              context, 'Please enter your name');
                        } else if (phone.text == '') {
                          showSnackbar(context,
                              'Please enter your Phone Number');
                        } else if (!pnumber.hasMatch(phone.text)) {
                          showSnackbar(context,
                              'Please enter valid Phone Number');
                        } else if (email.text == '') {
                          showSnackbar(
                              context, 'Please Enter your Email.');
                        } else if (!regex.hasMatch(email.text)) {
                          showSnackbar(context,
                              'Please Enter your valid email.');
                        }

                        else if (co_name.text == '' && isCompany) {
                          showSnackbar(
                              context, 'Please enter company name.');
                        } else if (city.text == '' && isCompany ) {
                          showSnackbar(
                              context, 'Please enter city name.');
                        } else if (pincode.text == '' && isCompany) {
                          showSnackbar(
                              context, 'Please enter pin code.');
                        } else if (country.text == '' && isCompany) {
                          showSnackbar(
                              context, 'Please enter country name.');
                        } else if (employee_no.text == '' && isCompany) {
                          showSnackbar(context,
                              'Please enter number of employee.');
                        }

                        if (AdminName.text == '' && check2!) {
                          showSnackbar(context,
                              'Please enter your administrative contact name');
                        } else if (AdminEmail.text == '' && check2!) {
                          showSnackbar(context,
                              'Please Enter your administrative contact Email.');
                        } else if (check2! && !regex
                            .hasMatch(AdminEmail.text)) {
                          showSnackbar(context,
                              'Please Enter your administrative contact valid email.');
                        } else if (AdminPhone.text == '' && check2!) {
                          showSnackbar(context,
                              'Please enter your administrative contact  Phone Number');
                        } else if ( check2! &&!pnumber
                            .hasMatch(AdminPhone.text)) {
                          showSnackbar(context,
                              'Please enter valid administrative contact  Phone Number');
                        }
                        else if (billingName.text == '' && check2!) {
                          showSnackbar(context,
                              'Please enter your billing contact name');
                        } else if (billingEmail.text == '' && check2!) {
                          showSnackbar(context,
                              'Please Enter your billing contact Email.');
                        } else if (check2! && !regex
                            .hasMatch(billingEmail.text)) {
                          showSnackbar(context,
                              'Please Enter your billing contact valid email.');
                        } else if (billingPhone.text == '' && check2!) {
                          showSnackbar(context,
                              'Please enter your billing contact  Phone Number');
                        } else if (check2! && !pnumber
                            .hasMatch(billingPhone.text)) {
                          showSnackbar(context,
                              'Please enter valid billing contact  Phone Number');
                        } else if (TechName.text == '' && check2!) {
                          showSnackbar(context,
                              'Please enter your Technical contact name');
                        } else if (TechEmail.text == '' && check2!) {
                          showSnackbar(context,
                              'Please Enter your Technical contact Email.');
                        } else if (check2! && !regex
                            .hasMatch(TechEmail.text)) {
                          showSnackbar(context,
                              'Please Enter your Technical contact valid email.');
                        } else if (TechPhone.text == '' && check2!) {
                          showSnackbar(context,
                              'Please enter your Technical contact  Phone Number');
                        } else if (check2! && !pnumber
                            .hasMatch(TechPhone.text)) {
                          showSnackbar(context,
                              'Please enter valid Technical contact  Phone Number');
                        }



                        // }

                        else {
                          Map<String, dynamic> data = {
                            'name': name.text,
                            'mobile': phone.text,
                            'email': email.text,
                            'oc_address': address.text,
                            'state': state.text,
                            'dob': dob.text,
                            'gender':gender1.text??'',
                            'aadhar_number': aadhaar_number.text,
                            'pan_number': pan_number.text,
                            'uan_number': uan.text,
                            'pf_number': pfnumber.text,
                            'esi_number': esinumber.text,
                            'oc_sameas_ac': check2 == true
                                ? '1'
                                : '0'
                          };

                          log("data for api -----------$data");
                          Map<String, dynamic> files = {};
                          if (image != null) {
                            files['avatar'] = image;
                          }
                          if (isCompany) {
                            data['oc_company_name'] = co_name.text;
                            data['oc_city'] = city.text;
                            data['oc_country'] = country.text;
                            data['oc_pincode'] = pincode.text;
                            data['oc_state'] = state.text;
                            data['oc_total_employees'] =
                                employee_no.text;
                            if (check2!) {
                              data['ac_name'] = AdminName.text;
                              data['ac_email'] = AdminEmail.text;
                              data['ac_mobile'] = AdminPhone.text;
                              data['bc_name'] = billingName.text;
                              data['bc_email'] = billingEmail.text;
                              data['bc_mobile'] = billingPhone.text;
                              data['tc_name'] = TechName.text;
                              data['tc_email'] = TechEmail.text;
                              data['tc_mobile'] = TechPhone.text;
                            }
                          }
                          print('files-------$files');
                        setState(() {
                          load=true;
                        });
                          var res = await Webservices
                              .postDataWithImageFunction(
                              apiUrl: ApiUrls.getprofiledetailstore,
                              body: data,
                              context: context,
                              files: files);
                          log('message---------------$res');
                          setState(() {
                            load=false;
                          });
                          if (res['success'].toString() == 'true') {
                            // showSnackbar(context, res['message']);

                            Map<String, dynamic>data = {
                              'phone': phone.text
                            };
                            print('phone---------${data}');

                            var res1 = await Webservices.postData(
                                apiUrl: ApiUrls.loginPost,
                                body: data,
                                context: context,
                                showSuccessMessage: true);

                            print('res-------loginPost---------${res1}');

                            if (res['success'].toString() == 'true') {
                              print("success -------");
                              await Provider.of<GlobalModal>(context, listen: false).addUserDetail(res1['userData'],context);
                              // Navigator.pop(context);
                            }
                          }
                        }
                      }),
                  vSizedBox4,
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  void _showImage_popup(
    BuildContext ctx,
  ) {
    showCupertinoModalPopup(
      // barrierColor: Colors.white,
        context: ctx,
        builder: (_) => CupertinoActionSheet(

              actions: [

                Container(
                  color: Colors.white,
                  child: CupertinoActionSheetAction(
                      onPressed: () async {
                        File? imageG;
                        imageG = await pickImage(true);
                        print('image----$imageG');
                        ;
                        if (imageG != null) {
                          // pro_image='';
                          image = imageG;
                          setState(() {});
                        }
                        _close(ctx);
                      },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Icon(Icons.image_outlined),
                        hSizedBox2,
                        Text('Choose Photo From Gallery', style: TextStyle(fontSize: 16,color: Colors.black),)
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: CupertinoActionSheetAction(
                    onPressed: () async {
                      File? imageG;
                      imageG = await pickImage(false);
                      print('image----$imageG');
                      if (imageG != null) {
                        // pro_image='';
                        image = imageG;
                        setState(() {});
                      }
                      _close(ctx);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Icon(Icons.camera_alt_outlined),
                        hSizedBox2,
                        Text('Click a Photo', style: TextStyle(fontSize: 16,color: Colors.black),)
                      ],
                    ),
                    // child: const Text('Take Camera')
                  ),
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                onPressed: () => _close(ctx),
                child: const Text('Cancel',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16),),
              ),
            ));
  }

  void _close(BuildContext ctx) {
    Navigator.of(ctx).pop();
  }
}
