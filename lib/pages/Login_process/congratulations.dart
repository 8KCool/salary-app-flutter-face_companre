import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/constans.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/Login_process/enter_details.dart';
// import 'package:salaryredesign/pages/my_profile.dart';
import 'package:salaryredesign/pages/tab_pages/dashboard.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/lists.dart';

import '../../constants/globalFunction.dart';
import '../../constants/globalkeys.dart';
import '../../providers/clock.dart';
import '../../services/api_urls.dart';
import '../tab_pages/bottom_tab.dart';
// import '../temp/single_page_controller.dart';
// import '../temp/tab_page_man.dart';
import '../webviewPages/new_web_view_tab.dart';
// import '../tab_pages/new_tab.dart';


final SimpleDialog dialog1 = SimpleDialog(
  backgroundColor: Colors.transparent,
  clipBehavior: Clip.antiAliasWithSaveLayer,
  insetPadding: EdgeInsets.all(0),
  contentPadding: EdgeInsets.all(0),
  // title: Text('Allow Liza to see', textAlign: TextAlign.center,),
  children: [
    SimpleDialogItem(),
  ],
);
class SimpleDialogItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return SimpleDialogOption(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height - 470,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: MyColors.primaryColor
          ),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ParagraphText(
              text: 'Choose Organization',
              fontSize: 20,
              fontFamily: 'bold',
              color: Colors.black,
            ),
            vSizedBox2,
            GestureDetector(
              onTap: (){
                push(context: context, screen: Enter_Detail_Page(phone: '',));
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: const Offset(
                                    0.0,
                                    4.0,
                                  ),
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                ),
                              ]
                          ),
                          child: Image.asset(
                            MyImages.organization_choose, height: 60, width: 60,)
                      ),
                      hSizedBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainHeadingText(text: 'EcomAds Private Limted', fontSize: 16, fontFamily: 'bold',),
                          vSizedBox05,
                          ParagraphText(text: 'Id : 687676EB89',
                            fontSize: 14,
                            color: Colors.black,
                          )
                        ],
                      )
                    ],
                  ),
                  Divider(height: 30,)
                ],
              ),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: const Offset(
                                    0.0,
                                    4.0,
                                  ),
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                ),
                              ]
                          ),
                          child: Image.asset(
                            MyImages.organization_choose, height: 60, width: 60,)
                      ),
                      hSizedBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainHeadingText(text: 'Ecom Apps Private Limited', fontSize: 16, fontFamily: 'bold',),
                          vSizedBox05,
                          ParagraphText(text: 'Id : 687676EB89',
                            fontSize: 14,
                            color: Colors.black,
                          )
                        ],
                      )
                    ],
                  ),
                  Divider(height: 30,)
                ],
              ),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: const Offset(
                                    0.0,
                                    4.0,
                                  ),
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                ),
                              ]
                          ),
                          child: Image.asset(
                            MyImages.organization_choose, height: 60, width: 60,)
                      ),
                      hSizedBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainHeadingText(text: 'Glow Jobs Private Limited', fontSize: 16, fontFamily: 'bold',),
                          vSizedBox05,
                          ParagraphText(text: 'Id : 687676EB89',
                            fontSize: 14,
                            color: Colors.black,
                          )
                        ],
                      )
                    ],
                  ),
                  Divider(height: 30,)
                ],
              ),
            ),

          ],
        ),
      ),
      // onPressed: onPressed,

    );
  }

  void setState(Null Function() param0) {}
}




class Congratulations_Page extends StatefulWidget {
  final bool isEmp;
  const Congratulations_Page({Key? key,required this.isEmp}) : super(key: key);

  @override
  State<Congratulations_Page> createState() => _Congratulations_PageState();
}

class _Congratulations_PageState extends State<Congratulations_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                vSizedBox4,
                vSizedBox4,
                Image.asset(MyImages.congrtulation, width: 276, ),
                vSizedBox4,
                vSizedBox4,
                MainHeadingText(
                  text: 'Congratulations!',
                  fontFamily: 'bold',
                  fontSize: 32,
                  color: MyColors.primaryColor,
                ),
                vSizedBox2,
                ParagraphText(
                  text: 'Your account has been created\nit’s time to make it yours.',
                  color: MyColors.labelcolor,
                  textAlign: TextAlign.center,
                  fontSize: 20,
                ),


              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RoundEdgedButton(
                    text: 'Personalize', textColor: Colors.white,
                    onTap: () async {
                      // showDialog<void>(context: context, builder: (context) => dialog1);
                      if(widget.isEmp){
                        // push(context: context, screen: newTabsPage());
                        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        //     newTabsPage()), (Route<dynamic> route) => false);
                        // push(context: context, screen: MyPorfile_Page());
                      }
                      else{
                        // usertoken='${await Provider.of<GlobalModal>(context, listen: false).userData!.token}';
                        // setWebWiewController(context,'${ApiUrls.siteBaseUrl}staff/dashboard');
                        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        //     Tabbarscreen(key:MyGlobalKeys.tabbarKey,)), (Route<dynamic> route) => false);
                        ///
                        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        // Tabbarscreen(key:MyGlobalKeys.tabbarKey,)), (Route<dynamic> route) => false);
                        ///
                        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        //     ManishHomePage()), (Route<dynamic> route) => false);
                        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        //     NewTabScreen()), (Route<dynamic> route) => false);
                        ///
                        ///
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                            NewTabScreen()), (Route<dynamic> route) => false);
                        ///

                      }

                    },
                  ),
                  vSizedBox,
                  RoundEdgedButton(
                    text: 'Skip',
                    textColor: MyColors.paragraphcolor,
                    fontfamily: 'regular',
                    color: Colors.transparent,
                    onTap: ()async{

                      // if(widget.isEmp){

                      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      //     TabsPage()), (Route<dynamic> route) => false);
                      usertoken='${await Provider.of<GlobalModal>(context, listen: false).userData!.token}';
                      // await setWebWiewController(context,'${ApiUrls.siteBaseUrl}staff/dashboard',globalSettingController);
                      // await setWebWiewController(context,'${ApiUrls.siteBaseUrl}staff/dashboard',globalmyAccountController);
                      ///
                      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      // Tabbarscreen(key:MyGlobalKeys.tabbarKey,)), (Route<dynamic> route) => false);
                      ///
                      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      //     ManishHomePage()), (Route<dynamic> route) => false);
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                          NewTabScreen()), (Route<dynamic> route) => false);
                      ///
                      // }
                      // else{
                      //
                      //   // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      //   //     TabsPage()), (Route<dynamic> route) => false);
                      //   usertoken='${await Provider.of<GlobalModal>(context, listen: false).userData!.token}';
                      //
                      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      // Tabbarscreen(key:MyGlobalKeys.tabbarKey,)), (Route<dynamic> route) => false);
                      // }

                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
