import 'dart:developer';
import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/employee/personal_details.dart';
import 'package:salaryredesign/pages/employee/work.dart';
import 'package:salaryredesign/providers/newProvider.dart';
import 'package:salaryredesign/services/api_urls.dart';

import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/customLoader.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';

import '../../providers/clock.dart';
import '../../services/webservices.dart';
import '../../widgets/CustomCircularImage.dart';
import '../../widgets/avatar.dart';
import '../employee_profile_detail.dart';
import '../face_recognition/face_recognition_start_page.dart';
import '../settings/holiday_calender.dart';
import 'bank_upi_page.dart';
import 'edit_profile.dart';
import 'my_request.dart';


class Employee_dashboard_Page extends StatefulWidget {
  const Employee_dashboard_Page({Key? key}) : super(key: key);

  @override
  State<Employee_dashboard_Page> createState() => _Employee_dashboard_PageState();
}

class _Employee_dashboard_PageState extends State<Employee_dashboard_Page> {
  // Map dashBoardData={};
  bool load=false;
  @override
  void initState() {
    // TODO: implement initState
    getDetail();
    print('img--------------${Provider.of<GlobalModal>(context, listen: false).userData!.profile_img}');
    super.initState();
  }
  getDetail()async{

    // Provider.of<GlobalModal>(context, listen: false).loadingShow();
    // setState(() {
    //   load=true;
    // });
    Provider.of<PermissionModal>(context, listen: false).load=true;
    // Provider.of<GlobalModal>(context, listen: false).loadingShow();


    var res = await Webservices.getData(ApiUrls.getNewProfile,context);

    log('res from new api -----------$res');
    var jsonResponse = convert.jsonDecode(res.body);
    log('res from new api -----------$jsonResponse');
    // dashBoardData=jsonResponse['data'];
    Provider.of<PermissionModal>(context, listen: false).getPermission(jsonResponse['data']);

    Provider.of<PermissionModal>(context, listen: false).load=false;
    // Provider.of<GlobalModal>(context, listen: false).loadingHide();

    // setState(() {
    //   load=false;
    // });
    // Provider.of<GlobalModal>(context, listen: false).loadingHide();
    // setState(() {
    //
    // });
    // await Provider.of<GlobalModal>(context, listen: false).addUserDetail(jsonResponse,context);


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(
          context: context,
          titlecenter: false,
          title: 'Salary',
          appBarColor: MyColors.white,
          titleColor: MyColors.black,
        fontsize: 20,
        fontfamily: 'bold',
        implyLeading: false,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(MyImages.logo2, height: 38,),
          ],
        ),

      ),
      body: SingleChildScrollView(
        child: Container(

          child: Column(
            children: [
              Consumer<GlobalModal>(
                builder: (context,globalModal,child) {
                  return Container(
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
                            if(globalModal.userData!.profile_img!='')
                            Container(
                              child: CustomCircularImage(
                                // borderradius: 100,
                                // image:MyImages.logo2,
                                // image:'${dashBoardData['profileImage']??'https://etaskers.com/public/assets/company_logo/No_Image_Available.jpg'}',
                                // isnetwork: true,
                                height: 100,
                                width: 100, imageUrl:globalModal.userData!.profile_img,
                                fileType: CustomFileType.network,
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
                          text: globalModal.userData!.name??'',
                          // text: '${dashBoardData['name']}',
                          fontSize: 20,
                          fontFamily: 'semibold',
                          color: MyColors.white,
                        ),
                        vSizedBox05,
                        ParagraphText(
                          text: globalModal.userData!.companyName??'',
                          // text: '${dashBoardData['company_name']??''}',
                          fontSize: 14,
                          color: MyColors.white,
                        ),
                        vSizedBox2,
                      ],
                    ),
                  );
                }
              ),
              vSizedBox2,
              Consumer<PermissionModal>(
                builder: (context,permissionModal,child) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child:permissionModal.load?CustomLoader(): Column(
                      children: [
                        if(permissionModal.dashboardMenuPermission['profileemenu'].toString()=='1')

                          clickable_list(
                          text: 'Personal Detail',
                          image: false,
                          colorborderleft: MyColors.primaryColor,
                          onTap: ()async{
                            await push(context: context, screen: Personal_details_Page());
                            getDetail();
                          },
                        ),
                        if(permissionModal.dashboardMenuPermission['workmenu'].toString()=='1')
                          clickable_list(
                            text: 'Work',
                            image: false,
                            img: MyImages.emp2,
                            colorborderleft: MyColors.red,
                            onTap: (){
                              push(context: context, screen: Employee_Work_Details());
                            },
                          ),
                        if(permissionModal.dashboardMenuPermission['Bankmenu'].toString()=='1')

                          clickable_list(
                            text: 'Bank / UPI',
                            image: false,
                            img: MyImages.emp3,
                            colorborderleft: MyColors.secondarycolor,
                            onTap: (){
                              push(context: context, screen: Bank_UPI_Page());
                            },
                          ),

                        Row(
                          children: [
                            if(permissionModal.dashboardMenuPermission['myattendancemenu'].toString()=='1')

                              Expanded(
                                child: clickable_list_horizontal(
                                  text: 'My Attendance',
                                  img: MyImages.emp2,
                                  colorborderleft: MyColors.primaryColor,
                                  image_vert: true,
                                  image: false,
                                  fontSize: 14,
                                  onTap: (){
                                    push(context: context, screen: Employee_Profile_Details());
                                  },
                                ),
                              ),
                            hSizedBox,
                            if(permissionModal.dashboardMenuPermission['myrequestemenu'].toString()=='1')

                              Expanded(
                                child: clickable_list_horizontal(
                                  text: 'My Request',
                                  fontSize: 14,
                                  img: MyImages.emp3,
                                  colorborderleft: Color(0xFFCA8A04),
                                  image_vert: true,
                                  image: false,
                                  onTap: (){
                                    push(context: context, screen: MyRequest_Page());
                                  },
                                ),
                              ),

                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: clickable_list_horizontal(
                                text: 'Holiday List',
                                img: MyImages.emp4,
                                colorborderleft: MyColors.green,
                                fontSize: 14,
                                image_vert: true,
                                image: false,
                                onTap: (){
                                  push(context: context, screen: Holiday_Calender_Page());
                                },
                              ),
                            ),
                            hSizedBox,
                            if(permissionModal.dashboardMenuPermission['faceattendancemenu'].toString()=='1')
                              Expanded(
                                child: clickable_list_horizontal(
                                  text: 'Face Recognition',
                                  img: MyImages.face_detect,
                                  colorborderleft: MyColors.orange,
                                  image_vert: true,
                                  image: false,
                                  fontSize: 14,
                                  badge: true,
                                  onTap: (){
                                    push(context: context, screen: Face_Recognition_Start_Page());
                                  },
                                ),
                              ),

                          ],
                        ),


                      ],
                    ),
                  );
                }
              ),

            ],
          ),
        ),
      )
    );
  }
}
