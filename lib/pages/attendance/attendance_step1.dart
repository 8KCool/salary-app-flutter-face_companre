import 'dart:developer';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/attendance/Other_attendance.dart';
import 'package:salaryredesign/pages/attendance/faceAttendance.dart';
import 'package:salaryredesign/services/api_urls.dart';
import 'package:salaryredesign/services/webservices.dart';

import '../../constants/globalkeys.dart';
import '../../providers/clock.dart';
import '../../widgets/buttons.dart';
import '../face_recognition/face_recognition_start_page.dart';
import '../mark_attendance/mark_attendance.dart';
import '../tab_pages/bottom_tab.dart';
import 'newfacedetect.dart';

class CheckAttStatusPage extends StatefulWidget {
  // final GlobalKey navigatorKey;
  const CheckAttStatusPage({Key? key}) : super(key: key);

  @override
  State<CheckAttStatusPage> createState() => _CheckAttStatusPageState();
}

class _CheckAttStatusPageState extends State<CheckAttStatusPage> {

  String message = '';
  Future<void> _showMyDialog() async {
    // await Future.delayed(Duration(seconds: 2));

    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text('Alert'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Image.asset(MyImages.cancel,width: 70,height: 70,),
                // Icon(
                //   Icons.warning_amber_outlined,
                //   color: Colors.yellow,
                //   size: 80,
                // ),
                vSizedBox,
                Text(
                  '${message.toString()}',
                  // textAlign: TextAlign.center,
                ),
                // vSizedBox,

                TextButton(
                  child: const Text('OKAY'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // push(context: context, screen: TabsPage());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }



// getData()async{
//   var res = await Webservices.postData(
//       apiUrl: ApiUrls.faceattendance,
//       body: {},
//       context: context);
//   if (res['success'].toString() == 'true') {
//     faceAtt = res;
//   }
// }
  @override
  void initState() {
    // TODO: implement initState
    // getAttendanceData();
    // getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('hello worlllllll');
    return Navigator(
      // key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Choose Your Option',
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                ),
                backgroundColor: MyColors.primaryColor,
                // leading: GestureDetector(
                //     onTap: () {
                //       // push(context: context, screen: screen
                //       // Navigator.pop(context);
                //       // Navigator.of(context).pushAndRemoveUntil(
                //       //     MaterialPageRoute(builder: (context) => TabsPage()),
                //       //     (Route<dynamic> route) => false);
                //     },
                //     child: Icon(Icons.arrow_back)),
              ),
              body: Padding(
                padding: const EdgeInsets.all(26),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 80),
                        child: Center(
                            child: Text(
                          'Mark Attendance as via',
                          style: TextStyle(
                              color: Color(0xff4B5563),
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ))),
                    vSizedBox4,
                    GestureDetector(
                      onTap: () {
                        if (checkType['data']['qrattendance'].toString() == '1') {
                          push(context: context, screen: Mark_Attendance_Page());
                          // pushReplacement(context: context, screen: Mark_Attendance_Page());
                          // Navigator.pushReplacement(context, );
                        } else {
                          message = '${checkType['data']['qrattendance_error']} ';

                          _showMyDialog();
                        }
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: MyColors.primaryColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.qr_code_2,
                              color: Colors.white,
                            ),
                            hSizedBox05,
                            Text(
                              'QR CODE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                    ),
                    vSizedBox4,
                    GestureDetector(
                      onTap: () async {
                        if(checkType['data']!=null)
                        if (checkType['data']['faceattendance'].toString() == '1') {
                          push(context: context, screen: FaceCameraAttendance(phone: '${ await Provider.of<GlobalModal>(context, listen: false).userData!.phone}',));
                          // pushReplacement(context: context, screen: Face_Recognition_Start_Page());
                        } else {
                          message = '${checkType['data']['faceattendance_error']} ';
                          _showMyDialog();
                        }
                        // message = 'Coming soon ... ';
                        // _showMyDialog();
                        // push(context: context, screen: FaceCameraAttendance());
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: MyColors.primaryColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/happy.png',height: 20,),
                            hSizedBox05,
                            Text(
                              'FACE RECOGINATION ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                    ),
                    vSizedBox4,
                    Row(children: const <Widget>[
                      Expanded(
                          child: Divider(
                        thickness: 2,
                      )),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "OR",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 2,
                      )),
                    ]),
                    vSizedBox4,
                    GestureDetector(
                      onTap: () {
                        if(checkType['data']['otherphone'].toString()=='1'){
                          push(context: context, screen: OtherAttendancePage());
                        }
                        else{
                          print('object');
                          message = '${checkType['data']['otherphone_error']} ';

                          _showMyDialog();
                          //
                        }

                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: MyColors.primaryColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/user.png',height: 20,),
                            // Icon(
                            //   Icons.supervised_user_circle_outlined,
                            //   color: Colors.white,
                            // ),
                            hSizedBox05,
                            Text(
                              'OTHER PEOPLE ATTENDANCE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        );
      }
    );
  }
}
