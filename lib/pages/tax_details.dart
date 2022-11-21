import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';
import 'package:salaryredesign/widgets/dropdown.dart';

class TaxDetails extends StatefulWidget {
  const TaxDetails({Key? key}) : super(key: key);

  @override
  State<TaxDetails> createState() => _TaxDetailsState();
}

class _TaxDetailsState extends State<TaxDetails> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context: context, title: 'Tax Details', titlecenter: false, ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainHeadingText(text: 'Tax Details', fontFamily: 'bold', fontSize: 20,),
            vSizedBox4,
            CustomTextField(controller: name, hintText: '', showlabel: true, label: 'Currency',),
            vSizedBox2,
            CustomTextField(controller: name, hintText: '', showlabel: true, label: 'GST Number',),
            vSizedBox2,
            CustomTextField(controller: name, hintText: '', showlabel: true, label: 'GST State',),
            vSizedBox2,
            CustomTextField(controller: name, hintText: '', showlabel: true, label: 'PAN Number',),
            vSizedBox2,
            CustomTextField(controller: name, hintText: '', showlabel: true, label: 'ESI Number',),
            vSizedBox2,
            CustomTextField(controller: name, hintText: '', showlabel: true, label: 'PF Number',),
            vSizedBox4,
            RoundEdgedButton(text: 'Submit')
          ],
        ),
      ),
    );
  }
}
