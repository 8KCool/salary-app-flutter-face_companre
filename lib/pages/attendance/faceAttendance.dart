import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/image_urls.dart';
import '../../constants/sized_box.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

import '../../widgets/CustomTexts.dart';
import 'package:intl/intl.dart';

import '../../widgets/buttons.dart';
import '../../widgets/showSnackbar.dart';

class FaceAttendance extends StatefulWidget {
  const FaceAttendance({Key? key}) : super(key: key);

  @override
  State<FaceAttendance> createState() => _FaceAttendanceState();
}

class _FaceAttendanceState extends State<FaceAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        title:Text('Face Attendance',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700),),
        backgroundColor: MyColors.primaryColor,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
              // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              //     TabsPage()), (Route<dynamic> route) => false);
            },
            child: Icon(Icons.arrow_back)),
      ),
      //       appBar(context: context, title: 'Mark Attendance', implyLeading: false,leading: GestureDetector(
      //           onTap: (){
      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
      // TabsPage()), (Route<dynamic> route) => false);
      // },
      //     child: Icon(Icons.arrow_back)),),
      body:Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

    vSizedBox2,
    // if (att_detail['data'] != null)
    Container(
    width: MediaQuery.of(context).size.width,
    // margin: EdgeInsets.symmetric(horizontal: 0),
    height: MediaQuery.of(context).size.height - 161,
    decoration: BoxDecoration(
    color: MyColors.white,
    borderRadius: BorderRadius.circular(4)),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

    vSizedBox4,
    // if (attendance)
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
    // vSizedBox2,
    //
    // Container(
    //   width: 180,
    //   // height: 50,
    //   child: Chip_Custom(
    //     text: att_detail['data']
    //                         ['today_attendance']
    //                     ['inTime'] ==
    //                 null &&
    //             att_detail['data']
    //                         ['today_attendance']
    //                     ['outTime'] ==
    //                 null
    //         ? 'Not Punched'
    //         : att_detail['data'][
    //                             'today_attendance']
    //                         ['inTime'] !=
    //                     null &&
    //                 att_detail['data'][
    //                             'today_attendance']
    //                         ['outTime'] ==
    //                     null
    //             ? 'punching'
    //             : 'Punched',
    //     fontsize: 14,
    //
    //     // fontfamily: 'medium',
    //     background: Color(0xFFEFEFEF),
    //     textcolor: MyColors.labelcolor,
    //   ),
    // ),
    vSizedBox4,
    GestureDetector(
    onTap: () async {

    // globalModal.loadingShow();
    // is_scan = true;
    // globalModal.loadingHide();
    // Future.delayed(
    // Duration(milliseconds: 100))
    //     .then((value) {
    // controller?.resumeCamera();
    // // setState(() {
    // // });
    // });
    // try {
    // Future.delayed(Duration(seconds: 2))
    //     .then((value) {
    // controller?.resumeCamera();
    // // setState(() {
    // // });
    // });
    // } catch (e) {
    // print('Error in catch block $e');
    // } // Barcode? result = await push(context: MyGlobalKeys.navigatorKey.currentContext!, screen: ScanQrToJoinGroupPage());

    },
    child: Container(
    height: 260,
    width: 298,
    // child: _buildQrView(context),
    decoration: BoxDecoration(
    borderRadius:
    BorderRadius.circular(16),
    color: Color(0xFFD9D9D9)),
    child: Container(
    child: Column(
    children: [
    // if (is_scan)
    // Expanded(
    // // flex: 5,
    // child: QRView(
    // key: qrKey,
    // onQRViewCreated:
    // _onQRViewCreated,
    // ),
    // ),
    // if (!is_scan)
    Container(
    height: 260,
    width: 298,
    // child: _buildQrView(context),
    decoration: BoxDecoration(
    borderRadius:
    BorderRadius.circular(
    16),
    color: Colors.grey),
      // child: _cameraPreviewWidget(),
    ),
    // Image.asset('assets/images/QR.png',fit: BoxFit.fitWidth,)
    ],
    ),
    ),
    ),
    ),
    vSizedBox,
    // GestureDetector(
    //   onTap: () async {
    //
    //     globalModal.loadingShow();
    //     is_scan = true;
    //     globalModal.loadingHide();
    //     Future.delayed(
    //         Duration(milliseconds: 100))
    //         .then((value) {
    //       controller?.resumeCamera();
    //       // setState(() {
    //       // });
    //     });
    //     try {
    //       Future.delayed(Duration(seconds: 2))
    //           .then((value) {
    //         controller?.resumeCamera();
    //         // setState(() {
    //         // });
    //       });
    //     } catch (e) {
    //       print('Error in catch block $e');
    //     } // Barcode? result = await push(context: MyGlobalKeys.navigatorKey.currentContext!, screen: ScanQrToJoinGroupPage());
    //   },
    //   child: Padding(
    //     padding: const EdgeInsets.all(4.0),
    //     child: Text('Click here to scan QR'),
    //   ),
    // ),
    GestureDetector(
    // onTap: () {
    // globalModal.loadingShow();
    // is_scan = true;
    // globalModal.loadingHide();
    // Future.delayed(
    // Duration(milliseconds: 100))
    //     .then((value) {
    // controller?.resumeCamera();
    // // setState(() {
    // // });
    // });
    // try {
    // Future.delayed(Duration(seconds: 2))
    //     .then((value) {
    // controller?.resumeCamera();
    // // setState(() {
    // // });
    // });
    // } catch (e) {
    // print('Error in catch block $e');
    // }
    // },
    child: Image.asset(
    MyImages.camera_turn,
    height: 24,
    ),
    ),
    // vSizedBox4,

    Row(
    children: [
    // if (att_detail['data']['today_attendance']
    // ['inTime'] ==
    // null &&
    // att_detail['data']['today_attendance']
    // ['outTime'] ==
    // null)
    // Expanded(
    // child: GestureDetector(
    //
    // child: RoundEdgedButton(
    // text: 'PUNCH IN',
    // // onTap: () {
    // // if(result==''){
    // // showSnackbar(context, 'Scan Qr');
    // // }
    // //
    // // if(globalModal.location?.addressString==''){
    // // showSnackbar(context, 'Please wait while we fatching your  location.');
    // // return;
    // // }
    // // else{
    // // globalModal.loadingShow();
    // // is_scan = true;
    // // globalModal.loadingHide();
    // // Future.delayed(
    // // Duration(milliseconds: 100))
    // //     .then((value) {
    // // controller?.resumeCamera();
    // // // setState(() {
    // // // });
    // // });
    // // try {
    // // Future.delayed(Duration(seconds: 2))
    // //     .then((value) {
    // // controller?.resumeCamera();
    // // // setState(() {
    // // // });
    // // });
    // // } catch (e) {
    // // print('Error in catch block $e');
    // // }
    // // }
    //
    // // },
    // ),
    // ),
    // ),
    hSizedBox,

    ],
    ),
    vSizedBox4,
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
    text: '--:--',

    fontSize: 24,
    color: MyColors.primaryColor,
    ),
    GestureDetector(
    // onTap: () async {
    //
    // // globalModal.loadingShow();
    // is_scan = true;
    // // globalModal.loadingHide();
    // Future.delayed(
    // Duration(milliseconds: 100))
    //     .then((value) {
    // controller?.resumeCamera();
    // // setState(() {
    // // });
    // });
    // try {
    // Future.delayed(Duration(seconds: 2))
    //     .then((value) {
    // controller?.resumeCamera();
    // // setState(() {
    // // });
    // });
    // } catch (e) {
    // print('Error in catch block $e');
    // }
    // },
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
    text: '--:--',

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
    ]
    ),
    )

   ] )

    );
  }
  // Widget _cameraPreviewWidget() {
  //   final CameraController? cameraController = controller;
  //
  //   if (cameraController == null || !cameraController.value.isInitialized) {
  //     return const Text(
  //       'Tap a camera',
  //       style: TextStyle(
  //         color: Colors.white,
  //         fontSize: 24.0,
  //         fontWeight: FontWeight.w900,
  //       ),
  //     );
  //   } else {
  //     return Listener(
  //       onPointerDown: (_) => _pointers++,
  //       onPointerUp: (_) => _pointers--,
  //       child: CameraPreview(
  //         controller!,
  //         child: LayoutBuilder(
  //             builder: (BuildContext context, BoxConstraints constraints) {
  //               return GestureDetector(
  //                 behavior: HitTestBehavior.opaque,
  //                 onScaleStart: _handleScaleStart,
  //                 onScaleUpdate: _handleScaleUpdate,
  //                 onTapDown: (TapDownDetails details) =>
  //                     onViewFinderTap(details, constraints),
  //               );
  //             }),
  //       ),
  //     );
  //   }
  // }
}
