import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/all_employee.dart';
import 'package:salaryredesign/pages/announcement/announcement_page.dart';
import 'package:salaryredesign/pages/approvals/leave_request.dart';
import 'package:salaryredesign/pages/approvals/manage_approvals.dart';
import 'package:salaryredesign/pages/attandance_page.dart';
import 'package:salaryredesign/pages/notificationPage.dart';
import 'package:salaryredesign/pages/reports/reports_page.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:intl/intl.dart';
import 'package:salaryredesign/widgets/showSnackbar.dart';

import '../../constants/globalFunction.dart';
import '../../providers/clock.dart';
import '../../providers/newProvider.dart';
import '../../services/api_urls.dart';
import '../../services/auth.dart';
import '../../services/webservices.dart';
import '../../widgets/CustomCircularImage.dart';
import 'dart:convert' as convert;

import '../../widgets/CustomLoader.dart';
import '../Login_process/enter_phone_number.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

import '../webviewPages/option_view_page.dart';
import '../webviewPages/webview.dart';
import 'package:badges/badges.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Dashboard_Page extends StatefulWidget {
  final WebViewController controller;
  final Function(String url) onTap;
  const Dashboard_Page({Key? key,required this.controller,required this.onTap}) : super(key: key);

  @override
  State<Dashboard_Page> createState() => _Dashboard_PageState();
}

List images = [
  MyImages.avatrtwo,
  MyImages.avatr3,
  MyImages.avatr4,
  MyImages.avatr5,
  MyImages.avatr6,
  MyImages.avatr7,
  MyImages.avatr8,
  MyImages.avatr9,
  MyImages.avatr10,
  MyImages.avatr11,
  MyImages.avatr12,
];

