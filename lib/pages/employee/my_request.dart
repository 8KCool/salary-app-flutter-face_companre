import 'dart:developer';
import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/approvals/leave_request.dart';
import 'package:salaryredesign/pages/approvals/permission_request.dart';
import 'package:salaryredesign/pages/employee/edit_profile.dart';
import 'package:salaryredesign/pages/employee/leave_request_page.dart';
import 'package:salaryredesign/pages/employee/permission_request_page.dart';
import 'package:salaryredesign/pages/employee_profile_detail.dart';
import 'package:salaryredesign/services/api_urls.dart';
import 'package:salaryredesign/services/webservices.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';

import '../settings/accessDenied.dart';

class MyRequest_Page extends StatefulWidget {
  const MyRequest_Page({Key? key}) : super(key: key);

  @override
  State<MyRequest_Page> createState() => _MyRequest_PageState();
}

class _MyRequest_PageState extends State<MyRequest_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: 'My Request', titlecenter: false),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            vSizedBox2,
            clickable_list(
              text: 'Leave Request',
              img: MyImages.leave_request_nw,
              colorborderleft: MyColors.secondarycolor,
              onTap: () async {

                push(context: context, screen: My_Leave_Request_Page());
              },
            ),
            clickable_list(
              text: 'Permission Request',
              img: 'assets/images/permission_request_nw-1.png',
              colorborderleft: MyColors.yellow,
              onTap: ()async{
                var res =await Webservices.getData(ApiUrls.permissionadd, context);
                log("Res -----${res.statusCode}");
                if(res.statusCode==422){
                  push(context: context, screen: AccessDenied(title: 'Permission Request',));
                }
                else if(res.statusCode==200){
                  var jsonResponse = convert.jsonDecode(res.body);
                  if(jsonResponse['success'].toString()=='true'){
                    push(context: context, screen: MyPermission_Request_Page());
                  }
                  else{

                  }

                }

                // var jsonResponse = convert.jsonDecode(res.body);
                // log("Res -----$jsonResponse");


                // push(context: context, screen: MyPermission_Request_Page());
              },
            ),
          ],
        ),
      ),
    );
  }
}
