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

class Announcement_Page extends StatefulWidget {
  const Announcement_Page({Key? key}) : super(key: key);

  @override
  State<Announcement_Page> createState() => _Announcement_PageState();
}


class _Announcement_PageState extends State<Announcement_Page> {

  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: appBar(context: context,titlecenter: false, title: 'Announcement') ,
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
                  Column(
                    children: [
                      DropDwon(
                        items: ['Branch 1','Branch 2',],
                        label: 'Branch',
                        labelcolor: MyColors.black,
                        fontsize: 16,
                      ),
                      DropDwon(
                        items: ['Department 1','Department 2',],
                        label: 'Department',
                        labelcolor: MyColors.black,
                        fontsize: 16,
                      ),
                      vSizedBox2,
                      CustomTextField(controller: name, hintText: '',
                        label: 'Message',
                        showlabel: true,
                        labelcolor: MyColors.black,
                        maxLines: 3,
                        labelfont: 16,
                      ),
                      vSizedBox2,
                      RoundEdgedButton(
                          text: 'Send Announcement'
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
