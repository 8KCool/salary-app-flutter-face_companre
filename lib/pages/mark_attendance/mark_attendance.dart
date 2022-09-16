import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';
import 'package:salaryredesign/widgets/dropdown.dart';
import 'package:salaryredesign/widgets/showSnackbar.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

import '../../constants/globalkeys.dart';
import '../../constants/image_urls.dart';
import '../../constants/sized_box.dart';
import '../../functions/location.dart';
import '../../providers/clock.dart';
import '../../services/api_urls.dart';
import '../../services/webservices.dart';
import '../../widgets/CustomLoader.dart';
import '../../widgets/avatar.dart';
import 'package:intl/intl.dart';

import '../qr_scanner.dart';
import '../tab_pages/new_tab.dart';

class Mark_Attendance_Page extends StatefulWidget {
  const Mark_Attendance_Page({Key? key}) : super(key: key);

  @override
  State<Mark_Attendance_Page> createState() => _Mark_Attendance_PageState();
}

bool attendance = true;
bool breaks = false;

class _Mark_Attendance_PageState extends State<Mark_Attendance_Page> {
  Barcode? result;
  bool is_in = false;
  bool is_scan = false;
  bool is_out = false;
  String lat = '';
  String lng = '';
  String address = '';
  String qrEmployerid = '';
  String qrBranchcode = '';
  String workingHours = '';
  Map att_detail = {};
  bool is_popup=false;
  String message='';

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;


