import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/constans.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';
import 'package:salaryredesign/widgets/dropdown.dart';

import '../../constants/image_urls.dart';
import '../../constants/sized_box.dart';
import '../../widgets/avatar.dart';

class Add_Branch_Page extends StatefulWidget {
  const Add_Branch_Page({Key? key}) : super(key: key);

  @override
  State<Add_Branch_Page> createState() => _Add_Branch_PageState();
}


class _Add_Branch_PageState extends State<Add_Branch_Page> {

  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: appBar(context: context, title: 'Add Branches') ,
      body: SingleChildScrollView(
        child: Padding(
          padding: horizontal_pad,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vSizedBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vSizedBox4,
                  MainHeadingText(text: 'Add Branches' , color: MyColors.black,),
                  Column(
                    children: [
                      vSizedBox2,
                      CustomTextField(controller: name, hintText: '',
                        label: 'Branch Name',
                        showlabel: true,
                        labelcolor: MyColors.black,
                      ),
                      vSizedBox2,
                      CustomTextField(controller: name, hintText: '',
                        label: 'Search location on map',
                        showlabel: true,
                        labelcolor: MyColors.black,
                        prefixIcon: MyImages.search,
                        suffixheight: 24,
                      ),
                      vSizedBox2,
                      Image.asset(MyImages.google_map),
                      vSizedBox2,
                      CustomTextField(controller: name, hintText: '',
                        label: 'Branch Address',
                        showlabel: true,
                        labelcolor: MyColors.black,
                        maxLines: 3,
                      ),
                      vSizedBox2,
                      CustomTextField(controller: name, hintText: '',
                        label: 'Lattitude',
                        showlabel: true,
                        labelcolor: MyColors.black,
                      ),
                      vSizedBox2,
                      CustomTextField(controller: name, hintText: '',
                        label: 'Longitude',
                        showlabel: true,
                        labelcolor: MyColors.black,
                      ),
                      vSizedBox2,
                      CustomTextField(controller: name, hintText: '',
                        label: 'Limit Attendance Taking Radius (in meters)',
                        showlabel: true,
                        labelcolor: MyColors.black,
                      ),
                      vSizedBox2,
                      CustomTextField(controller: name, hintText: '',
                        label: 'Assign Branch Head / Branch Manager',
                        showlabel: true,
                        labelcolor: MyColors.black,
                        prefixIcon: MyImages.search,
                        suffixheight: 24,
                      ),
                      vSizedBox2,
                      RoundEdgedButton(
                          text: 'Save'
                      ),
                      vSizedBox4,
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
