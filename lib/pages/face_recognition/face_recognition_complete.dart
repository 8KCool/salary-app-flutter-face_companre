import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/constans.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/employee/employee_dshboard.dart';
import 'package:salaryredesign/pages/employee/face_attendance.dart';
import 'package:salaryredesign/pages/face_recognition/face_recognition_start_page.dart';
import 'package:salaryredesign/pages/tab_pages/bottom_tab.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/showSnackbar.dart';

import '../../constants/globalkeys.dart';
import '../../providers/clock.dart';
import '../../services/api_urls.dart';
import '../../services/webservices.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:device_info_plus/device_info_plus.dart';

import '../../widgets/CustomLoader.dart';


class Face_Recognition_Complete_Page extends StatefulWidget {
  final File image;
  const Face_Recognition_Complete_Page({Key? key, required this.image})
      : super(key: key);

  @override
  State<Face_Recognition_Complete_Page> createState() =>
      _Face_Recognition_Complete_PageState();
}

class _Face_Recognition_Complete_PageState
    extends State<Face_Recognition_Complete_Page> {
  // Future<String?> _getId() async {
  //   var deviceInfo = DeviceInfoPlugin();
  //   if (Platform.isIOS) { // import 'dart:io'
  //     var iosDeviceInfo = await deviceInfo.iosInfo;
  //     return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  //   } else if(Platform.isAndroid) {
  //     var androidDeviceInfo = await deviceInfo.androidInfo;
  //     return androidDeviceInfo.androidId; // unique ID on Android
  //   }
  // }
  String workingHours = '';
  bool load=false;

  @override
  void initState() {
    // TODO: implement initState
    workingHours = '${faceAtt['data']['today_attendance']['workinHours']}';
    print('dgfgsrfhdgfh--------------${faceAtt['data']['today_attendance']['workinHours']}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: width(context),
              height: MediaQuery.of(context).size.height,
              child: Image.file(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                height: 300,
                padding: horizontal_pad,
                child: Center(
                    child: Column(
                  children: [
                    vSizedBox2,
                    vSizedBox,
                    MainHeadingText(
                      text: 'Scan Completed!',
                      color: MyColors.black,
                      fontSize: 30,
                    ),
                    vSizedBox2,
                    vSizedBox05,
                    ParagraphText(
                      text:
                          'Thanks for your effort, face recognition\nsuccessfully registered',
                      color: MyColors.black,
                      fontSize: 14,
                      fontFamily: 'regular',
                      textAlign: TextAlign.center,
                    ),
                    vSizedBox2,
                    // if(faceAtt['data']['today_attendance']['workinHours']==null ||faceAtt['data']['today_attendance']['workinHours'].toString()=='0')

                      if(!load)
                    RoundEdgedButton(
                      text: 'RETRY',
                      onTap: () {
                        push(context: context, screen: CameraExampleHome());
                      },
                    ),
                    vSizedBox,
                    RoundEdgedButton(
                      text: 'COMPLETE PROFILE',
                      onTap: ()async{
                            setState(() {
                              load=true;
                            });
                            DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                            var androidDeviceInfo = await deviceInfo.androidInfo;
                            var id = androidDeviceInfo.androidId;
                            // String? deviceId = await _getId();
                            Map<String, dynamic> data = {
                              'device_id': id.toString()
                            };
                            print(data);
                            Map<String, dynamic> files = {'image': widget.image};
                            print('files-----------55------$files');
                            var res = await Webservices.postDataWithImageFunction(
                                apiUrl: ApiUrls.facereconization,
                                body: data,
                                context: context,
                                files: files);
                            setState(() {
                              load=false;
                            });
                            Navigator.popUntil(context, (route) => route.isFirst);
                            // Navigator.of(context)
                            //     .popUntil(ModalRoute.withName("/Tabbarscreen"));
                            // showSnackbar(context, '${res['message']}');
                            // pushReplacement(context: context, screen: Tabbarscreen(key: tabbarKey,));
                           // if (res['success'].toString() == 'true') {
                           //
                           // }

                      },
                    ),
                    // if(faceAtt['data']['today_attendance']['workinHours']==null ||faceAtt['data']['today_attendance']['workinHours'].toString()=='0')
                    // if(!load)
                    // RoundEdgedButton(
                    //   text:
                    //       faceAtt['data']['today_attendance']['inTime'] == null
                    //           ? 'Punch In'
                    //           : 'Punch Out',
                    //   borderRadius: 5,
                    //   fontfamily: 'bold',
                    //   onTap: () async {
                    //     setState(() {
                    //       load=true;
                    //     });
                    //     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                    //     var androidDeviceInfo = await deviceInfo.androidInfo;
                    //     var id = androidDeviceInfo.androidId;
                    //     // String? deviceId = await _getId();
                    //     Map<String, dynamic> data = {
                    //       'lat':
                    //           Provider.of<GlobalModal>(context, listen: false)
                    //               .location!
                    //               .Lat
                    //               .toString(),
                    //       'lang':
                    //           Provider.of<GlobalModal>(context, listen: false)
                    //               .location!
                    //               .Lng
                    //               .toString(),
                    //       'location':
                    //           Provider.of<GlobalModal>(context, listen: false)
                    //               .location!
                    //               .addressString,
                    //       'device_id': id.toString()
                    //     };
                    //     print(data);
                    //     Map<String, dynamic> files = {'image': widget.image};
                    //     print('files-----------55------$files');
                    //     var res = await Webservices.postDataWithImageFunction(
                    //         apiUrl: ApiUrls.faceattendanceStore,
                    //         body: data,
                    //         context: context,
                    //         files: files);
                    //     setState(() {
                    //       load=false;
                    //     });
                    //     log("res --------------$res");
                    //     if (res['success'].toString() == 'true') {
                    //       // permissionModal.showLoading();
                    //       var res1 = await Webservices.postData(
                    //           apiUrl: ApiUrls.faceattendance,
                    //           body: {},
                    //           context: context);
                    //       if (res1['success'].toString() == 'true') {
                    //         faceAtt = res1;
                    //         workingHours = '${faceAtt['data']['today_attendance']['workinHours']}';
                    //         setState(() {
                    //
                    //         });
                    //       }
                    //
                    //       Future.delayed(const Duration(seconds: 10), () {
                    //         push(context: context, screen: TabsPage());
                    //       });
                    //     }
                    //     else{
                    //       showSnackbar(context, 'Something went wrong ! Please try again later.');
                    //       push(context: context, screen: TabsPage());
                    //
                    //     }
                    //     Future.delayed(const Duration(seconds: 10), () {
                    //     });
                    //
                    //     // token:toke after login,lat:10,lang:20,device_id:20,image
                    //     // push(context: context, screen: TabsPage());
                    //   },
                    // ),
                    vSizedBox4,
                    if(load)
                      CustomLoader(radius: 10,),
                    if(load)

                      vSizedBox4,
                    //
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Column(
                    //         children: [
                    //           MainHeadingText(
                    //             text: faceAtt['data']['today_attendance']
                    //                         ['inTime'] ==
                    //                     null
                    //                 ? '--:--'
                    //                 : '${faceAtt['data']['today_attendance']['inTime'].toString()}',
                    //             fontSize: 24,
                    //             color: MyColors.primaryColor,
                    //           ),
                    //           GestureDetector(
                    //             child: ParagraphText(
                    //               text: 'Punch In',
                    //               fontFamily: 'bold',
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //       Column(
                    //         children: [
                    //           MainHeadingText(
                    //             text: faceAtt['data']['today_attendance']
                    //                         ['outTime'] ==
                    //                     null
                    //                 ? '--:--'
                    //                 : '${faceAtt['data']['today_attendance']['outTime'].toString()}',
                    //             fontSize: 24,
                    //             color: MyColors.primaryColor,
                    //           ),
                    //           GestureDetector(
                    //             onTap: () async {
                    //               // globalModal.loadingShow();
                    //               // is_scan = true;
                    //               // globalModal.loadingHide();
                    //               // Future.delayed(
                    //               //     Duration(milliseconds: 100))
                    //               //     .then((value) {
                    //               //   controller?.resumeCamera();
                    //               //   // setState(() {
                    //               //   // });
                    //               // });
                    //               try {
                    //                 // Future.delayed(Duration(seconds: 2))
                    //                 //     .then((value) {
                    //                 //   controller?.resumeCamera();
                    //                 //   // setState(() {
                    //                 //   // });
                    //                 // });
                    //               } catch (e) {
                    //                 print('Error in catch block $e');
                    //               }
                    //             },
                    //             child: ParagraphText(
                    //               text: 'Punch Out',
                    //               fontFamily: 'bold',
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //       Column(
                    //         children: [
                    //           MainHeadingText(
                    //             text: workingHours == '' || workingHours == '0'
                    //                 ? '--:--'
                    //                 : workingHours,
                    //             fontSize: 24,
                    //             color: MyColors.primaryColor,
                    //           ),
                    //           ParagraphText(
                    //             text: 'Working Hrs',
                    //             fontFamily: 'bold',
                    //           )
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // vSizedBox2,
                    // RoundEdgedButton(text: 'Go to Home',onTap: (){
                    //   push(context: context, screen: TabsPage());
                    //
                    // },)
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