      controller.scannedDataStream.listen((scanData) async {
      // setState(() {
      print('the dataa id foutndddddddd ${scanData.format.name}');
      result = scanData;
      print('result------------${result!.code.toString()}');
      var code = result!.code.toString().split('.com/')[1];
      var emp_code = code.split('/')[1].toString();
      var qr_code = code.split('/')[0].toString();

      print("codeee-----$code");
      print("emp_code-----$emp_code");
      print("qr_code-----$qr_code");
      qrBranchcode = qr_code;
      qrEmployerid = emp_code;
      is_in = true;

      if(att_detail['data']['today_attendance']['inTime'] == null || att_detail['data']['today_attendance']['outTime'] == null){


        // is_scan = false;
        if(is_popup==false){
          is_popup=true;
          await showPop();
          // await push(context: context, screen: newTabsPage());
          is_popup=false;

        }
        // controller.pauseCamera();
      }
      else{
        showSnackbar(context, 'Your already punched');
      }

      // Navigator.pop(context, result);
    });
    // });
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget>[
              // Image.asset(MyImages.cancel,width: 70,height: 70,),
                Icon(Icons.dangerous,color: Colors.red,size: 80,),
                vSizedBox2,
                Text('${message.toString()}',textAlign: TextAlign.center,),
                vSizedBox,

                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    // Navigator.of(context).pop();
                    push(context: context, screen: newTabsPage());
                  },
                ),
              ],
            ),
          ),

        );
      },
    );
  }
  TextEditingController name = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('result   ------$result');
    getDetails();
    location();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    controller?.dispose();
    super.dispose();
  }

  location() async {
    print('drfs-----------');
    Provider.of<GlobalModal>(context, listen: false).getLocation();

  }

  getDetails() async {
    Map<String, dynamic> data = {};
    Provider.of<GlobalModal>(context, listen: false).loadingShow();
    var res = await Webservices.postData(
        apiUrl: ApiUrls.qrattendance, body: data, context: context);
    Provider.of<GlobalModal>(context, listen: false).loadingHide();
    if (res['success'].toString() == 'true') {
      att_detail = res;
      print('res from api ${res}');
      if (res['data']['today_attendance']['inTime'] != null) {
        is_in = true;
      }
      if (res['data']['today_attendance']['inTime'] != null &&
          res['data']['today_attendance']['outTime'] == null) {
        is_out = true;
      }
      if (res['data']['today_attendance']['inTime'] != null &&
          res['data']['today_attendance']['outTime'] != null) {
        print('working hours-----------');



        workingHours = '${res['data']['today_attendance']['workinHours']}';

      }
    }
    else{
      // showSnackbar(context, res['message']);
      message=res['message'];
      _showMyDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar:
          appBar(context: context, title: 'Attendance', implyLeading: false),
      body: Consumer<GlobalModal>(builder: (context, globalModal, child) {
        return globalModal.load
            ? CustomLoader()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Color(0xFFEFEFEF),
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Image.asset(
                                  MyImages.map_green,
                                  height: 35,
                                  width: 35,
                                ),
                                hSizedBox,
                                Expanded(
                                    child: ParagraphText(
                                  text: globalModal.location != null
                                      ? globalModal.location!.addressString
                                      : '',
                                  fontSize: 12,
                                ))
                              ],
                            ),
                          ),
                          hSizedBox2,
                          RoundEdgedButton(
                            text: 'Refresh',
                            minWidth: 80,
                            height: 30,
                            verticalPadding: 0,
                            horizontalPadding: 0,
                            onTap: () {
                              location();
                            },
                            textColor: MyColors.white,
                          )
                        ],
                      ),
                    ),
                    vSizedBox2,
                    if (att_detail['data'] != null)
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // margin: EdgeInsets.symmetric(horizontal: 0),
                        height: MediaQuery.of(context).size.height - 120,
                        decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(4)),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: MyColors.primaryColor,
                                )),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: RoundEdgedButton(
                                      text: 'ATTENDANCE',
                                      borderRadius: 0,
                                      color: attendance
                                          ? MyColors.primaryColor
                                          : MyColors.white,
                                      textColor: attendance
                                          ? MyColors.white
                                          : MyColors.black,
                                      onTap: () {
                                        // setState((){
                                        attendance = true;
                                        breaks = false;
                                        // });
                                      },
                                    )),
                                    Expanded(
                                        child: RoundEdgedButton(
                                      text: 'BREAK',
                                      borderRadius: 0,
                                      color: breaks
                                          ? MyColors.primaryColor
                                          : MyColors.white,
                                      textColor: breaks
                                          ? MyColors.white
                                          : MyColors.black,
                                      onTap: () {
                                        // setState((){
                                        attendance = false;
                                        breaks = true;
                                        // });
                                      },
                                    )),
                                  ],
                                ),
                              ),
                            ),
                            vSizedBox4,
                            if (attendance)
                              Column(
                                children: [
                                  // vSizedBox2,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      DigitalClock(
                                        areaDecoration: BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        hourMinuteDigitTextStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 50,
                                        ),
                                        amPmDigitTextStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        areaWidth: 250,
                                        secondDigitTextStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 50,
                                        ),
                                      ),

                                    ],
                                  ),
                                  // MainHeadingText(text: '08:54:45 AM', fontSize: 32,),
                                  vSizedBox05,
                                  ParagraphText(
                                    text:
                                        '${DateFormat.EEEE().format(DateTime.parse(DateTime.now().toString()))}, ${DateFormat.yMMMd().format(DateTime.parse(DateTime.now().toString()))}',
                                  ),
                                  vSizedBox2,

                                  Container(
                                    width: 180,
                                    // height: 50,
                                    child: Chip_Custom(
                                      text: att_detail['data']
                                                          ['today_attendance']
                                                      ['inTime'] ==
                                                  null &&
                                              att_detail['data']
                                                          ['today_attendance']
                                                      ['outTime'] ==
                                                  null
                                          ? 'Not Punched'
                                          : att_detail['data'][
                                                              'today_attendance']
                                                          ['inTime'] !=
                                                      null &&
                                                  att_detail['data'][
                                                              'today_attendance']
                                                          ['outTime'] ==
                                                      null
                                              ? 'punching'
                                              : 'Punched',
                                      fontsize: 14,

                                      // fontfamily: 'medium',
                                      background: Color(0xFFEFEFEF),
                                      textcolor: MyColors.labelcolor,
                                    ),
                                  ),
                                  vSizedBox4,
                                  GestureDetector(
                                    onTap: () async {

                                      globalModal.loadingShow();
                                      is_scan = true;
                                      globalModal.loadingHide();
                                      Future.delayed(
                                              Duration(milliseconds: 100))
                                          .then((value) {
                                        controller?.resumeCamera();
                                        // setState(() {
                                        // });
                                      });
                                      try {
                                        Future.delayed(Duration(seconds: 2))
                                            .then((value) {
                                          controller?.resumeCamera();
                                          // setState(() {
                                          // });
                                        });
                                      } catch (e) {
                                        print('Error in catch block $e');
                                      } // Barcode? result = await push(context: MyGlobalKeys.navigatorKey.currentContext!, screen: ScanQrToJoinGroupPage());

                                    },
                                    child: Container(
                                      height: 200,
                                      width: 200,
                                      // child: _buildQrView(context),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: Color(0xFFD9D9D9)),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            if (is_scan)
                                              Expanded(
                                                flex: 5,
                                                child: QRView(
                                                  key: qrKey,
                                                  onQRViewCreated:
                                                      _onQRViewCreated,
                                                ),
                                              ),
                                            if (!is_scan)
                                              Container(
                                                height: 200,
                                                width: 200,
                                                // child: _buildQrView(context),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    color: Colors.grey),
                                              ),
                                            // Image.asset('assets/images/QR.png',fit: BoxFit.fitWidth,)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  vSizedBox,
                                  GestureDetector(
                                    onTap: () async {

                                      globalModal.loadingShow();
                                      is_scan = true;
                                      globalModal.loadingHide();
                                      Future.delayed(
                                          Duration(milliseconds: 100))
                                          .then((value) {
                                        controller?.resumeCamera();
                                        // setState(() {
                                        // });
                                      });
                                      try {
                                        Future.delayed(Duration(seconds: 2))
                                            .then((value) {
                                          controller?.resumeCamera();
                                          // setState(() {
                                          // });
                                        });
                                      } catch (e) {
                                        print('Error in catch block $e');
                                      } // Barcode? result = await push(context: MyGlobalKeys.navigatorKey.currentContext!, screen: ScanQrToJoinGroupPage());
                                      // print('result------------${result!.code.toString()}');
                                      // var code = result.code.toString().split('.com/')[1];
                                      // var emp_code=code.split('/')[1].toString();
                                      // var qr_code=code.split('/')[0].toString();
                                      //
                                      // print("codeee-----$code");
                                      // print("emp_code-----$emp_code");
                                      // print("qr_code-----$qr_code");
                                      // qrBranchcode=qr_code;
                                      // qrEmployerid=emp_code;
                                      // is_in=true;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text('Click here to scan QR'),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      globalModal.loadingShow();
                                      is_scan = true;
                                      globalModal.loadingHide();
                                      Future.delayed(
                                          Duration(milliseconds: 100))
                                          .then((value) {
                                        controller?.resumeCamera();
                                        // setState(() {
                                        // });
                                      });
                                      try {
                                        Future.delayed(Duration(seconds: 2))
                                            .then((value) {
                                          controller?.resumeCamera();
                                          // setState(() {
                                          // });
                                        });
                                      } catch (e) {
                                        print('Error in catch block $e');
                                      }
                                    },
                                    child: Image.asset(
                                      MyImages.camera_turn,
                                      height: 24,
                                    ),
                                  ),
                                  vSizedBox4,

                                  Row(
                                    children: [
                                      if (att_detail['data']['today_attendance']
                                                  ['inTime'] ==
                                              null &&
                                          att_detail['data']['today_attendance']
                                                  ['outTime'] ==
                                              null)
                                        Expanded(
                                          child: GestureDetector(

                                            child: RoundEdgedButton(
                                              text: 'PUNCH IN',
                                              onTap: () {
                                                if(result==''){
                                                  showSnackbar(context, 'Scan Qr');
                                                }

                                           if(globalModal.location?.addressString==''){
                                             showSnackbar(context, 'Please wait while we fatching your  location.');
                                             return;
                                           }
                                           else{
                                             globalModal.loadingShow();
                                             is_scan = true;
                                             globalModal.loadingHide();
                                             Future.delayed(
                                                 Duration(milliseconds: 100))
                                                 .then((value) {
                                               controller?.resumeCamera();
                                               // setState(() {
                                               // });
                                             });
                                             try {
                                               Future.delayed(Duration(seconds: 2))
                                                   .then((value) {
                                                 controller?.resumeCamera();
                                                 // setState(() {
                                                 // });
                                               });
                                             } catch (e) {
                                               print('Error in catch block $e');
                                             }
                                           }

                                              },
                                            ),
                                          ),
                                        ),
                                      hSizedBox,
                                      if (att_detail['data']['today_attendance']
                                                  ['inTime'] !=
                                              null &&
                                          att_detail['data']['today_attendance']
                                                  ['outTime'] ==
                                              null)
                                        Expanded(
                                          child: RoundEdgedButton(
                                            text: 'PUNCH OUT',
                                            color: MyColors.disabledcolor,
                                            textColor: MyColors.black,
                                            onTap: () {
                                              if(result==''){
                                                showSnackbar(context, 'Scan Qr');
                                              }

                                              if(globalModal.location?.addressString==''){
                                                showSnackbar(context, 'Please wait while we fatching your  location.');
                                                return;
                                              }
                                              else{
                                                globalModal.loadingShow();
                                                is_scan = true;
                                                globalModal.loadingHide();
                                                Future.delayed(
                                                    Duration(milliseconds: 100))
                                                    .then((value) {
                                                  controller?.resumeCamera();
                                                  // setState(() {
                                                  // });
                                                });
                                                try {
                                                  Future.delayed(Duration(seconds: 2))
                                                      .then((value) {
                                                    controller?.resumeCamera();
                                                    // setState(() {
                                                    // });
                                                  });
                                                } catch (e) {
                                                  print('Error in catch block $e');
                                                }
                                              }


                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                  vSizedBox4,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            MainHeadingText(
                                              text: att_detail['data'][
                                                              'today_attendance']
                                                          ['inTime'] ==
                                                      null
                                                  ? '--:--'
                                                  : '${att_detail['data']['today_attendance']['inTime'].toString()}',
                                              fontSize: 24,
                                              color: MyColors.primaryColor,
                                            ),
                                            GestureDetector(

                                              child: ParagraphText(
                                                text: 'Punch In',
                                                fontFamily: 'bold',
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            MainHeadingText(
                                              text: att_detail['data'][
                                                              'today_attendance']
                                                          ['outTime'] ==
                                                      null
                                                  ? '--:--'
                                                  : '${att_detail['data']['today_attendance']['outTime'].toString()}',
                                              fontSize: 24,
                                              color: MyColors.primaryColor,
                                            ),
                                            GestureDetector(
                                              onTap: () async {

                                                // globalModal.loadingShow();
                                                is_scan = true;
                                                // globalModal.loadingHide();
                                                Future.delayed(
                                                    Duration(milliseconds: 100))
                                                    .then((value) {
                                                  controller?.resumeCamera();
                                                  // setState(() {
                                                  // });
                                                });
                                                try {
                                                  Future.delayed(Duration(seconds: 2))
                                                      .then((value) {
                                                    controller?.resumeCamera();
                                                    // setState(() {
                                                    // });
                                                  });
                                                } catch (e) {
                                                  print('Error in catch block $e');
                                                }
                                              },
                                              child: ParagraphText(
                                                text: 'Punch Out',
                                                fontFamily: 'bold',
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            MainHeadingText(
                                              text: workingHours == ''
                                                  ? '--:--'
                                                  : workingHours,
                                              fontSize: 24,
                                              color: MyColors.primaryColor,
                                            ),
                                            ParagraphText(
                                              text: 'Working Hrs',
                                              fontFamily: 'bold',
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            if (breaks)
                              Column(
                                children: [
                                  // vSizedBox2,
                                  MainHeadingText(
                                    text: '08:54:45 AM',
                                    fontSize: 32,
                                  ),
                                  vSizedBox05,
                                  ParagraphText(
                                    text: 'Monday, Mar 24, 2022',
                                  ),
                                  vSizedBox2,
                                  Container(
                                    width: 102,
                                    child: Chip_Custom(
                                      text: 'Not Punched',
                                      fontsize: 14,
                                      // fontfamily: 'medium',
                                      background: Color(0xFFEFEFEF),
                                      textcolor: MyColors.labelcolor,
                                    ),
                                  ),
                                  vSizedBox4,
                                  Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Color(0xFFD9D9D9)),
                                  ),
                                  vSizedBox,
                                  GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      MyImages.camera_turn,
                                      height: 24,
                                    ),
                                  ),
                                  vSizedBox4,
                                  Row(
                                    children: [
                                      Expanded(
                                        child: RoundEdgedButton(
                                          text: 'BREAK IN',
                                          onTap: () {
                                            showCustomDialogBox(
                                                context: context,
                                                child: Column(
                                                  children: [
                                                    vSizedBox,
                                                    ParagraphText(
                                                      text: 'Are you sure?',
                                                      color: MyColors.black,
                                                      fontFamily: 'bold',
                                                    ),
                                                    vSizedBox,
                                                    CircleAvatarcustom(
                                                      image:
                                                          '${Provider.of<GlobalModal>(context, listen: false).userData!.profile_img}',
                                                    ),
                                                    vSizedBox2,
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          MyImages.time,
                                                          height: 20,
                                                          width: 20,
                                                        ),
                                                        hSizedBox,
                                                        Expanded(
                                                            child:
                                                                ParagraphText(
                                                          text: DateTime.now()
                                                              .toString(),
                                                          fontSize: 16,
                                                          color: MyColors
                                                              .labelcolor,
                                                        ))
                                                      ],
                                                    ),
                                                    vSizedBox,
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          MyImages.map_green,
                                                          height: 24,
                                                          width: 24,
                                                        ),
                                                        hSizedBox,
                                                        Expanded(
                                                            child:
                                                                ParagraphText(
                                                          text:
                                                              '${Provider.of<GlobalModal>(context, listen: false).userData!.address}',
                                                          fontSize: 16,
                                                          color: MyColors
                                                              .labelcolor,
                                                        ))
                                                      ],
                                                    ),
                                                    vSizedBox2,
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              RoundEdgedButton(
                                                            text: 'CANCEL',
                                                            color: MyColors
                                                                .disabledcolor,
                                                            textColor:
                                                                MyColors.black,
                                                            height: 40,
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ),
                                                        hSizedBox,
                                                        Expanded(
                                                          child:
                                                              RoundEdgedButton(
                                                            text: 'BREAK IN',
                                                            height: 40,
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    vSizedBox2,
                                                  ],
                                                ));
                                          },
                                        ),
                                      ),
                                      hSizedBox,
                                      Expanded(
                                        child: RoundEdgedButton(
                                          text: 'BREAK OUT',
                                          color: MyColors.disabledcolor,
                                          textColor: MyColors.black,
                                          onTap: () {
                                            showCustomDialogBox(
                                                context: context,
                                                child: Column(
                                                  children: [
                                                    vSizedBox,
                                                    ParagraphText(
                                                      text: 'Are you sure?',
                                                      color: MyColors.black,
                                                      fontFamily: 'bold',
                                                    ),
                                                    vSizedBox,
                                                    CircleAvatarcustom(
                                                      image:
                                                          '${Provider.of<GlobalModal>(context, listen: false).userData!.profile_img}',
                                                    ),
                                                    vSizedBox2,
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          MyImages.time,
                                                          height: 20,
                                                          width: 20,
                                                        ),
                                                        hSizedBox,
                                                        Expanded(
                                                            child:
                                                                ParagraphText(
                                                          text: DateTime.now()
                                                              .toString(),
                                                          fontSize: 16,
                                                          color: MyColors
                                                              .labelcolor,
                                                        ))
                                                      ],
                                                    ),
                                                    vSizedBox,
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          MyImages.map_green,
                                                          height: 24,
                                                          width: 24,
                                                        ),
                                                        hSizedBox,
                                                        Expanded(
                                                            child:
                                                                ParagraphText(
                                                          text:
                                                              '${Provider.of<GlobalModal>(context, listen: false).userData!.address}',
                                                          fontSize: 16,
                                                          color: MyColors
                                                              .labelcolor,
                                                        ))
                                                      ],
                                                    ),
                                                    vSizedBox2,
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              RoundEdgedButton(
                                                            text: 'CANCEL',
                                                            color: MyColors
                                                                .disabledcolor,
                                                            textColor:
                                                                MyColors.black,
                                                            height: 40,
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ),
                                                        hSizedBox,
                                                        Expanded(
                                                          child:
                                                              RoundEdgedButton(
                                                            text: 'BREAK OUT',
                                                            height: 40,
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    vSizedBox2,
                                                  ],
                                                ));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  vSizedBox4,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            MainHeadingText(
                                              text: '--:--',
                                              fontSize: 24,
                                              color: MyColors.primaryColor,
                                            ),
                                            ParagraphText(
                                              text: 'Break In',
                                              fontFamily: 'bold',
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            MainHeadingText(
                                              text: '--:--',
                                              fontSize: 24,
                                              color: MyColors.primaryColor,
                                            ),
                                            ParagraphText(
                                              text: 'Break Out',
                                              fontFamily: 'bold',
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            MainHeadingText(
                                              text: '--:--',
                                              fontSize: 24,
                                              color: MyColors.primaryColor,
                                            ),
                                            ParagraphText(
                                              text: 'Break Hrs',
                                              fontFamily: 'bold',
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              );
      }),
    );
  }

  // @override
  // void dispose() {
  //   controller?.dispose();
  //   super.dispose();
  // }
  showPop() async {
    var btn=false;
    await showCustomDialogBox(
        context: context,
        child: Column(
          children: [
            vSizedBox,
            ParagraphText(
              text: 'Are you sure?',
              color: MyColors.black,
              fontFamily: 'bold',
            ),
            vSizedBox,
            CircleAvatarcustom(
              image:
                  '${Provider.of<GlobalModal>(context, listen: false).userData!.profile_img}',
            ),
            vSizedBox2,
            Row(
              children: [
                Image.asset(
                  MyImages.time,
                  height: 20,
                  width: 20,
                ),
                hSizedBox,
                Expanded(
                    child: ParagraphText(
                  text: '${DateFormat.Hms().format(DateTime.parse(DateTime.now().toString()))}, ${DateFormat.yMMMd().format(DateTime.parse(DateTime.now().toString()))}',
                  fontSize: 16,
                  color: MyColors.labelcolor,
                ))
              ],
            ),
            vSizedBox,
            Row(
              children: [
                Image.asset(
                  MyImages.map_green,
                  height: 24,
                  width: 24,
                ),
                hSizedBox,
                Expanded(
                    child: ParagraphText(
                  text: '${Provider.of<GlobalModal>(context, listen: false).location!.addressString}',
                  fontSize: 16,
                  color: MyColors.labelcolor,
                ))
              ],
            ),
            vSizedBox2,
            Row(
              children: [
                Expanded(
                  child: RoundEdgedButton(
                    text: 'CANCEL',
                    color: MyColors.disabledcolor,
                    textColor: MyColors.black,
                    height: 40,
                    onTap: () {
                      Navigator.pop(context);
                      is_popup=false;

                    },
                  ),
                ),
                hSizedBox,
                Expanded(
                  child: RoundEdgedButton(
                    text: att_detail['data']['today_attendance']['inTime'] ==
                                null &&
                            att_detail['data']['today_attendance']['outTime'] ==
                                null
                        ? 'PUNCH IN'
                        : att_detail['data']['today_attendance']['inTime'] !=
                                    null &&
                                att_detail['data']['today_attendance']
                                        ['outTime'] ==
                                    null
                            ? 'PUNCH OUT'
                            : '',
                    height: 40,
                    onTap: () async {
                      if(btn==true){
                        return;
                      }
                      btn =true;
                      print('agdlahdk');
                      Map<String, dynamic> data = {
                        'lat': Provider.of<GlobalModal>(context, listen: false).location!.Lat.toString(),
                        'lang': Provider.of<GlobalModal>(context, listen: false).location!.Lng.toString(),
                        'location': Provider.of<GlobalModal>(context, listen: false).location!.addressString,
                        'branchId': att_detail['data']['prefence_data']
                                ['branch_id']
                            .toString(),
                        'qrBranchcode': qrBranchcode,
                        'qrEmployerid': qrEmployerid
                      };
                      print('data for api -------${data}');
                      await Provider.of<GlobalModal>(context, listen: false)
                          .loadingShow();
                      var res = await Webservices.postData(
                          apiUrl: ApiUrls.qrattendanceStore,
                          body: data,
                          context: context);
                      await Provider.of<GlobalModal>(context, listen: false)
                          .loadingHide();
                      if (res['success'].toString() == 'true') {
                        is_popup=false;
                        showSnackbar(context, res['message'].toString());

                        Navigator.pop(context);
                        await getDetails();

                        is_scan=false;
                      } else {
                        showSnackbar(context, res['message'].toString());
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ],
            ),
            vSizedBox2,
          ],
        ));

    print("hello'-------------");
    is_popup=false;
  }
}
