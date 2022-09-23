import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/widgets/CustomLoader.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';
import 'package:salaryredesign/widgets/dropdown.dart';

import '../../providers/clock.dart';
import '../../services/api_urls.dart';
import '../../services/webservices.dart';
import '../../widgets/customtextfield.dart';
import '../../widgets/showSnackbar.dart';
import 'package:intl/intl.dart';

class Shift_Settings_Page extends StatefulWidget {
  const Shift_Settings_Page({Key? key}) : super(key: key);

  @override
  State<Shift_Settings_Page> createState() => _Shift_Settings_PageState();
}

class _Shift_Settings_PageState extends State<Shift_Settings_Page> {
  TextEditingController name = TextEditingController();
  TextEditingController shiftName = TextEditingController();
  TextEditingController start = TextEditingController();
  TextEditingController end = TextEditingController();
  TextEditingController grace = TextEditingController();
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String? shiftStart;
  String? shiftEnd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getShift();
  }

  getShift() async {
    await Provider.of<GlobalModal>(context, listen: false).getShift(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar:
          appBar(context: context, title: 'Shift Settings', titlecenter: false),
      body: SingleChildScrollView(
        child: Consumer<GlobalModal>(builder: (context, globalModal, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(30),
                  //   bottomRight: Radius.circular(30),
                  // )
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainHeadingText(
                          text: 'Shift Settings',
                          fontSize: 20,
                        ),
                        hSizedBox,
                        hSizedBox05,
                        if(globalModal.shiftPermission['add'])
                        RoundEdgedButton(
                          text: 'Add New',
                          verticalPadding: 0,
                          color: MyColors.primaryColor,
                          minWidth: 0,
                          height: 35,
                          onTap: () {
                            name.text='';
                            start.text='';
                            end.text='';
                            grace.text='';
                            startTime=null;
                            endTime=null;

                            bottomsheet(
                              height: 550,
                              context: context,
                              child: Scaffold(
                                body: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      vSizedBox4,
                                      MainHeadingText(
                                        text: 'Add Shift',
                                        fontSize: 20,
                                        color: MyColors.black,
                                      ),
                                      vSizedBox2,
                                      CustomTextField(
                                        controller: name,
                                        hintText: '',
                                        label: 'Shift Name',
                                        showlabel: true,
                                        labelcolor: MyColors.black,
                                      ),
                                      vSizedBox2,
                                      GestureDetector(
                                        onTap: () async {
                                          TimeOfDay? temp = await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now(),
                                            builder: (BuildContext context,
                                                Widget? child) {
                                              return MediaQuery(
                                                data: MediaQuery.of(context)
                                                    .copyWith(
                                                        alwaysUse24HourFormat:
                                                            false),
                                                child: child!,
                                              );
                                            },
                                          );
                                          if (temp != null) {
                                            startTime = temp;
                                            print('${startTime}');

                                            start.text = startTime
                                                .toString()
                                                .substring(10, 15);
                                            shiftStart=start.text;
                                            start.text='${DateFormat('h:mm a').format(DateTime.parse('2000-01-01 '+start.text))}';

                                          }

                                          // setState(() {});
                                        },
                                        child: CustomTextField(
                                          controller: start,
                                          hintText: '',
                                          label: 'Start Time',
                                          showlabel: true,
                                          labelcolor: MyColors.black,
                                          enabled: false,
                                        ),
                                      ),
                                      vSizedBox2,
                                      GestureDetector(
                                        onTap: () async {
                                          TimeOfDay? temp = await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now(),
                                            builder: (BuildContext context,
                                                Widget? child) {
                                              return MediaQuery(
                                                data: MediaQuery.of(context)
                                                    .copyWith(
                                                        alwaysUse24HourFormat:
                                                            false),
                                                child: child!,
                                              );
                                            },
                                          );
                                          if (temp != null) {
                                            endTime = temp;
                                            print('${endTime}');
                                            end.text = endTime
                                                .toString()
                                                .substring(10, 15);
                                            shiftEnd=end.text;

                                            end.text='${DateFormat('h:mm a').format(DateTime.parse('2000-01-01 '+end.text))}';
                                          }

                                          // setState(() {});
                                        },
                                        child: CustomTextField(
                                          controller: end,
                                          hintText: '',
                                          label: 'End time',
                                          showlabel: true,
                                          labelcolor: MyColors.black,
                                          enabled: false,
                                        ),
                                      ),
                                      vSizedBox2,
                                      CustomTextField(
                                        controller: grace,
                                        hintText: '',
                                        label: 'Grace Time (In Mins)',
                                        showlabel: true,
                                        labelcolor: MyColors.black,
                                        keyboardtype: TextInputType.number,

                                      ),
                                      vSizedBox2,
                                      Row(
                                        children: [
                                          Expanded(
                                            child: RoundEdgedButton(
                                              text: 'Cancel',
                                              color: MyColors.disabledcolor,
                                              textColor: MyColors.black,
                                              onTap: () {
                                                Navigator.pop(context);
                                                name.text='';
                                                start.text='';
                                                end.text='';
                                                grace.text='';

                                              },
                                            ),
                                          ),
                                          hSizedBox,
                                          Expanded(
                                            child: RoundEdgedButton(
                                              text: 'Save',
                                              onTap: () async {
                                                if (name.text == '') {
                                                  showSnackbar(context,
                                                      'Please Enter Shift name.');
                                                } else if (start.text == '') {
                                                  showSnackbar(context,
                                                      'Please Enter start time.');
                                                } else if (end.text == '') {
                                                  showSnackbar(context,
                                                      'Please Enter end time.');
                                                }
                                                else {
                                                  Map<String, dynamic> data = {
                                                  'name':name.text,
                                                  'start_time':shiftStart.toString(),
                                                'end_time':shiftEnd.toString(),
                                                'grace':grace.text==''?'0':grace.text
                                                  };
                                                  globalModal.loadingShow();
                                                  print('datat for api- ${data}');
                                                  var res =
                                                      await Webservices.postData(
                                                          apiUrl:
                                                              ApiUrls.storeShift,
                                                          body: data,
                                                          context: context);
                                                  globalModal.loadingHide();
                                                  Navigator.pop(context);
                                                  if (res['success'].toString() ==
                                                      'true') {

                                                    name.text='';
                                                    start.text='';
                                                    end.text='';
                                                    grace.text='';

                                                    globalModal.getShift(context);
                                                  }
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      vSizedBox4,
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    vSizedBox,
                  ],
                ),
              ),
              vSizedBox,
              globalModal.load?CustomLoader():SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     MainHeadingText(text: 'Summary'),
                      //       RoundEdgedButton(
                      //         text: 'Total Deduction Amount : 1000',
                      //         verticalPadding: 0,
                      //         horizontalPadding: 10,
                      //         // width: MediaQuery.of(context).size.width - 150,
                      //         fontSize: 14,
                      //         height: 35,
                      //         minWidth: 0,
                      //         fontfamily: 'regular',
                      //       ),
                      //   ],
                      // ),
                      vSizedBox,
                      for (var i = 0;
                          i < int.parse('${globalModal.shift.length}');
                          i++)
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MainHeadingText(
                                        text:
                                            '${globalModal.shift[i].shiftName.toString()}',
                                        // color: (i==0)?MyColors.primaryColor: MyColors.secondarycolor,
                                        fontFamily: 'semibold', fontSize: 16,
                                      ),
                                      vSizedBox05,
                                      MainHeadingText(
                                        text:
                                            '${DateFormat('h:mm a').format(DateTime.parse('2000-01-01 '+globalModal.shift[i].shiftStartTime.toString()))} - ${DateFormat('h:mm a').format(DateTime.parse('2000-01-01 '+globalModal.shift[i].shiftEndTime.toString()))}',
                                            // '${DateTime.now()}',
                                            // '${DateFormat.Hm().format(DateTime.parse('2000-01-01 '+globalModal.shift[i].shiftStartTime.toString()))}',
                                            // '${globalModal.shift[i].shiftStartTime.toString()} - ${globalModal.shift[i].shiftEndTime.toString()}',
                                        color: MyColors.black,
                                        fontSize: 20,
                                      ),
                                      vSizedBox05,
                                      Row(
                                        children: [
                                          Image.asset(
                                            MyImages.OT,
                                            height: 24,
                                            width: 24,
                                          ),
                                          hSizedBox05,
                                          ParagraphText(
                                            text: 'Grace Time :',
                                            fontSize: 14,
                                            color: MyColors.labelcolor,
                                          ),
                                          hSizedBox05,
                                          ParagraphText(
                                            text:
                                                '${globalModal.shift[i].shiftGraceTime.toString()} Mins',
                                            fontSize: 14,
                                            color: MyColors.labelcolor,
                                            fontFamily: 'bold',
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                if (globalModal.shiftPermission['edit'] ||
                                    globalModal.shiftPermission['delete'])
                                  PopupmenuButtonCustom(
                                    onTapedit: () {
                                      Navigator.pop(context);
                                      name.text=globalModal.shift[i].shiftName.toString();
                                      start.text='${DateFormat('h:mm a').format(DateTime.parse('2000-01-01 '+globalModal.shift[i].shiftStartTime.toString()))} ';
                                      end.text='${DateFormat('h:mm a').format(DateTime.parse('2000-01-01 '+globalModal.shift[i].shiftEndTime.toString()))} ';
                                      grace.text=globalModal.shift[i].shiftGraceTime.toString();
                                      shiftStart=globalModal.shift[i].shiftStartTime.toString();
                                      shiftEnd=globalModal.shift[i].shiftEndTime.toString();

                                      bottomsheet(
                                        height: 550,
                                        context: context,
                                        child: Scaffold(
                                          body: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                vSizedBox4,
                                                MainHeadingText(
                                                  text: 'Edit Shift',
                                                  fontSize: 20,
                                                  color: MyColors.black,
                                                ),
                                                vSizedBox2,
                                                CustomTextField(
                                                  controller: name,
                                                  hintText: '',
                                                  label: 'Shift Name',
                                                  showlabel: true,
                                                  labelcolor: MyColors.black,
                                                ),
                                                vSizedBox2,
                                                GestureDetector(
                                                  onTap: () async {
                                                    TimeOfDay? temp = await showTimePicker(
                                                      context: context,
                                                      initialTime: TimeOfDay.now(),
                                                      builder: (BuildContext context,
                                                          Widget? child) {
                                                        return MediaQuery(
                                                          data: MediaQuery.of(context)
                                                              .copyWith(
                                                              alwaysUse24HourFormat:
                                                              false),
                                                          child: child!,
                                                        );
                                                      },
                                                    );
                                                    if (temp != null) {
                                                      startTime = temp;
                                                      print('${startTime}');

                                                      start.text = startTime
                                                          .toString()
                                                          .substring(10, 15);
                                                      shiftStart=start.text;
                                                      start.text='${DateFormat('h:mm a').format(DateTime.parse('2000-01-01 '+start.text))}';

                                                    }

                                                    // setState(() {});
                                                  },
                                                  child: CustomTextField(
                                                    controller: start,
                                                    hintText: '',
                                                    label: 'Start Time',
                                                    showlabel: true,
                                                    labelcolor: MyColors.black,
                                                    enabled: false,
                                                  ),
                                                ),
                                                vSizedBox2,
                                                GestureDetector(
                                                  onTap: () async {
                                                    TimeOfDay? temp = await showTimePicker(
                                                      context: context,
                                                      initialTime: TimeOfDay.now(),
                                                      builder: (BuildContext context,
                                                          Widget? child) {
                                                        return MediaQuery(
                                                          data: MediaQuery.of(context)
                                                              .copyWith(
                                                              alwaysUse24HourFormat:
                                                              false),
                                                          child: child!,
                                                        );
                                                      },
                                                    );
                                                    if (temp != null) {
                                                      endTime = temp;
                                                      print('${endTime}');
                                                      end.text = endTime
                                                          .toString()
                                                          .substring(10, 15);
                                                      shiftEnd=end.text;

                                                      end.text='${DateFormat('h:mm a').format(DateTime.parse('2000-01-01 '+end.text))}';
                                                    }

                                                    // setState(() {});
                                                  },
                                                  child: CustomTextField(
                                                    controller: end,
                                                    hintText: '',
                                                    label: 'End time',
                                                    showlabel: true,
                                                    labelcolor: MyColors.black,
                                                    enabled: false,
                                                  ),
                                                ),
                                                vSizedBox2,
                                                CustomTextField(
                                                  controller: grace,
                                                  hintText: '',
                                                  label: 'Grace Time (In Mins)',
                                                  showlabel: true,
                                                  labelcolor: MyColors.black,
                                                  keyboardtype: TextInputType.number,
                                                ),
                                                vSizedBox2,
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: RoundEdgedButton(
                                                        text: 'Cancel',
                                                        color: MyColors.disabledcolor,
                                                        textColor: MyColors.black,
                                                        onTap: () {
                                                          Navigator.pop(context);
                                                          name.text='';
                                                          start.text='';
                                                          end.text='';
                                                          grace.text='';

                                                        },
                                                      ),
                                                    ),
                                                    hSizedBox,
                                                    Expanded(
                                                      child: RoundEdgedButton(
                                                        text: 'Save',
                                                        onTap: ()async {
                                                          if (name.text == '') {
                                                            showSnackbar(context,
                                                                'Please Enter Shift name.');
                                                          } else if (start.text == '') {
                                                            showSnackbar(context,
                                                                'Please Enter start time.');
                                                          } else if (end.text == '') {
                                                            showSnackbar(context,
                                                                'Please Enter end time.');
                                                          } else {
                                                            Map<String, dynamic> data = {
                                                              'id':globalModal.shift[i].id.toString(),
                                                              'name':name.text,
                                                              'start_time':shiftStart.toString(),
                                                              'end_time':shiftEnd.toString(),
                                                              'grace':grace.text==''?'0':grace.text
                                                            };
                                                            globalModal.loadingShow();
                                                            print('datat for api- ${data}');
                                                            var res =
                                                            await Webservices.postData(
                                                                apiUrl:
                                                                ApiUrls.updateShift,
                                                                body: data,
                                                                context: context);
                                                            globalModal.loadingHide();
                                                            Navigator.pop(context);
                                                            if (res['success'].toString() ==
                                                                'true') {

                                                              name.text='';
                                                              start.text='';
                                                              end.text='';
                                                              grace.text='';



                                                              globalModal.getShift(context);
                                                            }
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                vSizedBox4,
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    deletemain: 'Delete This Shift',
                                    deletesub:
                                        'Do you wish to delete this shift ?',
                                    isEdit: globalModal.shiftPermission['edit'],
                                    DeleteFun: () async {
                                      Map<String, dynamic> data = {
                                        'id': globalModal.shift[i].id.toString()
                                      };
                                      globalModal.loadingShow();
                                      var res = await Webservices.postData(
                                          apiUrl: ApiUrls.deleteShift,
                                          body: data,
                                          context: context);
                                      globalModal.loadingHide();
                                      showSnackbar(context, res['message']);
                                      globalModal.getShift(context);
                                      Navigator.pop(context);
                                    },
                                    isDelete:
                                        globalModal.shiftPermission['delete'],
                                  )
                              ],
                            ),
                            Divider(
                              height: 40,
                              color: Color(0xFFCAD8D8),
                            )
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
