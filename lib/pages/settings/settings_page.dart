import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/constans.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/Login_process/enter_phone_number.dart';
import 'package:salaryredesign/pages/all_employee.dart';
import 'package:salaryredesign/pages/approvals/attendance_approval.dart';
import 'package:salaryredesign/pages/attandance_page.dart';
import 'package:salaryredesign/pages/payroll_setting/payroll_setting.dart';
import 'package:salaryredesign/pages/settings/branch_settings.dart';
import 'package:salaryredesign/pages/settings/holiday_settings.dart';
import 'package:salaryredesign/pages/settings/other_settings.dart';
import 'package:salaryredesign/pages/settings/policies.dart';
import 'package:salaryredesign/pages/settings/shift_settings.dart';
import 'package:salaryredesign/pages/welcome.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';

import '../../providers/clock.dart';
import '../../services/auth.dart';
import '../../widgets/custom_widgets.dart';

class Settings_Page extends StatefulWidget {
  // final GlobalKey? navigatorKey;,this.navigatorKey

  const Settings_Page({Key? key}) : super(key: key);

  @override
  State<Settings_Page> createState() => _Settings_PageState();
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
  'Attendance Approval',
  'Time correction Approval',
  'Leave Request',
  'Permission   Request',
  'Overtime Request',
  'Pay Per Work',
];

