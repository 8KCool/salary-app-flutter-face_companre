import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/globalkeys.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/pages/all_employee.dart';
import 'package:salaryredesign/pages/attandance_page.dart';
import 'package:salaryredesign/services/api_urls.dart';
import 'package:salaryredesign/services/webservices.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';

import '../../providers/clock.dart';

class Dashboard_Page extends StatefulWidget {
  const Dashboard_Page({Key? key}) : super(key: key);

  @override
  State<Dashboard_Page> createState() => _Dashboard_PageState();
}

List images = [
  MyImages.avatrtwo,
  MyImages.avatr3,
  MyImages.avatr4,
  MyImages.avatr5,
  MyImages.avatr6,
  MyImages.avatr7,
  MyImages.avatr8,
  MyImages.avatr9,
  MyImages.avatr10,
  MyImages.avatr11,
  MyImages.avatr12,
];

List Name = [
  'John Smith',
  'Peter John',
  'Nora Luise',
  'Albus Potter',
  'Ron visely',
  'Ronit Sharma',
  'Lorem Ipsum',
  'John Smith',
  'Peter John',
  'Ron visely',
];

class _Dashboard_PageState extends State<Dashboard_Page> {
  getDetails()async{
    Map<String ,dynamic>data={
      'token':'Bearer $usertoken'
    };
var res = await Webservices.postData(apiUrl: ApiUrls.qrattendance, body: data, context: context);
print('res from api ${res}');
// await Provider.of<GlobalModal>(context, listen: false).addUserDetail(res['userData'],context);

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      appBar: appBar(
          context: context,
          title: Provider.of<GlobalModal>(context, listen: false).userData!.companyName.toString(),
          implyLeading: false,
          titlecenter: false,
          leading: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          appBarColor: MyColors.primaryColor,
          titleColor: Colors.white,
          actions: [
            Icon(Icons.notifications_outlined),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.help_outline_outlined,
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainHeadingText(
                        text: 'Attendance Stats',
                      ),
                      GestureDetector(
                        onTap: (){
                          push(context: context, screen: Attandance_daily_Page());
                        },
                          child: MainHeadingText(
                        text: 'View All',
                        fontSize: 16,
                        color: MyColors.primaryColor,
                      ))
                    ],
                  ),
                  vSizedBox,
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                              color: MyColors.primaryColor,
                              borderRadius: BorderRadius.circular(4)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ParagraphText(
                                text: '20',
                                fontSize: 30,
                                fontFamily: 'bold',
                                color: Colors.white,
                              ),
                              vSizedBox,
                              ParagraphText(
                                text: 'Total Employees',
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      hSizedBox05,
                      Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: MyColors.secondarycolor,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ParagraphText(
                                            text: '10',
                                            fontSize: 24,
                                            fontFamily: 'bold',
                                            color: Colors.white,
                                          ),
                                          // vSizedBox05,
                                          ParagraphText(
                                            text: 'Present',
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  hSizedBox05,
                                  Expanded(
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: MyColors.red,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ParagraphText(
                                            text: '5',
                                            fontSize: 24,
                                            fontFamily: 'bold',
                                            color: Colors.white,
                                          ),
                                          // vSizedBox,
                                          ParagraphText(
                                            text: 'Absent',
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              vSizedBox05,
                              // vSizedBox05,
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: MyColors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ParagraphText(
                                            text: '3',
                                            fontSize: 24,
                                            fontFamily: 'bold',
                                            color: Colors.white,
                                          ),
                                          // vSizedBox05,
                                          ParagraphText(
                                            text: 'Permission',
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  hSizedBox05,
                                  Expanded(
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: MyColors.other,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ParagraphText(
                                            text: '2',
                                            fontSize: 24,
                                            fontFamily: 'bold',
                                            color: Colors.white,
                                          ),
                                          // vSizedBox,
                                          ParagraphText(
                                            text: 'Others',
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                  vSizedBox
                ],
              ),
            ),
            vSizedBox05,
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainHeadingText(
                          text: 'All Employees',
                        ),
                        GestureDetector(
                          onTap: (){
                            push(context: context, screen: All_Employee_Page());
                          },
                          child: MainHeadingText(
                            text: 'View All',
                            fontSize: 16,
                            color: MyColors.primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  vSizedBox,
                  vSizedBox05,
                  Container(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var i = 0; i < 10; i++)
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            width: 55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      child: Image.asset(
                                        images[i],
                                        height: 55,
                                        width: 55,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    Positioned(
                                        top: 0,
                                        right: 5,
                                        child: Container(
                                          height: 12,
                                          width: 12,
                                          decoration: BoxDecoration(
                                              color: MyColors.red,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2)),
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                ParagraphText(
                                  text: Name[i],
                                  textAlign: TextAlign.center,
                                  fontSize: 12,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
            vSizedBox,
            vSizedBox05,
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              // margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    MyImages.attendance,
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                // Positioned(
                                //     top: 0, right: 5,
                                //     child: Container(
                                //       height: 12,
                                //       width: 12,
                                //       decoration: BoxDecoration(
                                //           color: MyColors.red,
                                //           borderRadius: BorderRadius.circular(10),
                                //           border: Border.all(
                                //               color: Colors.white,
                                //               width: 2
                                //           )
                                //       ),
                                //     ))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ParagraphText(
                              text: 'Attendance',
                              textAlign: TextAlign.center,
                              fontSize: 14,
                              color: MyColors.primaryColor,
                            )
                          ],
                        ),
                      ),
                      hSizedBox4,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    MyImages.approvals,
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                Positioned(
                                    top: -10,
                                    right: 0,
                                    child: Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                          color: MyColors.red,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Colors.white, width: 2)),
                                      child: Center(
                                        child: ParagraphText(
                                          text: '1',
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ))
                              ],
                              clipBehavior: Clip.none,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ParagraphText(
                              text: 'Approvals',
                              textAlign: TextAlign.center,
                              fontSize: 14,
                              color: MyColors.primaryColor,
                            )
                          ],
                        ),
                      ),
                      hSizedBox4,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    MyImages.salaryprocess,
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                // Positioned(
                                //     top: 0, right: 5,
                                //     child: Container(
                                //       height: 12,
                                //       width: 12,
                                //       decoration: BoxDecoration(
                                //           color: MyColors.red,
                                //           borderRadius: BorderRadius.circular(10),
                                //           border: Border.all(
                                //               color: Colors.white,
                                //               width: 2
                                //           )
                                //       ),
                                //     ))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ParagraphText(
                              text: 'Salary Process',
                              textAlign: TextAlign.center,
                              fontSize: 13,
                              color: MyColors.primaryColor,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  vSizedBox4,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    MyImages.announcement,
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                // Positioned(
                                //     top: 0, right: 5,
                                //     child: Container(
                                //       height: 12,
                                //       width: 12,
                                //       decoration: BoxDecoration(
                                //           color: MyColors.red,
                                //           borderRadius: BorderRadius.circular(10),
                                //           border: Border.all(
                                //               color: Colors.white,
                                //               width: 2
                                //           )
                                //       ),
                                //     ))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ParagraphText(
                              text: 'Announcement',
                              textAlign: TextAlign.center,
                              fontSize: 13.7,
                              color: MyColors.primaryColor,
                            )
                          ],
                        ),
                      ),
                      hSizedBox4,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    MyImages.reports,
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                // Positioned(
                                //     top: 0, right: 5,
                                //     child: Container(
                                //       height: 12,
                                //       width: 12,
                                //       decoration: BoxDecoration(
                                //           color: MyColors.red,
                                //           borderRadius: BorderRadius.circular(10),
                                //           border: Border.all(
                                //               color: Colors.white,
                                //               width: 2
                                //           )
                                //       ),
                                //     )
                                // )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ParagraphText(
                              text: 'Reports',
                              textAlign: TextAlign.center,
                              fontSize: 14,
                              color: MyColors.primaryColor,
                            )
                          ],
                        ),
                      ),
                      hSizedBox4,
                      Expanded(
                        child: Opacity(
                          opacity: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    child: Image.asset(
                                      MyImages.salaryprocess,
                                      height: 55,
                                      width: 55,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  Positioned(
                                      top: 0,
                                      right: 5,
                                      child: Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                            color: MyColors.red,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.white, width: 2)),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              ParagraphText(
                                text: 'Salary Process',
                                textAlign: TextAlign.center,
                                fontSize: 13,
                                color: MyColors.primaryColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            vSizedBox,
            vSizedBox05,
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              // margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainHeadingText(
                        text: 'Approval Request',
                      ),
                    ],
                  ),
                  vSizedBox,
                  vSizedBox05,
                  for (var i = 0; i < 3; i++)
                    Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                images[i],
                                height: 60,
                                width: 60,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hSizedBox,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: Name[i] + ' ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontFamily: 'bold'),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text:
                                                'is requested leave for 2 days.',
                                            style: TextStyle(
                                                color: MyColors.paragraphcolor,
                                                fontFamily: 'regular')),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: ParagraphText(
                                  text: 'View',
                                  fontSize: 14,
                                  fontFamily: 'bold',
                                  color: MyColors.primaryColor,
                                ))
                          ],
                        ),
                        Divider(
                          height: 30,
                        )
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
