import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';
import 'package:salaryredesign/widgets/dropdown.dart';

class OrganizationProfile extends StatefulWidget {
  const OrganizationProfile({Key? key}) : super(key: key);

  @override
  State<OrganizationProfile> createState() => _OrganizationProfileState();
}

class _OrganizationProfileState extends State<OrganizationProfile> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context: context, title: 'Organization Profile', titlecenter: false, ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainHeadingText(text: 'Organization Profile', fontFamily: 'bold', fontSize: 20,),
            vSizedBox4,
            MainHeadingText(text: 'Add Company Profile', fontSize: 16,),
            vSizedBox05,
            ParagraphText(text: 'Company Logo', fontSize: 14, color: MyColors.headingcolor,),
            vSizedBox,
            vSizedBox05,
            RoundEdgedButtonwithimage(text: 'UPLOAD A FILE', width: 160, image: 'assets/images/upload.png',  fontSize: 16, fontfamily: 'bold', borderRadius: 4,horizontalPadding: 0,  textColor: Colors.white, color: MyColors.primaryColor,),
            vSizedBox6,
            CustomTextField(controller: name, hintText: '', showlabel: true, label: 'Company Name',),
            vSizedBox2,
            CustomTextField(controller: name, hintText: '', showlabel: true, label: 'Name',),
            vSizedBox2,
            CustomTextField(controller: name, hintText: '', showlabel: true, label: 'Email',),
            vSizedBox2,
            CustomTextField(controller: name, hintText: '', showlabel: true, label: 'Mobile Number',),
            vSizedBox2,
            CustomTextField(controller: name, hintText: '', showlabel: true, label: 'Street Address',),
            vSizedBox2,
            CustomTextField(controller: name, hintText: '', showlabel: true, label: 'City',),
            vSizedBox2,
            CustomTextField(controller: name, hintText: '', showlabel: true, label: 'Pincode',),
            DropDwon(label: 'State', items: ['']),
            vSizedBox2,
            CustomTextField(controller: name, hintText: '', showlabel: true, label: 'Country',),
            vSizedBox2,
            CustomTextField(controller: name, hintText: '', showlabel: true, label: 'No Of Employees',),
            vSizedBox4,
            RoundEdgedButton(text: 'Update')
          ],
        ),
      ),
    );
  }
}
