import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/providers/clock.dart';
import 'package:salaryredesign/widgets/CustomLoader.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';

import '../constants/colors.dart';
import '../constants/image_urls.dart';
import '../constants/sized_box.dart';
import '../services/api_urls.dart';
import '../services/webservices.dart';
import 'custom_widgets.dart';
import 'dart:convert' as convert;
import 'package:intl/intl.dart';

class BottomSheetPage extends StatefulWidget {
  final DateTime selectedDay;
  const BottomSheetPage({Key? key , required this.selectedDay}) : super(key: key);

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  Map data={};


  getData()async{
    print("selectedDay-------------${widget.selectedDay}");
    Provider.of<GlobalModal>(context, listen: false).loadingShow();
    // globalModal.loadingShow();
    var res=await Webservices.getData('${ApiUrls.attendancedetail}?date=${widget.selectedDay}', context);

    var jsonResponse = convert.jsonDecode(res.body);
    Provider.of<GlobalModal>(context, listen: false).loadingHide();
    log("res ------------wwww-----$jsonResponse");
    if(jsonResponse['success'].toString()=='true' && jsonResponse['data']!='')
    data=jsonResponse['data'];


  }
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalModal>(
      builder: (context,globalModal,child) {
        return globalModal.load?CustomLoader():Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            vSizedBox4,
            Center(
              child: MainHeadingText(
                text: '${DateFormat('yyyy-MM-dd ').format(widget.selectedDay)}',
              ),
            ),
            vSizedBox2,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Chip_Custom(
                    background:
                    data['status']=='1'?MyColors.green:data['status']=='2'?MyColors.primaryColor:data['status']=='3'?MyColors.red:data['status']=='4'?MyColors.primaryColor:data['status']=='5'?MyColors.primaryColor:data['status']=='6'?Colors.greenAccent:data['status']=='7'?MyColors.primaryColor:data['status']=='8'?MyColors.primaryColor:data['status']=='9'?MyColors.primaryColor:data['status']=='10'?MyColors.primaryColor:data['status']=='11'?MyColors.secondarycolor:data['status']=='12'?Colors.grey:data['status']=='13'?MyColors.primaryColor:MyColors.primaryColor,
                    text:
                    data['status']=='1'?'Present':data['status']=='2'?'FULL DAY':data['status']=='3'?'Absent':data['status']=='4'?'HALFDAY':data['status']=='5'?'PAID LEAVE':data['status']=='6'?'UNPAID LEAVE':data['status']=='7'?'DAY OFF':data['status']=='8'?'FORGOT OUT':data['status']=='9'?'EARLYOUT':data['status']=='10'?'LATEENTRY':data['status']=='11'?'PUBLIC HOLIDAY':data['status']=='12'?'WEEKOFF':data['status']=='13'?'LEAVEREQUEST':'SHORT HOURS'


                ),
                hSizedBox,

              ],
            ),
            vSizedBox4,

            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        children: [
                          ParagraphText(
                            text: '${data['inTime']??'-'}',
                            fontSize: 24,
                            fontFamily: 'bold',
                            color: MyColors.primaryColor,
                          ),
                          hSizedBox,
                          // Image.asset(
                          //   MyImages.punch_edit,
                          //   height: 24,
                          // ),
                        ],
                      ),
                      vSizedBox05,
                      ParagraphText(
                        text: 'PUNCH IN',
                        fontSize: 16,
                        fontFamily: 'bold',
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      ParagraphText(
                        text: '${data['outTime']??'-'}',
                        fontSize: 24,
                        fontFamily: 'bold',
                        color: MyColors.primaryColor,
                      ),
                      vSizedBox05,
                      ParagraphText(
                        text: 'PUNCH OUT',
                        fontSize: 16,
                        fontFamily: 'bold',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            vSizedBox4,
            if(data['Incurrent_location']!=null)
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Image.asset(
                      MyImages.map,
                      height: 24,
                    ),
                    hSizedBox,
                    Expanded(
                      child: ParagraphText(
                        text:
                        '${data['Incurrent_location']??''}',
                        color: MyColors.paragraphcolor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            vSizedBox,
            if(data['Outcurrent_location']!=null)
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0),

                child: Row(
                  children: [
                    Image.asset(
                      MyImages.map,
                      height: 24,
                    ),
                    hSizedBox,
                    Expanded(
                      child: ParagraphText(
                        text:
                        '${data['Outcurrent_location']??''}',
                        color: MyColors.paragraphcolor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            vSizedBox,
            // Center(
            //   child: ParagraphText(
            //     text: 'PUNCH OUT TIME CORRECTION PENDING',
            //     color: MyColors.red,
            //     fontSize: 16,
            //     fontFamily: 'regular',
            //   ),
            // ),
            Divider(
              height: 30,
            ),
            // MainHeadingText(
            //   text: 'Change Status',
            // ),
            // vSizedBox,
            // Row(
            //   children: [
            //     Chip_Custom(text: 'PRESENT'),
            //     hSizedBox,
            //     Chip_Custom(text: 'FULL DAY'),
            //     hSizedBox,
            //     Chip_Custom(
            //       text: 'HALF DAY',
            //       background: Color(0xFFFEF9C3),
            //       textcolor: Color(0xFFCD8A04),
            //     ),
            //   ],
            // ),
            // vSizedBox,
            // Row(
            //   children: [
            //     Chip_Custom(
            //       text: 'ABSENT',
            //       background: MyColors.red.withOpacity(0.1),
            //       textcolor: MyColors.red,
            //     ),
            //     hSizedBox,
            //     Chip_Custom(
            //       text: 'PAID LEAVE',
            //       textcolor: Color(0xFF4872EC),
            //       background: Color(0xFFDBEAFE),
            //     ),
            //     hSizedBox,
            //     Chip_Custom(
            //       text: 'UN.P LEAVE',
            //       background: Color(0xFFCCFBF1),
            //       textcolor: Color(0xFF199992),
            //     ),
            //   ],
            // ),
            // vSizedBox,
            // Row(
            //   children: [
            //     Chip_Custom(
            //       text: 'DAY OFF',
            //       background: Color(0xFFF3F4F6),
            //       textcolor: Color(0xFF4B5563),
            //     ),
            //   ],
            // ),
          ],
        );
      }
    );
  }
}
