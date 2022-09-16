import 'dart:developer';
import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/settings/add_branch.dart';
import 'package:salaryredesign/pages/settings/edit_branch.dart';
import 'package:salaryredesign/services/webservices.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';
import 'package:salaryredesign/widgets/dropdown.dart';
import 'package:salaryredesign/widgets/showSnackbar.dart';

import '../../providers/clock.dart';
import '../../services/api_urls.dart';
import '../../widgets/CustomLoader.dart';
import '../../widgets/customtextfield.dart';

class Branch_Settings_Page extends StatefulWidget {
  const Branch_Settings_Page({Key? key}) : super(key: key);

  @override
  State<Branch_Settings_Page> createState() => _Branch_Settings_PageState();
}

class _Branch_Settings_PageState extends State<Branch_Settings_Page> {
  TextEditingController name = TextEditingController();
  List branchList=[];
  Map permissions={};
  getBranch()async{
    await Provider.of<GlobalModal>(context, listen: false).getBranch(context);

    //  var res =await Webservices.getData(ApiUrls.listBranch, context);
   //  log('res from api listBranch ---------------${res.body}');
   //  var result=res.body;
   //  log('result-----1--${result}');
   // var result1= convert.jsonDecode(result);
   //  log('result-----2--${result1["data"]}');
   //
   //  branchList=result1['data'];
   //  permissions=result1['permission'];
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBranch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Branches', titlecenter: false),
      body:Consumer<GlobalModal>(
        builder: (context,globalModal,child) {
      return globalModal.load?CustomLoader(): SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainHeadingText(text: 'Branches', fontSize: 20,),
                      hSizedBox,
                      hSizedBox05,
                      if(globalModal.branchPermission['add'])
                      RoundEdgedButton(
                        text: 'Add New',
                        verticalPadding: 0,
                        horizontalPadding: 0,
                        width: 100,
                        height: 35,
                        onTap: (){
                          push(context: context, screen: Add_Branch_Page(isEdit: false,));
                        },
                      )
                    ],
                  ),
                  vSizedBox,
                ],
              ),
            ),
            vSizedBox,
            if(globalModal.branchPermission['view'])
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 200,
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeadingText(text: 'Summary'),
                    vSizedBox4,
                    for(var i=0; i<int.parse('${globalModal.branch.length}'); i++)
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Image.asset(MyImages.map_green, height: 36, width: 36,),
                                vSizedBox,
                                MainHeadingText(text: '${globalModal.branch[i].radius.toString()}', fontSize: 14,),
                                vSizedBox05,
                                ParagraphText(text: 'Radius', fontSize: 14, color: MyColors.labelcolor,),
                              ],
                            ),
                            hSizedBox,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MainHeadingText(text:'${globalModal.branch[i].branchName.toString()}', fontSize: 16,),
                                  vSizedBox05,
                                  ParagraphText(
                                    text: '${globalModal.branch[i].branchAdd.toString()}',
                                    fontSize: 14,
                                    color: MyColors.labelcolor,
                                  ),
                                    vSizedBox,
                                  if(globalModal.branch[i].branchManager!=null)
                                  Row(
                                    children: [
                                      ParagraphText(text: 'Branch Manager', fontSize: 14, color: MyColors.black,),
                                      hSizedBox,
                                      ParagraphText(text: ': ${globalModal.branch[i].branchManager.toString()}', fontSize: 14, color: MyColors.primaryColor,),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                            if(globalModal.branchPermission['edit'] || globalModal.branchPermission['delete'])
                            PopupmenuButtonCustom(
                              onTapedit: (){
                                Navigator.pop(context);
                                push(context: context, screen: Add_Branch_Page(isEdit: true,id: globalModal.branch[i].id.toString(),));
                              },
                              deletemain: 'Delete This Branch',
                              deletesub: 'Do you wish to delete this Branch?',
                              isEdit: globalModal.branchPermission['edit'],
                              // isEdit: true,
                              isDelete:globalModal.branchPermission['delete'],
                              DeleteFun: () async{
                                Map<String,dynamic>data= {
                                  'id':globalModal.branch[i].id.toString()
                                  // 'id':'5',
                                };
                                globalModal.loadingShow();
                                var res =await Webservices.postData(apiUrl: ApiUrls.deleteBranch, body: data, context: context);
                                globalModal.loadingHide();
                                showSnackbar(context, res['message']);
                                globalModal.getBranch(context);
                                Navigator.pop(context);
                                // globalModal.
                              } ,
                            )

                          ],
                        ),
                        Divider(height: 40, color: Color(0xFFCAD8D8),)

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
      ),
    );
  }
}
