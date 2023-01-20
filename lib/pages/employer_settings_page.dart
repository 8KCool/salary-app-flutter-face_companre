// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:salaryredesign/constants/colors.dart';
// import 'package:salaryredesign/constants/constans.dart';
// import 'package:salaryredesign/constants/image_urls.dart';
// import 'package:salaryredesign/constants/sized_box.dart';
// import 'package:salaryredesign/functions/navigation_functions.dart';
// import 'package:salaryredesign/pages/all_employee.dart';
// import 'package:salaryredesign/pages/approvals/attendance_approval.dart';
// import 'package:salaryredesign/pages/attandance_page.dart';
// import 'package:salaryredesign/pages/notification.dart';
// import 'package:salaryredesign/pages/organization_profile.dart';
// import 'package:salaryredesign/pages/payroll_setting/payroll_setting.dart';
// import 'package:salaryredesign/pages/settings/branch_settings.dart';
// import 'package:salaryredesign/pages/settings/holiday_settings.dart';
// import 'package:salaryredesign/pages/settings/other_settings.dart';
// import 'package:salaryredesign/pages/settings/policies.dart';
// import 'package:salaryredesign/pages/settings/shift_settings.dart';
// import 'package:salaryredesign/pages/tax_details.dart';
// import 'package:salaryredesign/widgets/CustomTexts.dart';
// import 'package:salaryredesign/widgets/appbar.dart';
//
// import '../../widgets/custom_widgets.dart';
// import 'language.dart';
//
// class EmployerSettings_Page extends StatefulWidget {
//   const EmployerSettings_Page({Key? key}) : super(key: key);
//
//   @override
//   State<EmployerSettings_Page> createState() => _EmployerSettings_PageState();
// }
//
// List images = [
//   MyImages.avatrtwo,
//   MyImages.avatr3,
//   MyImages.avatr4,
//   MyImages.avatr5,
//   MyImages.avatr6,
//   MyImages.avatr7,
//   MyImages.avatr8,
//   MyImages.avatr9,
//   MyImages.avatr10,
//   MyImages.avatr11,
//   MyImages.avatr12,
// ];
//
// List Name = [
//   'Attendance Approval',
//   'Time correction Approval',
//   'Leave Request',
//   'Permission   Request',
//   'Overtime Request',
//   'Pay Per Work',
// ];
//
// class _EmployerSettings_PageState extends State<EmployerSettings_Page> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyColors.disabledcolor,
//       appBar: appBar(
//           context: context,
//           title: 'Ecomads Private Limited',
//           implyLeading: false,
//           titlecenter: false,
//           leading: Icon(
//             Icons.menu,
//             color: Colors.white,
//           ),
//           appBarColor: MyColors.primaryColor,
//           titleColor: Colors.white,
//           actions: [
//             Icon(Icons.notifications_outlined),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Icon(
//                 Icons.help_outline_outlined,
//               ),
//             ),
//           ]
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: GestureDetector(
//                 child: Row(
//                   children: [
//                     Icon(Icons.arrow_back_outlined, size: 20, color: MyColors.primaryColor,),
//                     hSizedBox,
//                     ParagraphText(text: 'Settings', color: MyColors.primaryColor,)
//                   ],
//                 ),
//               ),
//             ),
//             vSizedBox2,
//             Padding(
//               padding: horizontal_pad + EdgeInsets.symmetric(horizontal: 36),
//               child: Column(
//                 children: [
//                   clickable_list(
//                     text: 'Organization Profile',
//                     img: MyImages.branch_settings,
//                     colorborderleft: Color(0xFF33CBCB),
//                     onTap: (){
//                       push(context: context, screen: OrganizationProfile());
//                     },
//                   ),
//                   clickable_list(
//                     text: 'Plan Details',
//                     img: 'assets/images/plan_detail.png',colorborderleft: Color(0xFF33CBCB),
//                     onTap: (){
//                       // push(context: context, screen: TaxDetails());
//                     },
//                   ),
//                   clickable_list(
//                     text: 'Billing Tax Detail',
//                     img: 'assets/images/billing_tax.png',
//                     colorborderleft: Color(0xFF33CBCB),
//                     onTap: (){
//                       push(context: context, screen: TaxDetails());
//                     },
//                   ),
//                   clickable_list(
//                     text: 'Billing Transaction Detail',
//                     img: 'assets/images/billing_transaction.png',
//                     colorborderleft: Color(0xFF33CBCB),
//                     onTap: (){
//                       // push(context: context, screen: Holiday_Settings_Page());
//                     },
//                   ),
//                   clickable_list(
//                     text: 'Notification Settings',
//                     img: 'assets/images/notification.png',
//                     colorborderleft: Color(0xFF33CBCB),
//                     onTap: (){
//                       push(context: context, screen: NotificationPage());
//                     },
//                   ),
//                   clickable_list(
//                     text: 'Change Language',
//                     img: 'assets/images/language.png',
//                     colorborderleft: Color(0xFF33CBCB),
//                     onTap: (){
//                       push(context: context, screen: LanguagePage());
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