class _Settings_PageState extends State<Settings_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.disabledcolor,
      appBar: appBar(
          context: context,
          title: '${Provider.of<GlobalModal>(context, listen: false).userData!.companyName ??Provider.of<GlobalModal>(context, listen: false).userData!.name}',
          implyLeading: false,
          titlecenter: false,
          // leading: Icon(
          //   Icons.menu,
          //   color: Colors.white,
          // ),
          appBarColor: MyColors.primaryColor,
          titleColor: Colors.white,
          actions: [
            Icon(Icons.notifications_outlined),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.help_outline_outlined,
              ),
            ),
          ]
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 8
            vSizedBox2,
            Padding(
              padding: horizontal_pad + EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  clickable_list(
                    text: 'Logout',
                    img: MyImages.emp3,
                    colorborderleft: Color(0xFF33CBCB),
                    onTap: (){
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
                  ),
                  // clickable_list(
                  //   text: 'Calendar',
                  //   img: MyImages.emp3,
                  //   colorborderleft: Color(0xFF33CBCB),
                  //     onTap: (){
                  //     push(context: context, screen: screen);
                  //     },
                  // )

                ],
              ),
            ),
          ],
        ),
      ),
    );
    // return Navigator(
    //     key: widget.navigatorKey,
    //     onGenerateRoute: (RouteSettings settings) {
    //       return MaterialPageRoute(
    //         settings: settings,
    //           builder: (context){
    //             return Scaffold(
    //               backgroundColor: MyColors.disabledcolor,
    //               appBar: appBar(
    //                   context: context,
    //                   title: '${Provider.of<GlobalModal>(context, listen: false).userData!.companyName ??Provider.of<GlobalModal>(context, listen: false).userData!.name}',
    //                   implyLeading: false,
    //                   titlecenter: false,
    //                   // leading: Icon(
    //                   //   Icons.menu,
    //                   //   color: Colors.white,
    //                   // ),
    //                   appBarColor: MyColors.primaryColor,
    //                   titleColor: Colors.white,
    //                   actions: [
    //                     Icon(Icons.notifications_outlined),
    //                     Padding(
    //                       padding: EdgeInsets.symmetric(horizontal: 16),
    //                       child: Icon(
    //                         Icons.help_outline_outlined,
    //                       ),
    //                     ),
    //                   ]
    //               ),
    //               body: SingleChildScrollView(
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     // 8
    //                     vSizedBox2,
    //                     Padding(
    //                       padding: horizontal_pad + EdgeInsets.symmetric(horizontal: 10),
    //                       child: Column(
    //                         children: [
    //                           clickable_list(
    //                             text: 'Logout',
    //                             img: MyImages.emp3,
    //                             colorborderleft: Color(0xFF33CBCB),
    //                             onTap: (){
    //                               showDialog(context: context, builder: (context1) {
    //                                 return AlertDialog(
    //
    //                                   title: Text('Logout',),
    //                                   content: Text('Are you sure, want to logout?'),
    //                                   actions: [
    //                                     TextButton(
    //                                         onPressed: () async {
    //                                           await logout();
    //                                           // Navigator.of(context).pushReplacementNamed('/pre-login');
    //                                           Navigator.of(context).pushAndRemoveUntil(
    //                                               MaterialPageRoute(builder: (context) =>
    //                                                   Enter_Phone_Number()), (
    //                                               Route<dynamic> route) => false);
    //                                         }, child: Text('logout')),
    //                                     TextButton(onPressed: () async {
    //                                       Navigator.pop(context1);
    //                                     }, child: Text('cancel')
    //                                     ),
    //                                   ],
    //                                 );
    //                               });
    //                               // push(context: context, screen: Welcome_Page());
    //                             },
    //                           ),
    //                           // clickable_list(
    //                           //   text: 'Calendar',
    //                           //   img: MyImages.emp3,
    //                           //   colorborderleft: Color(0xFF33CBCB),
    //                           //     onTap: (){
    //                           //     push(context: context, screen: screen);
    //                           //     },
    //                           // )
    //
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             );
    //           });
    //     }
    //   // builder: (context) {
    //   //   return Scaffold(
    //   //     backgroundColor: MyColors.disabledcolor,
    //   //     appBar: appBar(
    //   //         context: context,
    //   //         title: '${Provider.of<GlobalModal>(context, listen: false).userData!.companyName ??Provider.of<GlobalModal>(context, listen: false).userData!.name}',
    //   //         implyLeading: false,
    //   //         titlecenter: false,
    //   //         // leading: Icon(
    //   //         //   Icons.menu,
    //   //         //   color: Colors.white,
    //   //         // ),
    //   //         appBarColor: MyColors.primaryColor,
    //   //         titleColor: Colors.white,
    //   //         actions: [
    //   //           Icon(Icons.notifications_outlined),
    //   //           Padding(
    //   //             padding: EdgeInsets.symmetric(horizontal: 16),
    //   //             child: Icon(
    //   //               Icons.help_outline_outlined,
    //   //             ),
    //   //           ),
    //   //         ]
    //   //     ),
    //   //     body: SingleChildScrollView(
    //   //       child: Column(
    //   //         crossAxisAlignment: CrossAxisAlignment.start,
    //   //         children: [
    //   //           // 8
    //   //           vSizedBox2,
    //   //           Padding(
    //   //             padding: horizontal_pad + EdgeInsets.symmetric(horizontal: 10),
    //   //             child: Column(
    //   //               children: [
    //   //                 clickable_list(
    //   //                   text: 'Logout',
    //   //                   img: MyImages.emp3,
    //   //                   colorborderleft: Color(0xFF33CBCB),
    //   //                   onTap: (){
    //   //                     showDialog(context: context, builder: (context1) {
    //   //                       return AlertDialog(
    //   //
    //   //                         title: Text('Logout',),
    //   //                         content: Text('Are you sure, want to logout?'),
    //   //                         actions: [
    //   //                           TextButton(
    //   //                               onPressed: () async {
    //   //                                 await logout();
    //   //                                 // Navigator.of(context).pushReplacementNamed('/pre-login');
    //   //                                 Navigator.of(context).pushAndRemoveUntil(
    //   //                                     MaterialPageRoute(builder: (context) =>
    //   //                                         Enter_Phone_Number()), (
    //   //                                     Route<dynamic> route) => false);
    //   //                               }, child: Text('logout')),
    //   //                           TextButton(onPressed: () async {
    //   //                             Navigator.pop(context1);
    //   //                           }, child: Text('cancel')
    //   //                           ),
    //   //                         ],
    //   //                       );
    //   //                     });
    //   //                     // push(context: context, screen: Welcome_Page());
    //   //                   },
    //   //                 ),
    //   //             // clickable_list(
    //   //             //   text: 'Calendar',
    //   //             //   img: MyImages.emp3,
    //   //             //   colorborderleft: Color(0xFF33CBCB),
    //   //             //     onTap: (){
    //   //             //     push(context: context, screen: screen);
    //   //             //     },
    //   //             // )
    //   //
    //   //               ],
    //   //             ),
    //   //           ),
    //   //         ],
    //   //       ),
    //   //     ),
    //   //   );
    //   // }
    // );
  }
}
