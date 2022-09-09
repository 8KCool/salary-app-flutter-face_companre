import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
// import 'package:salaryredesign/pages/employee/edit_profile.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';

import '../constants/globalkeys.dart';
import '../providers/clock.dart';
import '../services/api_urls.dart';
import '../services/webservices.dart';

class MyPorfile_Page extends StatefulWidget {
  const MyPorfile_Page({Key? key}) : super(key: key);

  @override
  State<MyPorfile_Page> createState() => _MyPorfile_PageState();
}

class _MyPorfile_PageState extends State<MyPorfile_Page> {
  getDetails()async{
    Map<String ,dynamic>data={

    };
    var res = await Webservices.postData(apiUrl: ApiUrls.qrattendance, body: data, context: context);
    print('res from api ${res}');
// await Provider.of<GlobalModal>(context, listen: false).addUserDetail(res['data'],context);

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context,
          implyLeading: false,
          title:Provider.of<GlobalModal>(context, listen: false).userData?.name.toString(),
          titlecenter: false),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            vSizedBox2,
            clickable_list(
              text: 'My Details', img: MyImages.emp1, colorborderleft: MyColors.secondarycolor,
              onTap: (){
                // push(context: context, screen: Edit_Employee_Profile_Page());
              },
            ),
            clickable_list(text: 'My Attendance', img: MyImages.emp2, colorborderleft: MyColors.yellow,),
            clickable_list(text: 'My Request', img: MyImages.emp3, colorborderleft: MyColors.red, ),
            clickable_list(text: 'Holiday List', img: MyImages.emp4, colorborderleft: MyColors.primaryColor, ),
          ],
        ),
      ),
    );
  }
}
