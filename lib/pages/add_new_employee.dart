import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';
import 'package:salaryredesign/widgets/dropdown.dart';

class Add_New_Employee extends StatefulWidget {
  const Add_New_Employee({Key? key}) : super(key: key);

  @override
  State<Add_New_Employee> createState() => _Add_New_EmployeeState();
}

bool next = false;

class _Add_New_EmployeeState extends State<Add_New_Employee> {
  TextEditingController text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Add New Employee'),
      body: DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: MyColors.white,
              child: TabBar(
                indicatorColor: MyColors.yellow,
                indicatorWeight: 3,
                tabs: <Widget>[
                  Tab(
                    child: Text('ADD NEW', style: TextStyle(
                      color: MyColors.black,
                      fontSize: 16,
                      fontFamily: 'bold'
                    ),),
                  ),
                  Tab(
                    child: Text('ADD BULK',style: TextStyle(
                        color: MyColors.black,
                        fontSize: 16,
                        fontFamily: 'bold'
                    ),),
                  ),
                ],
              ),
            ),
            vSizedBox,
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      color: MyColors.white,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          vSizedBox2,
                          if(next == false)
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: MyColors.secondarycolor,
                                    borderRadius: BorderRadius.circular(4)
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: GestureDetector(
                                    onTap: (){

                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(MyImages.contactbook, height: 25,),
                                        hSizedBox,
                                        ParagraphText(text: 'CHOOSE FROM CONTACT', fontSize: 16, fontFamily: 'semibold', color: MyColors.white,)
                                      ],
                                    ),
                                  ),
                                ),
                                vSizedBox,
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    alignment: Alignment.center,
                                    children: [
                                      Divider(height: 40, color: MyColors.black,),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        color: Colors.white,
                                        child: ParagraphText(text: 'OR', fontSize: 20,),
                                      )
                                    ],
                                  ),
                                ),
                                vSizedBox,
                                CustomTextField(
                                    controller: text,
                                    hintText: '',
                                  showlabel: true,
                                  label: 'Employee Name',
                                ),
                                vSizedBox,
                                CustomTextField(
                                  controller: text,
                                  hintText: '',
                                  showlabel: true,
                                  label: 'Mobile Number',
                                ),
                                vSizedBox2,
                                RoundEdgedButton(
                                    text: 'NEXT',
                                    onTap: (){
                                      setState((){
                                        next = true;
                                        // print('hello');
                                      });
                                    },
                                ),
                              ],
                            ),
                          ),
                          if(next == true)
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainHeadingText(text: 'Employee Preference',),
                                vSizedBox,
                                DropDwon(
                                  label: 'Select Branch',
                                ),
                                DropDwon(
                                  label: 'Select Shift',
                                ),
                                DropDwon(
                                  label: 'Select Salary Type',
                                ),
                                vSizedBox,
                                CustomTextField(
                                  controller: text,
                                  hintText: '',
                                  showlabel: true,
                                  label: 'Salary',
                                  labelcolor: MyColors.bordercolor,
                                ),
                                DropDwon(
                                  label: 'Select Pay Shedule',
                                ),
                                DropDwon(
                                  label: 'Select Role',
                                ),
                                vSizedBox2,
                                RoundEdgedButton(
                                  text: 'ADD EMPLOYEE',
                                  onTap: (){

                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: MyColors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          vSizedBox2,
                          MainHeadingText(text: 'Employee Preference',),
                          vSizedBox4,
                          ParagraphText(text: 'To add bulk contacts', fontSize: 20, color: MyColors.black, ),
                          vSizedBox2,
                          ParagraphText(text: '1. Download sample file', fontSize: 16, color: MyColors.labelcolor,),
                          vSizedBox,
                          ParagraphText(text: '2. Edit file as per the format and save it.', fontSize: 16, color: MyColors.labelcolor,),
                          vSizedBox,
                          ParagraphText(text: '3. Click upload button and choose file then click\n    upload contacts button', fontSize: 16, color: MyColors.labelcolor,),
                          vSizedBox,
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: GestureDetector(
                              onTap: (){

                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(MyImages.downloads, height: 25,),
                                  hSizedBox,
                                  ParagraphText(text: 'Download Sample FIle',
                                    fontSize: 16, fontFamily: 'semibold', color: MyColors.primaryColor,)
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: MyColors.secondarycolor,
                                borderRadius: BorderRadius.circular(4)
                            ),
                            padding: EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: (){

                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.file_upload_outlined, color: Colors.white,),
                                  hSizedBox,
                                  ParagraphText(text: 'UPLOAD FILE', fontSize: 16, fontFamily: 'semibold', color: MyColors.white,)
                                ],
                              ),
                            ),
                          ),
                          vSizedBox4,
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              list_with_icon(text: 'Cv.pdf', img: MyImages.filter, icon: true,),
                              Icon(Icons.close, size: 16,)
                            ],
                          ) ,
                          vSizedBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Opacity(opacity: 0.3,child: list_with_icon(text: 'Cv.pdf', img: MyImages.filter, icon: true,)),
                              Stack(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: MyColors.primaryColor.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                  Container(
                                    width: 28,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: MyColors.primaryColor,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                  )
                                ],
                              )
                            ],
                          ) ,
                          vSizedBox8,
                          
                          RoundEdgedButton(text: 'ADD EMPLOYEE BULK')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ), 
          ],
        ),
      ),
    )
    );
  }
}
