import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';
import 'package:salaryredesign/widgets/dropdown.dart';
import 'package:salaryredesign/widgets/dropdownbottomsheet.dart';

import '../../widgets/customtextfield.dart';

class AddSalaryTemplate extends StatefulWidget {
  const AddSalaryTemplate({Key? key}) : super(key: key);

  @override
  State<AddSalaryTemplate> createState() => _AddSalaryTemplateState();
}

enum SingingCharacter { lafayette, jefferson }

class _AddSalaryTemplateState extends State<AddSalaryTemplate> {
  TextEditingController name = TextEditingController();
  SingingCharacter? _character = SingingCharacter.lafayette;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Add Salary Template', titlecenter: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  CustomTextField(controller: name, hintText: '', showlabel: true, label: 'Template Name'),
                  vSizedBox,
                ],
              ),
            ),
            vSizedBox,
            Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vSizedBox,
                  Row(
                    children: [
                      Expanded(
                        child: MainHeadingText(text: 'Earnings', fontFamily: 'bold', fontSize: 16,),
                      ),
                      RoundEdgedButton(text: 'ADD', minWidth: 60, horizontalPadding: 0, height: 33,)
                    ],
                  ),
                  vSizedBox2,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainHeadingText(text: 'Basic', fontSize: 14, color: MyColors.black,),
                      vSizedBox05,
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: MyColors.bordercolor
                                  ),
                                  borderRadius: BorderRadius.circular(4)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: CustomTextField(isBorder: false, controller: name, hintText: '', height: 50, showlabel: false),
                                  ),
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Color(0xFEF3F4F6),
                                            border: Border(
                                                left: BorderSide(
                                                    color: MyColors.bordercolor
                                                )
                                            )
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            PopupMenuButton(
                                              child: MainHeadingText(text: '% of Salary', fontSize: 14, color: Color(0xFE4B5563),),
                                              elevation: 2,
                                              offset: Offset(-30, 0),
                                              padding: EdgeInsets.all(0),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(0)),
                                              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                                                const PopupMenuItem(
                                                  child: ListTile(
                                                    contentPadding: EdgeInsets.all(0),
                                                    visualDensity:
                                                    VisualDensity(horizontal: -4, vertical: -4),
                                                    title: Text('% of Salary'),
                                                  ),
                                                ),
                                                const PopupMenuItem(
                                                  child: ListTile(
                                                    contentPadding: EdgeInsets.all(0),
                                                    visualDensity:
                                                    VisualDensity(horizontal: -4, vertical: -4),
                                                    title: Text('Fixed Amount'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Icon(Icons.expand_more_rounded)
                                          ],
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Icon(Icons.close, color: MyColors.black,),
                          )
                        ],
                      )
                    ],
                  ),
                  vSizedBox2,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainHeadingText(text: 'HRA', fontSize: 14, color: MyColors.black,),
                      vSizedBox05,
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: MyColors.bordercolor
                                  ),
                                  borderRadius: BorderRadius.circular(4)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: CustomTextField(isBorder: false, controller: name, hintText: '', height: 50, showlabel: false),
                                  ),
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Color(0xFEF3F4F6),
                                            border: Border(
                                                left: BorderSide(
                                                    color: MyColors.bordercolor
                                                )
                                            )
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            MainHeadingText(text: 'Fixed Amount', fontSize: 14, color: Color(0xFE4B5563),),
                                            Icon(Icons.expand_more_rounded)
                                          ],
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Icon(Icons.close, color: MyColors.red,),
                          ),
                        ],
                      ),
                      vSizedBox2
                    ],
                  ),

                ],
              ),
            ),
            vSizedBox,
            Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainHeadingText(text: 'Deductions', fontSize: 18, fontFamily: 'bold',),
                  vSizedBox2,
                  vSizedBox,
                  DropDownBottomSheet(label: 'TDS', hint: 'Disable', func: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    )
                                ),
                                height: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    vSizedBox4,
                                    MainHeadingText(text: 'TDS', fontSize: 16, fontFamily: 'semibold',),
                                    vSizedBox2,
                                    ListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      title: Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                            height: 10,
                                            child: Radio<SingingCharacter>(
                                              value: SingingCharacter.lafayette,
                                              groupValue: _character,
                                              onChanged: (SingingCharacter? value) {
                                                setState(() {
                                                  _character = value;
                                                });
                                              },
                                            ),
                                          ),
                                          hSizedBox,
                                          Text('Enable', style: TextStyle(fontSize: 16, fontFamily: 'bold'),),
                                        ],
                                      ),
                                    ),
                                    ListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      title: Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                            height: 10,
                                            child: Radio<SingingCharacter>(
                                              value: SingingCharacter.jefferson,
                                              groupValue: _character,
                                              onChanged: (SingingCharacter? value) {
                                                setState(() {
                                                  _character = value;
                                                });
                                              },
                                            ),
                                          ),
                                          hSizedBox,
                                          Text('Disable', style: TextStyle(fontSize: 16, fontFamily: 'bold'),),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                        );
                      },
                    );
                  }),
                  vSizedBox2,
                  DropDownBottomSheet(label: 'PF', hint: 'None', func: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    )
                                ),
                                height: 400,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    vSizedBox4,
                                    MainHeadingText(text: 'PF', fontSize: 16, fontFamily: 'semibold',),
                                    vSizedBox2,
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                          height: 10,
                                          child: Radio<SingingCharacter>(
                                            value: SingingCharacter.lafayette,
                                            groupValue: _character,
                                            onChanged: (SingingCharacter? value) {
                                              setState(() {
                                                _character = value;
                                              });
                                            },
                                          ),
                                        ),
                                        hSizedBox,
                                        Text('None', style: TextStyle(fontSize: 16, fontFamily: 'bold'),),
                                      ],
                                    ),
                                    vSizedBox2,
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                          height: 10,
                                          child: Radio<SingingCharacter>(
                                            value: SingingCharacter.jefferson,
                                            groupValue: _character,
                                            onChanged: (SingingCharacter? value) {
                                              setState(() {
                                                _character = value;
                                              });
                                            },
                                          ),
                                        ),
                                        hSizedBox,
                                        Text('Restrict Maximum Employee Contribution', style: TextStyle(fontSize: 16, fontFamily: 'bold'),),
                                      ],
                                    ),
                                    vSizedBox2,
                                    Padding(
                                      padding: EdgeInsets.only(left: 20, right: MediaQuery.of(context).size.width - 250),
                                      child: CustomTextField(controller: name, hintText: ''),
                                    ),
                                    vSizedBox2,
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                          height: 10,
                                          child: Radio<SingingCharacter>(
                                            value: SingingCharacter.jefferson,
                                            groupValue: _character,
                                            onChanged: (SingingCharacter? value) {
                                              setState(() {
                                                _character = value;
                                              });
                                            },
                                          ),
                                        ),
                                        hSizedBox,
                                        Text('12% Variable', style: TextStyle(fontSize: 16, fontFamily: 'bold'),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        hSizedBox,
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.white,
                                              value: isChecked,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  isChecked = value!;
                                                });
                                              },
                                            ),
                                            ParagraphText(text: 'Basics', color: MyColors.black, fontFamily: 'bold',)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.white,
                                              value: isChecked,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  isChecked = value!;
                                                });
                                              },
                                            ),
                                            ParagraphText(text: 'HRA', color: MyColors.black, fontFamily: 'bold',)
                                          ],
                                        ),
                                      ],
                                    ),
                                    vSizedBox2,
                                    RoundEdgedButton(text: 'SAVE')
                                  ],
                                ),
                              );
                            }
                        );
                      },
                    );
                  }),
                  vSizedBox2,
                  DropDownBottomSheet(label: 'ESI', hint: 'None', func: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    )
                                ),
                                height: 280,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    vSizedBox4,
                                    MainHeadingText(text: 'ESI', fontSize: 16, fontFamily: 'semibold',),
                                    vSizedBox2,
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                          height: 10,
                                          child: Radio<SingingCharacter>(
                                            value: SingingCharacter.lafayette,
                                            groupValue: _character,
                                            onChanged: (SingingCharacter? value) {
                                              setState(() {
                                                _character = value;
                                              });
                                            },
                                          ),
                                        ),
                                        hSizedBox,
                                        Text('None', style: TextStyle(fontSize: 16, fontFamily: 'bold'),),
                                      ],
                                    ),
                                    vSizedBox2,
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                          height: 10,
                                          child: Radio<SingingCharacter>(
                                            value: SingingCharacter.jefferson,
                                            groupValue: _character,
                                            onChanged: (SingingCharacter? value) {
                                              setState(() {
                                                _character = value;
                                              });
                                            },
                                          ),
                                        ),
                                        hSizedBox,
                                        Text('3.25% Variable', style: TextStyle(fontSize: 16, fontFamily: 'bold'),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        hSizedBox,
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.white,
                                              value: isChecked,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  isChecked = value!;
                                                });
                                              },
                                            ),
                                            ParagraphText(text: 'Basics', color: MyColors.black, fontFamily: 'bold',)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.white,
                                              value: isChecked,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  isChecked = value!;
                                                });
                                              },
                                            ),
                                            ParagraphText(text: 'HRA', color: MyColors.black, fontFamily: 'bold',)
                                          ],
                                        ),
                                      ],
                                    ),
                                    vSizedBox2,
                                    RoundEdgedButton(text: 'SAVE')
                                  ],
                                ),
                              );
                            }
                        );
                      },
                    );
                  }),
                  vSizedBox,
                  DropDwon(items: ['Disable'], label: 'PF',),
                ],
              ),
            ),
            vSizedBox,
            Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainHeadingText(text: 'Employer Contribution Rate', fontSize: 18, fontFamily: 'bold',),
                  vSizedBox4,
                  DropDownBottomSheet(label: 'PF', hint: 'None', func: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    )
                                ),
                                height: 400,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    vSizedBox4,
                                    MainHeadingText(text: 'PF', fontSize: 16, fontFamily: 'semibold',),
                                    vSizedBox2,
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                          height: 10,
                                          child: Radio<SingingCharacter>(
                                            value: SingingCharacter.lafayette,
                                            groupValue: _character,
                                            onChanged: (SingingCharacter? value) {
                                              setState(() {
                                                _character = value;
                                              });
                                            },
                                          ),
                                        ),
                                        hSizedBox,
                                        Text('None', style: TextStyle(fontSize: 16, fontFamily: 'bold'),),
                                      ],
                                    ),
                                    vSizedBox2,
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                          height: 10,
                                          child: Radio<SingingCharacter>(
                                            value: SingingCharacter.jefferson,
                                            groupValue: _character,
                                            onChanged: (SingingCharacter? value) {
                                              setState(() {
                                                _character = value;
                                              });
                                            },
                                          ),
                                        ),
                                        hSizedBox,
                                        Text('Restrict Maximum Employee Contribution', style: TextStyle(fontSize: 16, fontFamily: 'bold'),),
                                      ],
                                    ),
                                    vSizedBox2,
                                    Padding(
                                      padding: EdgeInsets.only(left: 20, right: MediaQuery.of(context).size.width - 250),
                                      child: CustomTextField(controller: name, hintText: ''),
                                    ),
                                    vSizedBox2,
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                          height: 10,
                                          child: Radio<SingingCharacter>(
                                            value: SingingCharacter.jefferson,
                                            groupValue: _character,
                                            onChanged: (SingingCharacter? value) {
                                              setState(() {
                                                _character = value;
                                              });
                                            },
                                          ),
                                        ),
                                        hSizedBox,
                                        Text('12% Variable', style: TextStyle(fontSize: 16, fontFamily: 'bold'),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        hSizedBox,
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.white,
                                              value: isChecked,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  isChecked = value!;
                                                });
                                              },
                                            ),
                                            ParagraphText(text: 'Basics', color: MyColors.black, fontFamily: 'bold',)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.white,
                                              value: isChecked,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  isChecked = value!;
                                                });
                                              },
                                            ),
                                            ParagraphText(text: 'HRA', color: MyColors.black, fontFamily: 'bold',)
                                          ],
                                        ),
                                      ],
                                    ),
                                    vSizedBox2,
                                    RoundEdgedButton(text: 'SAVE')
                                  ],
                                ),
                              );
                            }
                        );
                      },
                    );
                  }),
                  vSizedBox2,
                  DropDownBottomSheet(label: 'ESI', hint: 'None', func: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    )
                                ),
                                height: 280,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    vSizedBox4,
                                    MainHeadingText(text: 'ESI', fontSize: 16, fontFamily: 'semibold',),
                                    vSizedBox2,
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                          height: 10,
                                          child: Radio<SingingCharacter>(
                                            value: SingingCharacter.lafayette,
                                            groupValue: _character,
                                            onChanged: (SingingCharacter? value) {
                                              setState(() {
                                                _character = value;
                                              });
                                            },
                                          ),
                                        ),
                                        hSizedBox,
                                        Text('None', style: TextStyle(fontSize: 16, fontFamily: 'bold'),),
                                      ],
                                    ),
                                    vSizedBox2,
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                          height: 10,
                                          child: Radio<SingingCharacter>(
                                            value: SingingCharacter.jefferson,
                                            groupValue: _character,
                                            onChanged: (SingingCharacter? value) {
                                              setState(() {
                                                _character = value;
                                              });
                                            },
                                          ),
                                        ),
                                        hSizedBox,
                                        Text('3.25% Variable', style: TextStyle(fontSize: 16, fontFamily: 'bold'),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        hSizedBox,
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.white,
                                              value: isChecked,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  isChecked = value!;
                                                });
                                              },
                                            ),
                                            ParagraphText(text: 'Basics', color: MyColors.black, fontFamily: 'bold',)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.white,
                                              value: isChecked,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  isChecked = value!;
                                                });
                                              },
                                            ),
                                            ParagraphText(text: 'HRA', color: MyColors.black, fontFamily: 'bold',)
                                          ],
                                        ),
                                      ],
                                    ),
                                    vSizedBox2,
                                    RoundEdgedButton(text: 'SAVE')
                                  ],
                                ),
                              );
                            }
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
            vSizedBox2,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RoundEdgedButton(text: 'Save Template'),
            )
          ],
        ),
      ),
    );
  }
}