List Name = [
  'John Smith',
  'Peter John',
  'Nora Luise',
  'Albus Potter',
  'Ron visely',
  'Ronit Sharma',
  'Lorem Ipsum',
  'John Smith',
  'Peter John',
  'Ron visely',
];
bool isWebView=false;
class _Dashboard_PageState extends State<Dashboard_Page> {
  String message='';
  showwebView(String url)async{
    await checkInternet(context);
    print('isConnected--------------$isConnected');
    if(isConnected){
      widget.onTap(url);


      //  push(context: context, screen: MyOptionWebView(controller: widget.controller,));
     // await widget.controller.loadRequest(Uri.parse(url));

      // isWebView=true;
      // setState(() {
      //
      // });
      // widget.controller = await setManishController('${url}');
      // print('${await Provider.of<GlobalModal>(context, listen: false).userData!.token}');
      // print('url link-----525---- ${ApiUrls.siteBaseUrl}staff/openweb?redirect_url=${Uri.encodeComponent(url)}');
      ///api hit
      // push(context: context, screen: WebViewPage(url:'${ApiUrls.siteBaseUrl}staff/openweb?redirect_url=${Uri.encodeComponent(url)}', token: '${await Provider.of<GlobalModal>(context, listen: false).userData!.token}',));
      // push(context: context, screen: WebViewPage(url:'${url}', token: '${await Provider.of<GlobalModal>(context, listen: false).userData!.token}',));
    }
    else{

    }
  }
  Future<void> _showMyDialog() async {
    // await Future.delayed(Duration(seconds: 2));

    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Image.asset(MyImages.cancel,width: 70,height: 70,),
                Icon(
                  Icons.warning_amber_outlined,
                  color: Colors.yellow,
                  size: 80,
                ),
                vSizedBox2,
                Text(
                  '${message.toString()}',
                  textAlign: TextAlign.center,
                ),
                vSizedBox,

                TextButton(
                  child: const Text('OK'),
                  onPressed: () {

                    Navigator.of(context).pop();
                    checkInternet1();
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
  checkInternet1()async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        await getDashboard();
        // setWebWiewController(context,Provider.of<PermissionModal>(context, listen: false).dashboardMenuPermission['attendanceurl']);
      }
    } on SocketException catch (_) {
      print('not connected');
      message='Check your internet connection';
      // showSnackbar(context, 'Check your internet connection');
      _showMyDialog();

    }
  }
  getDashboard()async{
    Provider.of<PermissionModal>(context, listen: false).load=true;
    var res = await Webservices.getData(ApiUrls.getNewProfile,context);
    log('res from new api ------1-----${res.body}');
    Provider.of<PermissionModal>(context, listen: false).hideLoading();

    var jsonResponse = convert.jsonDecode(res.body);
    if(jsonResponse['status'].toString()!='0'){
      log('res from new api -------2----${jsonResponse['data']}');
      Provider.of<PermissionModal>(context, listen: false).getPermission(jsonResponse['data']);
      // Provider.of<PermissionModal>(context, listen: false).load=false;
    }
    else{

      Provider.of<PermissionModal>(context, listen: false).load=false;
      // showSnackbar(context, 'Check your internet connection');
    }

    // Provider.of<GlobalModal>(context, listen: false).loadingHide();

  }
  @override
  void initState() {
    // getDashboard();
    checkInternet1();
    // TODO: implement initState
    super.initState();
  }
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
      backgroundColor: Color(0xFFF3F4F6),
      // appBar: appBar(
      //
      //     context: context,
      //     title: '${Provider.of<PermissionModal>(context, listen: true).dashboardMenuPermission['company_name']??'${Provider.of<GlobalModal>(context, listen: false).userData!.companyName}'}',
      //     titleColor:Colors.black,
      //     implyLeading: false,
      //     titlecenter: false,
      //     leading: GestureDetector(
      //       onTap: ()async{
      //         scaffoldKey.currentState?.openDrawer();
      //       },
      //       child: Icon(
      //         Icons.menu,
      //         color: Colors.black,
      //       ),
      //     ),
      //     appBarColor: MyColors.white,
      //     // titleColor: Colors.white,
      //     actions: [
      //       GestureDetector(
      //         onTap: () => push(context: context, screen: NotificationPage1()),
      //         child: Icon(Icons.notifications_outlined)
      //       ),
      //       Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 16),
      //         child: Icon(
      //           Icons.help_outline_outlined,
      //         ),
      //       ),
      //
      //     ]),
      body: SingleChildScrollView(
        child: Consumer<PermissionModal>(
          builder: (context,permission,child) {
            return permission.load?Container(height:MediaQuery.of(context).size.height,child: Center(child: CustomLoader())):Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                 permission.dashboardMenuPermission['type']=='employer'? Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 0),
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MainHeadingText(
                                fontSize: 20,
                                text: '${ DateFormat('dd MMM yyyy').format(DateTime.now())} | ${ DateFormat('E').format(DateTime.now())}',
                              ),
                              GestureDetector(
                                onTap:(){
                                  showwebView('${permission.dashboardMenuPermission['attendanceurl']}');

                                },
                                  // showwebView('${permission.dashboardMenuPermission['attendanceurl']}');
                                  // await checkInternet(context);
                                  // if(isConnected)
                                  // push(context: context, screen: WebViewPage(url:'${permission.dashboardMenuPermission['attendanceurl']}',));
                                // },
                                  child: MainHeadingText(
                                text: 'View All',
                                fontSize: 16,
                                color: MyColors.primaryColor,
                              ))
                            ],
                          ),
                          vSizedBox,
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  height: 130,
                                  decoration: BoxDecoration(
                                      color: MyColors.primaryColor,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ParagraphText(
                                        text: '${permission.dashboardMenuPermission['attendanceData']['total_employee']}',
                                        fontSize: 30,
                                        fontFamily: 'bold',
                                        color: Colors.white,
                                      ),
                                      vSizedBox,
                                      ParagraphText(
                                        text: 'Total Employees',
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              hSizedBox05,
                              Expanded(
                                  flex: 4,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  color: MyColors.secondarycolor,
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ParagraphText(
                                                    text: '${permission.dashboardMenuPermission['attendanceData']['present']}',
                                                    fontSize: 24,
                                                    fontFamily: 'bold',
                                                    color: Colors.white,
                                                  ),
                                                  // vSizedBox05,
                                                  ParagraphText(
                                                    text: 'Present',
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          hSizedBox05,
                                          Expanded(
                                            child: Container(
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  color: MyColors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ParagraphText(
                                                    text: '${permission.dashboardMenuPermission['attendanceData']['absent']}',
                                                    fontSize: 24,
                                                    fontFamily: 'bold',
                                                    color: Colors.white,
                                                  ),
                                                  // vSizedBox,
                                                  ParagraphText(
                                                    text: 'Absent',
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      vSizedBox05,
                                      // vSizedBox05,
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  color: MyColors.yellow,
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ParagraphText(
                                                    text: '${permission.dashboardMenuPermission['attendanceData']['permission']}',
                                                    fontSize: 24,
                                                    fontFamily: 'bold',
                                                    color: Colors.white,
                                                  ),
                                                  // vSizedBox05,
                                                  ParagraphText(
                                                    text: 'Half Day',
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          hSizedBox05,
                                          Expanded(
                                            child: Container(
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  color: Color(0xff58B8DD),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ParagraphText(
                                                    text: '${permission.dashboardMenuPermission['attendanceData']['other']}',
                                                    fontSize: 24,
                                                    fontFamily: 'bold',
                                                    color: Colors.white,
                                                  ),
                                                  // vSizedBox,
                                                  ParagraphText(
                                                    text: 'Late Entry',
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                          vSizedBox
                        ],
                      ),
                    ):Container(),


                // vSizedBox05,
                // vSizedBox05,
                // Container(
                //   // margin: EdgeInsets.symmetric(horizontal: 10),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     // borderRadius: BorderRadius.circular(12)
                //   ),
                //   // child: Column(
                //   //   crossAxisAlignment: CrossAxisAlignment.start,
                //   //   children: [
                //   //     Padding(
                //   //       padding:
                //   //           const EdgeInsets.only(left: 10, right: 10, top: 10),
                //   //       child: Row(
                //   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   //         children: [
                //   //           MainHeadingText(
                //   //             text: 'All Employees',
                //   //           ),
                //   //           GestureDetector(
                //   //             onTap: (){
                //   //               push(context: context, screen: All_Employee_Page());
                //   //             },
                //   //             child: MainHeadingText(
                //   //               text: 'View All',
                //   //               fontSize: 16,
                //   //               color: MyColors.primaryColor,
                //   //             ),
                //   //           )
                //   //         ],
                //   //       ),
                //   //     ),
                //   //     vSizedBox,
                //   //     vSizedBox05,
                //   //     Container(
                //   //       height: 100,
                //   //       child: ListView(
                //   //         scrollDirection: Axis.horizontal,
                //   //         children: [
                //   //           for (var i = 0; i < 10; i++)
                //   //             Container(
                //   //               margin: EdgeInsets.only(left: 10),
                //   //               width: 55,
                //   //               child: Column(
                //   //                 crossAxisAlignment: CrossAxisAlignment.center,
                //   //                 children: [
                //   //                   Stack(
                //   //                     children: [
                //   //                       ClipRRect(
                //   //                         child: Image.asset(
                //   //                           images[i],
                //   //                           height: 55,
                //   //                           width: 55,
                //   //                           fit: BoxFit.cover,
                //   //                         ),
                //   //                         borderRadius: BorderRadius.circular(50),
                //   //                       ),
                //   //                       Positioned(
                //   //                           top: 0,
                //   //                           right: 5,
                //   //                           child: Container(
                //   //                             height: 12,
                //   //                             width: 12,
                //   //                             decoration: BoxDecoration(
                //   //                                 color: MyColors.red,
                //   //                                 borderRadius:
                //   //                                     BorderRadius.circular(10),
                //   //                                 border: Border.all(
                //   //                                     color: Colors.white,
                //   //                                     width: 2)),
                //   //                           ))
                //   //                     ],
                //   //                   ),
                //   //                   SizedBox(
                //   //                     height: 5,
                //   //                   ),
                //   //                   ParagraphText(
                //   //                     text: Name[i],
                //   //                     textAlign: TextAlign.center,
                //   //                     fontSize: 12,
                //   //                     color: Colors.black,
                //   //                   )
                //   //                 ],
                //   //               ),
                //   //             )
                //   //         ],
                //   //       ),
                //   //     )
                //   //   ],
                //   // ),
                // ),
                // Text('${Provider.of<PermissionModal>(context, listen: false).dashboardMenuPermission['type']}'),
               if(Provider.of<PermissionModal>(context, listen: false).dashboardMenuPermission['type'].toString()=='employee')
                Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: MyColors.primaryColor,
                      ),
                      margin: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          vSizedBox2,
                          Stack(
                            children: [
                              // if(globalModal.userData!.profile_img!='')
                                Container(
                                  child: CustomCircularImage(
                                    // borderradius: 100,
                                    // image:MyImages.logo2,
                                    // image:'${dashBoardData['profileImage']??'https://etaskers.com/public/assets/company_logo/No_Image_Available.jpg'}',
                                    // isnetwork: true,
                                    height:60,
                                    width: 60,
                                    imageUrl:permission.dashboardMenuPermission['profileImage'],
                                    // imageUrl: MyImages.logo2,
                                    // fileType: CustomFileType.network,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          color: Colors.white,
                                          width: 3
                                      )
                                  ),
                                ),
                              // Positioned(
                              //   bottom: 10,
                              //     right: 0,
                              //     child: Image.asset(MyImages.camera_white,height: 30,)
                              // )
                            ],
                          ),
                          vSizedBox,
                          ParagraphText(
                            text: permission.dashboardMenuPermission['name']??'',
                              // text:'webwiders',
                            // text: '${dashBoardData['name']}',
                            fontSize: 20,
                            fontFamily: 'semibold',
                            color: MyColors.white,
                          ),
                          // vSizedBox05,
                          // ParagraphText(
                          //   text:'',
                          //   // text: globalModal.userData!.companyName??'',
                          //   // text: '${dashBoardData['company_name']??''}',
                          //   fontSize: 14,
                          //   color: MyColors.white,
                          // ),
                          vSizedBox2,
                        ],
                      ),
                    ),


                // vSizedBox,
                // vSizedBox05,
                    if(permission.dashboardMenuPermission['attendancemenu']!=null)
              Container(
                      margin: EdgeInsets.all(16),
                      height: 380,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      // margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(12)),
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(4),
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 20,
                        crossAxisCount: 3,
                        children: <Widget>[
                          if(permission.dashboardMenuPermission['attendancemenu'].toString()=='1')
                         GestureDetector(
                           onTap: ()async{
                             showwebView('${permission.dashboardMenuPermission['attendanceurl']}');
                             // await checkInternet(context);
                             // if(isConnected)
                             // push(context: context, screen: WebViewPage(
                             //   url: '${permission.dashboardMenuPermission['attendanceurl']}',));
                           },
                           child: Column(
                             children: [
                               Image.asset('assets/images/Group 18609 (2).png',height: 60,
                                      width: 60,),
                               vSizedBox,
                               Text('Attendance',style: TextStyle(color: Color(0xff2563EB),fontSize: 14),textAlign: TextAlign.center,)
                             ],
                           ),
                         ),
                          if(permission.dashboardMenuPermission['myattendancemenu'].toString()=='1')

                            GestureDetector(
                              onTap: ()async{
                                showwebView('${permission.dashboardMenuPermission['myattendanceurl']}');

                              },
                              child: Column(
                           children: [
                               Image.asset('assets/images/Group 18609 (2).png',height: 60,
                                 width: 60,),
                               vSizedBox,
                               Text('My Attendance',style: TextStyle(color: Color(0xff2563EB),fontSize: 14),textAlign: TextAlign.center,)
                           ],
                         ),
                            ),
                          if(permission.dashboardMenuPermission['employeDetailmenu'].toString()=='1')

                            GestureDetector(
                              onTap: ()async{
                                await showwebView('${permission.dashboardMenuPermission['employeDetailurl']}');

                              },
                              child: Column(
                           children: [
                             Badge(

                               badgeContent: Text('${permission.dashboardMenuPermission['total_employee']}',style: TextStyle(color: Colors.white),),
                               child:Image.asset('assets/images/Group 18610 (1).png',height: 60,
                                 width: 60,),
                               badgeColor: Color(0xffFF4B55),
                               position: BadgePosition.topEnd(top:-2,end:-2),
                               showBadge:int.parse(permission.dashboardMenuPermission['total_employee'].toString())>0?true:false ,
                             ),

                               vSizedBox,
                               Text('Employee \n Detail',style: TextStyle(color: Color(0xff2563EB),fontSize: 14),textAlign: TextAlign.center,)
                           ],
                         ),
                            ),
                          if(permission.dashboardMenuPermission['profileemenu'].toString()=='1')

                            GestureDetector(
                                  onTap: ()async{
                                    await showwebView('${permission.dashboardMenuPermission['profileeurl']}');

                              },
                              child: Column(
                              children: [
                                Image.asset('assets/images/Group 18611 (1).png',height: 60,
                                  width: 60,),
                                vSizedBox,
                                Text('My Profile',style: TextStyle(color: Color(0xff2563EB),fontSize: 14),textAlign: TextAlign.center,)
                              ],
                          ),
                            ),
                          if(permission.dashboardMenuPermission['myrequestemenu'].toString()=='1')

                            GestureDetector(
                                  onTap: ()async{
                                    await showwebView('${permission.dashboardMenuPermission['myrequesteurl']}');

                              },
                              child: Column(
                              children: [
                                Image.asset('assets/images/Group 18612 (2).png',height: 60,
                                  width: 60,),
                                vSizedBox,
                                Text('Request',style: TextStyle(color: Color(0xff2563EB),fontSize: 14),textAlign: TextAlign.center,)
                              ],
                          ),
                            ),
                          if(permission.dashboardMenuPermission['approvalmenu'].toString()=='1')

                            GestureDetector(
                                  onTap: ()async{
                                    await showwebView('${permission.dashboardMenuPermission['approvalurl']}');

                              },
                              child: Column(
                              children: [
                                Image.asset('assets/images/Group 18613 (1).png',height: 60,
                                  width: 60,),
                                vSizedBox,
                                Text('Approvals',style: TextStyle(color: Color(0xff2563EB),fontSize: 14),textAlign: TextAlign.center,)
                              ],
                          ),
                            ),
                          if(permission.dashboardMenuPermission['salaryprocessmenu'].toString()=='1')
                            GestureDetector(
                              onTap: ()async{
                                await showwebView('${permission.dashboardMenuPermission['salaryprocessurl']}');
                              },
                              child: Column(
                                children: [
                                  Image.asset('assets/images/Group 18614 (2).png',height: 60,
                                    width: 60,),
                                  vSizedBox,
                                  Text('Salary Process',style: TextStyle(color: Color(0xff2563EB),fontSize: 14),textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          //   GestureDetector(
                          //         onTap: (){
                          //       push(context: context, screen: WebViewPage(
                          //         url: '${permission.dashboardMenuPermission['myattendanceurl']}',));
                          //     },
                          //     child: ColuGestureDetector(
                          //           onTap: (){
                          //       push(context: context, screen: WebViewPage(
                          //         url: '${permission.dashboardMenuPermission['myattendanceurl']}',));
                          //     },
                          //     )mn(
                          //     children: [
                          //       Image.asset('assets/images/Group 18614 (2).png',height: 60,
                          //         width: 60,),
                          //       vSizedBox,
                          //       Text('Salary Process',style: TextStyle(color: Color(0xff2563EB),fontSize: 14))
                          //     ],
                          // ),
                          //   ),
                          if(permission.dashboardMenuPermission['reportmenu'].toString()=='1')

                            GestureDetector(
                                  onTap: ()async{
                                    await showwebView('${permission.dashboardMenuPermission['reporturl']}');



                              },
                              child: Column(
                              children: [
                                Image.asset('assets/images/Group 18615 (1).png',height: 60,
                                  width: 60,),
                                vSizedBox,
                                Text('Reports',style: TextStyle(color: Color(0xff2563EB),fontSize: 14),textAlign: TextAlign.center,)
                              ],
                          ),
                            ),
                          if(permission.dashboardMenuPermission['announcemenu'].toString()=='1')

                          GestureDetector(
                                onTap: ()async{
                                  await showwebView('${permission.dashboardMenuPermission['announceurl']}');
                              },
                            child: Column(
                              children: [
                                Image.asset('assets/images/Group 18616 (1).png',height: 60,
                                  width: 60,),
                                vSizedBox,
                                Text('Announcement',style: TextStyle(color: Color(0xff2563EB),fontSize: 14),textAlign: TextAlign.center,)
                              ],
                            ),
                          ),
                        ],
                      ),
                      // child:
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Expanded(
                      //           child: GestureDetector(
                      //             onTap: (){
                      //               push(context: context, screen: Attandance_daily_Page());
                      //             },
                      //             child: Column(
                      //               crossAxisAlignment: CrossAxisAlignment.center,
                      //               children: [
                      //                 Stack(
                      //                   children: [
                      //                     ClipRRect(
                      //                       child: Image.asset(
                      //                         MyImages.attendance,
                      //                         height: 60,
                      //                         width: 60,
                      //                         fit: BoxFit.cover,
                      //                       ),
                      //                       borderRadius: BorderRadius.circular(50),
                      //                     ),
                      //                     // Positioned(
                      //                     //     top: 0, right: 5,
                      //                     //     child: Container(
                      //                     //       height: 12,
                      //                     //       width: 12,
                      //                     //       decoration: BoxDecoration(
                      //                     //           color: MyColors.red,
                      //                     //           borderRadius: BorderRadius.circular(10),
                      //                     //           border: Border.all(
                      //                     //               color: Colors.white,
                      //                     //               width: 2
                      //                     //           )
                      //                     //       ),
                      //                     //     ))
                      //                   ],
                      //                 ),
                      //                 SizedBox(
                      //                   height: 5,
                      //                 ),
                      //                 ParagraphText(
                      //                   text: 'Attendance',
                      //                   textAlign: TextAlign.center,
                      //                   fontSize: 14,
                      //                   color: MyColors.primaryColor,
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //         hSizedBox4,
                      //         Expanded(
                      //           child: GestureDetector(
                      //             onTap: (){
                      //               push(context: context, screen: Manage_Approvals_Page());
                      //             },
                      //             child: Column(
                      //               crossAxisAlignment: CrossAxisAlignment.center,
                      //               children: [
                      //                 Stack(
                      //                   children: [
                      //                     ClipRRect(
                      //                       child: Image.asset(
                      //                         MyImages.approvals,
                      //                         height: 60,
                      //                         width: 60,
                      //                         fit: BoxFit.cover,
                      //                       ),
                      //                       borderRadius: BorderRadius.circular(50),
                      //                     ),
                      //                     Positioned(
                      //                         top: -10,
                      //                         right: 0,
                      //                         child: Container(
                      //                           height: 24,
                      //                           width: 24,
                      //                           decoration: BoxDecoration(
                      //                               color: MyColors.red,
                      //                               borderRadius:
                      //                                   BorderRadius.circular(15),
                      //                               border: Border.all(
                      //                                   color: Colors.white, width: 2)),
                      //                           child: Center(
                      //                             child: ParagraphText(
                      //                               text: '1',
                      //                               color: Colors.white,
                      //                               fontSize: 12,
                      //                             ),
                      //                           ),
                      //                         ))
                      //                   ],
                      //                   clipBehavior: Clip.none,
                      //                 ),
                      //                 SizedBox(
                      //                   height: 5,
                      //                 ),
                      //                 ParagraphText(
                      //                   text: 'Approvals',
                      //                   textAlign: TextAlign.center,
                      //                   fontSize: 14,
                      //                   color: MyColors.primaryColor,
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //         hSizedBox4,
                      //         Expanded(
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.center,
                      //             children: [
                      //               Stack(
                      //                 children: [
                      //                   ClipRRect(
                      //                     child: Image.asset(
                      //                       MyImages.salaryprocess,
                      //                       height: 60,
                      //                       width: 60,
                      //                       fit: BoxFit.cover,
                      //                     ),
                      //                     borderRadius: BorderRadius.circular(50),
                      //                   ),
                      //                   // Positioned(
                      //                   //     top: 0, right: 5,
                      //                   //     child: Container(
                      //                   //       height: 12,
                      //                   //       width: 12,
                      //                   //       decoration: BoxDecoration(
                      //                   //           color: MyColors.red,
                      //                   //           borderRadius: BorderRadius.circular(10),
                      //                   //           border: Border.all(
                      //                   //               color: Colors.white,
                      //                   //               width: 2
                      //                   //           )
                      //                   //       ),
                      //                   //     ))
                      //                 ],
                      //               ),
                      //               SizedBox(
                      //                 height: 5,
                      //               ),
                      //               ParagraphText(
                      //                 text: 'Salary Process',
                      //                 textAlign: TextAlign.center,
                      //                 fontSize: 13,
                      //                 color: MyColors.primaryColor,
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //     vSizedBox2,
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Expanded(
                      //           child: GestureDetector(
                      //             onTap: (){
                      //               push(context: context, screen: Announcement_Page());
                      //             },
                      //             child: Column(
                      //               crossAxisAlignment: CrossAxisAlignment.center,
                      //               children: [
                      //                 Stack(
                      //                   children: [
                      //                     ClipRRect(
                      //                       child: Image.asset(
                      //                         MyImages.announcement,
                      //                         height: 60,
                      //                         width: 60,
                      //                         fit: BoxFit.cover,
                      //                       ),
                      //                       borderRadius: BorderRadius.circular(50),
                      //                     ),
                      //                     // Positioned(
                      //                     //     top: 0, right: 5,
                      //                     //     child: Container(
                      //                     //       height: 12,
                      //                     //       width: 12,
                      //                     //       decoration: BoxDecoration(
                      //                     //           color: MyColors.red,
                      //                     //           borderRadius: BorderRadius.circular(10),
                      //                     //           border: Border.all(
                      //                     //               color: Colors.white,
                      //                     //               width: 2
                      //                     //           )
                      //                     //       ),
                      //                     //     ))
                      //                   ],
                      //                 ),
                      //                 SizedBox(
                      //                   height: 5,
                      //                 ),
                      //                 ParagraphText(
                      //                   text: 'Announcement',
                      //                   textAlign: TextAlign.center,
                      //                   fontSize: 13.7,
                      //                   color: MyColors.primaryColor,
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //         hSizedBox4,
                      //         Expanded(
                      //           child: GestureDetector(
                      //             onTap: (){
                      //               push(context: context, screen: Reports_Page());
                      //             },
                      //             child: Column(
                      //               crossAxisAlignment: CrossAxisAlignment.center,
                      //               children: [
                      //                 Stack(
                      //                   children: [
                      //                     ClipRRect(
                      //                       child: Image.asset(
                      //                         MyImages.reports,
                      //                         height: 60,
                      //                         width: 60,
                      //                         fit: BoxFit.cover,
                      //                       ),
                      //                       borderRadius: BorderRadius.circular(50),
                      //                     ),
                      //                     // Positioned(
                      //                     //     top: 0, right: 5,
                      //                     //     child: Container(
                      //                     //       height: 12,
                      //                     //       width: 12,
                      //                     //       decoration: BoxDecoration(
                      //                     //           color: MyColors.red,
                      //                     //           borderRadius: BorderRadius.circular(10),
                      //                     //           border: Border.all(
                      //                     //               color: Colors.white,
                      //                     //               width: 2
                      //                     //           )
                      //                     //       ),
                      //                     //     )
                      //                     // )
                      //                   ],
                      //                 ),
                      //                 SizedBox(
                      //                   height: 5,
                      //                 ),
                      //                 ParagraphText(
                      //                   text: 'Reports',
                      //                   textAlign: TextAlign.center,
                      //                   fontSize: 14,
                      //                   color: MyColors.primaryColor,
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //         hSizedBox4,
                      //         Expanded(
                      //           child: GestureDetector(
                      //             onTap: (){
                      //               push(context: context, screen: Reports_Page());
                      //             },
                      //             child: Column(
                      //               crossAxisAlignment: CrossAxisAlignment.center,
                      //               children: [
                      //                 Stack(
                      //                   children: [
                      //                     ClipRRect(
                      //                       child: Image.asset(
                      //                         MyImages.reports,
                      //                         height: 60,
                      //                         width: 60,
                      //                         fit: BoxFit.cover,
                      //                       ),
                      //                       borderRadius: BorderRadius.circular(50),
                      //                     ),
                      //                     // Positioned(
                      //                     //     top: 0, right: 5,
                      //                     //     child: Container(
                      //                     //       height: 12,
                      //                     //       width: 12,
                      //                     //       decoration: BoxDecoration(
                      //                     //           color: MyColors.red,
                      //                     //           borderRadius: BorderRadius.circular(10),
                      //                     //           border: Border.all(
                      //                     //               color: Colors.white,
                      //                     //               width: 2
                      //                     //           )
                      //                     //       ),
                      //                     //     )
                      //                     // )
                      //                   ],
                      //                 ),
                      //                 SizedBox(
                      //                   height: 5,
                      //                 ),
                      //                 ParagraphText(
                      //                   text: 'Reports',
                      //                   textAlign: TextAlign.center,
                      //                   fontSize: 14,
                      //                   color: MyColors.primaryColor,
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //         // Expanded(
                      //         //   child: Opacity(
                      //         //     opacity: 0,
                      //         //     child: Column(
                      //         //       crossAxisAlignment: CrossAxisAlignment.center,
                      //         //       children: [
                      //         //         Stack(
                      //         //           children: [
                      //         //             ClipRRect(
                      //         //               child: Image.asset(
                      //         //                 MyImages.salaryprocess,
                      //         //                 height: 55,
                      //         //                 width: 55,
                      //         //                 fit: BoxFit.cover,
                      //         //               ),
                      //         //               borderRadius: BorderRadius.circular(50),
                      //         //             ),
                      //         //             Positioned(
                      //         //                 top: 0,
                      //         //                 right: 5,
                      //         //                 child: Container(
                      //         //                   height: 12,
                      //         //                   width: 12,
                      //         //                   decoration: BoxDecoration(
                      //         //                       color: MyColors.red,
                      //         //                       borderRadius:
                      //         //                           BorderRadius.circular(10),
                      //         //                       border: Border.all(
                      //         //                           color: Colors.white, width: 2)),
                      //         //                 ))
                      //         //           ],
                      //         //         ),
                      //         //         SizedBox(
                      //         //           height: 5,
                      //         //         ),
                      //         //         ParagraphText(
                      //         //           text: 'Salary Process',
                      //         //           textAlign: TextAlign.center,
                      //         //           fontSize: 13,
                      //         //           color: MyColors.primaryColor,
                      //         //         )
                      //         //       ],
                      //         //     ),
                      //         //   ),
                      //         // ),
                      //       ],
                      //     ),
                      //     vSizedBox2,
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Expanded(
                      //           child: GestureDetector(
                      //             onTap: (){
                      //               push(context: context, screen: Attandance_daily_Page());
                      //             },
                      //             child: Column(
                      //               crossAxisAlignment: CrossAxisAlignment.center,
                      //               children: [
                      //                 Stack(
                      //                   children: [
                      //                     ClipRRect(
                      //                       child: Image.asset(
                      //                         MyImages.attendance,
                      //                         height: 60,
                      //                         width: 60,
                      //                         fit: BoxFit.cover,
                      //                       ),
                      //                       borderRadius: BorderRadius.circular(50),
                      //                     ),
                      //                     // Positioned(
                      //                     //     top: 0, right: 5,
                      //                     //     child: Container(
                      //                     //       height: 12,
                      //                     //       width: 12,
                      //                     //       decoration: BoxDecoration(
                      //                     //           color: MyColors.red,
                      //                     //           borderRadius: BorderRadius.circular(10),
                      //                     //           border: Border.all(
                      //                     //               color: Colors.white,
                      //                     //               width: 2
                      //                     //           )
                      //                     //       ),
                      //                     //     ))
                      //                   ],
                      //                 ),
                      //                 SizedBox(
                      //                   height: 5,
                      //                 ),
                      //                 ParagraphText(
                      //                   text: 'Attendance',
                      //                   textAlign: TextAlign.center,
                      //                   fontSize: 14,
                      //                   color: MyColors.primaryColor,
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //         hSizedBox4,
                      //         Expanded(
                      //           child: GestureDetector(
                      //             onTap: (){
                      //               push(context: context, screen: Manage_Approvals_Page());
                      //             },
                      //             child: Column(
                      //               crossAxisAlignment: CrossAxisAlignment.center,
                      //               children: [
                      //                 Stack(
                      //                   children: [
                      //                     ClipRRect(
                      //                       child: Image.asset(
                      //                         MyImages.approvals,
                      //                         height: 60,
                      //                         width: 60,
                      //                         fit: BoxFit.cover,
                      //                       ),
                      //                       borderRadius: BorderRadius.circular(50),
                      //                     ),
                      //                     Positioned(
                      //                         top: -10,
                      //                         right: 0,
                      //                         child: Container(
                      //                           height: 24,
                      //                           width: 24,
                      //                           decoration: BoxDecoration(
                      //                               color: MyColors.red,
                      //                               borderRadius:
                      //                               BorderRadius.circular(15),
                      //                               border: Border.all(
                      //                                   color: Colors.white, width: 2)),
                      //                           child: Center(
                      //                             child: ParagraphText(
                      //                               text: '1',
                      //                               color: Colors.white,
                      //                               fontSize: 12,
                      //                             ),
                      //                           ),
                      //                         ))
                      //                   ],
                      //                   clipBehavior: Clip.none,
                      //                 ),
                      //                 SizedBox(
                      //                   height: 5,
                      //                 ),
                      //                 ParagraphText(
                      //                   text: 'Approvals',
                      //                   textAlign: TextAlign.center,
                      //                   fontSize: 14,
                      //                   color: MyColors.primaryColor,
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //         hSizedBox4,
                      //         Expanded(
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.center,
                      //             children: [
                      //               Stack(
                      //                 children: [
                      //                   ClipRRect(
                      //                     child: Image.asset(
                      //                       MyImages.salaryprocess,
                      //                       height: 60,
                      //                       width: 60,
                      //                       fit: BoxFit.cover,
                      //                     ),
                      //                     borderRadius: BorderRadius.circular(50),
                      //                   ),
                      //                   // Positioned(
                      //                   //     top: 0, right: 5,
                      //                   //     child: Container(
                      //                   //       height: 12,
                      //                   //       width: 12,
                      //                   //       decoration: BoxDecoration(
                      //                   //           color: MyColors.red,
                      //                   //           borderRadius: BorderRadius.circular(10),
                      //                   //           border: Border.all(
                      //                   //               color: Colors.white,
                      //                   //               width: 2
                      //                   //           )
                      //                   //       ),
                      //                   //     ))
                      //                 ],
                      //               ),
                      //               SizedBox(
                      //                 height: 5,
                      //               ),
                      //               ParagraphText(
                      //                 text: 'Salary Process',
                      //                 textAlign: TextAlign.center,
                      //                 fontSize: 13,
                      //                 color: MyColors.primaryColor,
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                    ),


                vSizedBox,
                vSizedBox05,
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                //   // margin: EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //       color: Colors.white, borderRadius: BorderRadius.circular(12)),
                //   child: Column(
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           MainHeadingText(
                //             text: 'Approval Request',
                //           ),
                //         ],
                //       ),
                //       vSizedBox,
                //       vSizedBox05,
                //       for (var i = 0; i < 3; i++)
                //         GestureDetector(
                //           onTap: (){
                //             push(context: context, screen: Leave_Request_Page());
                //           },
                //           child: Column(
                //             children: [
                //               Row(
                //                 children: [
                //                   ClipRRect(
                //                     child: Image.asset(
                //                       images[i],
                //                       height: 60,
                //                       width: 60,
                //                     ),
                //                     borderRadius: BorderRadius.circular(30),
                //                   ),
                //                   hSizedBox,
                //                   Expanded(
                //                     child: Column(
                //                       crossAxisAlignment: CrossAxisAlignment.start,
                //                       children: [
                //                         RichText(
                //                           text: TextSpan(
                //                             text: Name[i] + ' ',
                //                             style: TextStyle(
                //                                 fontSize: 16,
                //                                 color: Colors.black,
                //                                 fontFamily: 'bold'),
                //                             children: const <TextSpan>[
                //                               TextSpan(
                //                                   text:
                //                                       'is requested leave for 2 days.',
                //                                   style: TextStyle(
                //                                       color: MyColors.paragraphcolor,
                //                                       fontFamily: 'regular')),
                //                             ],
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                   TextButton(
                //                       onPressed: () {},
                //                       child: ParagraphText(
                //                         text: 'View',
                //                         fontSize: 14,
                //                         fontFamily: 'bold',
                //                         color: MyColors.primaryColor,
                //                       ))
                //                 ],
                //               ),
                //               Divider(
                //                 height: 30,
                //               )
                //             ],
                //           ),
                //         ),
                //     ],
                //   ),
                // ),
              ],
            );
          }
        ),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width-100,
          
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);

                showDialog(context: context, builder: (context1) {
                  return AlertDialog(

                    title: Text('Logout',),
                    content: Text('Are you sure, want to logout?'),
                    actions: [
                      TextButton(
                          onPressed: () async {
                            await logout();
                            // Navigator.of(context).pushReplacementNamed('/pre-login');
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) =>
                                    Enter_Phone_Number()), (
                                Route<dynamic> route) => false);
                          }, child: Text('logout')),
                      TextButton(onPressed: () async {
                        Navigator.pop(context1);
                      }, child: Text('cancel')
                      ),
                    ],
                  );
                });
                // push(context: context, screen: Welcome_Page());

            },
              child: Column(
                children: [
                  Container(
                    height: 200,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Image.asset('assets/images/Vector (3).png',height: 30,width: 30,),
                          hSizedBox,
                          Text('Logout',style: TextStyle(fontSize: 16),),
                        ],
                      )),
                ],
              ))// Populate the Drawer in the next step.
      )
    );
  }
}
