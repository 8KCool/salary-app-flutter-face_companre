import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';
import 'package:salaryredesign/widgets/dropdown.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context: context, title: 'Select Language', titlecenter: false, ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainHeadingText(text: 'Select Language', fontFamily: 'bold', fontSize: 20,),
            vSizedBox4,
            RoundEdgedButton(text: 'English', fontfamily: 'bold', textColor: MyColors.headingcolor, fontSize: 20, borderRadius: 16, bordercolor: MyColors.headingcolor, color: Color(0xFEDBEAFE),),
            vSizedBox2,
            RoundEdgedButton(text: 'Tamil', fontfamily: 'bold', textColor: MyColors.headingcolor, fontSize: 20, borderRadius: 16, bordercolor: MyColors.headingcolor, color: Color(0xFEDBEAFE),),
            vSizedBox2,
            RoundEdgedButton(text: 'Hindi', fontfamily: 'bold', textColor: MyColors.headingcolor, fontSize: 20, borderRadius: 16, bordercolor: MyColors.headingcolor, color: Color(0xFEDBEAFE),),
            vSizedBox2,
            RoundEdgedButton(text: 'Malayalam', fontfamily: 'bold', textColor: MyColors.headingcolor, fontSize: 20, borderRadius: 16, bordercolor: MyColors.headingcolor, color: Color(0xFEDBEAFE),),
            vSizedBox2,
            RoundEdgedButton(text: 'Telugu', fontfamily: 'bold', textColor: MyColors.headingcolor, fontSize: 20, borderRadius: 16, bordercolor: MyColors.headingcolor, color: Color(0xFEDBEAFE),),
            vSizedBox2,
            RoundEdgedButton(text: 'Kannada', fontfamily: 'bold', textColor: MyColors.headingcolor, fontSize: 20, borderRadius: 16, bordercolor: MyColors.headingcolor, color: Color(0xFEDBEAFE),),
          ],
        ),
      ),
    );
  }
}
