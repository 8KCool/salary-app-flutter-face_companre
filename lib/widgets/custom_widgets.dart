
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import '../constants/colors.dart';
import '../constants/constans.dart';
import '../functions/navigation_functions.dart';
import 'CustomTexts.dart';
import 'buttons.dart';
import 'customtextfield.dart';

class Chip_Custom extends StatelessWidget {

  final String text;
  final Color background;
  final Color textcolor;
  final double fontsize;
  final String fontfamily;

  const Chip_Custom({
    Key? key,
    required this.text,
    this.background = MyColors.green,
    this.textcolor = Colors.white,
    this.fontsize = 16,
    this.fontfamily = 'bold',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 24,
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Center(child: ParagraphText(
        text: text, fontSize: fontsize, color: textcolor,
        fontFamily: fontfamily,

      )),
    );
  }
}

class list_with_icon extends StatelessWidget {

  final String text;
  final String img;
  final double? letterspaceing;
  final double? height;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign? textAlign;
  final bool underlined;
  final bool icon;
  // final Color textcolor;

  const list_with_icon({

    Key? key,
    required this.text,
    this.img = 'MyImages.punch_in',
    this.color,
    this.fontSize,
    this.letterspaceing,
    this.height,
    this.fontWeight,
    this.fontFamily,
    this.textAlign,
    this.underlined = false,
    this.icon = false,
    // this.textcolor,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          if(icon == true)
           Icon(Icons.insert_drive_file_outlined,
            size: 16,
          ),
          if(icon ==false)
          Image.asset(img, height: 24, width: 24,),
          hSizedBox,
          Text(
              text,
            style: TextStyle(
              color: Colors.black
            ),
          ),

        ],
      ),
    );
  }
}



class clickable_list extends StatelessWidget {

  final String text;
  final String img;
  final double? letterspaceing;
  final double? height;
  final Color? color;
  final Color colorborderleft;
  final double? fontSize;
  final double verticalpadding;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign? textAlign;
  final bool underlined;
  final Function()? onTap;
  final bool image;
  // final Color textcolor;

  const clickable_list({

    Key? key,
    required this.text,
    this.img = 'MyImages.punch_in',
    this.color = const Color(0xFF22215B),
    this.colorborderleft = MyColors.orange,
    this.fontSize,
    this.verticalpadding = 16,
    this.letterspaceing,
    this.height,
    this.fontWeight,
    this.fontFamily = 'bold',
    this.textAlign,
    this.underlined = false,
    this.onTap,
    this.image = true,
    // this.icon = false,
    // this.textcolor,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          gradient: new LinearGradient(
              stops: [0.01, 0.01],
              colors: [
                colorborderleft,
                MyColors.white,
              ]
          ),
          borderRadius: BorderRadius.circular(4),

        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: verticalpadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                image? Image.asset(img, height: 45, width: 45,): SizedBox(width: 0,),
                hSizedBox,
                hSizedBox05,
                Text(
                  text,
                  style: TextStyle(
                    color: color,
                    fontSize: fontSize,
                    fontFamily: fontFamily,
                    height: height,
                  ),
                ),
              ],
            ),
            Icon(Icons.chevron_right_outlined, size: 25, color: MyColors.labelcolor,)

          ],
        ),
      ),
    );
  }
}


class List_bonus extends StatelessWidget {
  final String text;
  final String subtext;
  final String deletesub;
  final String deletemain;
  final String img;
  final String price;
  final Color headingcolor;
  final bool isimage;
  final bool popupmenu;

  const List_bonus({
    required this.text,
    required this.subtext,
    this.deletesub = 'heading',
    this.deletemain = 'subheading',
    this.img = 'MyImages.red_up',
    this.isimage = true,
    this.popupmenu = true,
    this.headingcolor = MyColors.black,

    required this.price,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // padding: EdgeInsets.symmetric(horizontal: 16),
      // margin: EdgeInsets.all(10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              if(isimage)
                ClipRRect(
                  child: Image.asset(
                    img,
                    height: 48,
                    width: 48,
                  ),
                  borderRadius: BorderRadius.circular(0),
                ),
              if(isimage)
                hSizedBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: text,
                        style: TextStyle(
                            fontSize: 16,
                            color: headingcolor,
                            fontFamily: 'bold'
                        ),
                      ),
                    ),
                    // vSizedBox05,
                    ParagraphText(
                      text: subtext,
                      fontSize: 14,
                      color: MyColors.labelcolor,
                    )
                  ],
                ),
              ),
              if(isimage)
                ParagraphText(
                  text: price,
                  fontSize: 16,
                  fontFamily: 'bold',
                  color: img.toString() ==MyImages.red_up ? MyColors.red:MyColors.secondarycolor,
                ),
              if(isimage==false)
                Chip_Custom(text: 'Assigned', background: Color(0xFFDBEAFE), textcolor: MyColors.primaryColor,fontfamily: 'semibold',),
              if(popupmenu)
                PopupMenuButton(
                  // icon: Icon(Icons.more_vert, color: Colors.black,),
                  child: Icon(Icons.more_vert, color: MyColors.labelcolor,),
                  elevation: 1,
                  offset: Offset(0, 30),
                  padding: EdgeInsets.all(0),
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    const PopupMenuItem(

                      child: ListTile(
                        minLeadingWidth: 25,
                        contentPadding: EdgeInsets.all(0),
                        visualDensity:
                        VisualDensity(horizontal: -4, vertical: -4),
                        title: Text('Edit'),
                        leading: ImageIcon(
                          AssetImage(
                            MyImages.change,
                          ),
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(

                        contentPadding: EdgeInsets.all(0),
                        minLeadingWidth: 25,
                        visualDensity:
                        VisualDensity(horizontal: -4, vertical: -4),
                        title: Text('Delete'),
                        leading: ImageIcon(
                          AssetImage(
                            MyImages.bin,
                          ),
                        ),
                      ),
                      onTap: (){
                        print('hkh');
                        Future.delayed(
                            const Duration(seconds: 0),
                                () =>
                                showCustomDialogBox(
                                    context: context,
                                    child: Column(
                                      children: [
                                        vSizedBox,
                                        Image.asset(MyImages.delete, height: 35, width: 35,),
                                        vSizedBox2,
                                        MainHeadingText(text: deletemain, color: MyColors.black,),
                                        vSizedBox2,
                                        ParagraphText(text: deletesub),
                                        vSizedBox4,
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child: RoundEdgedButton(
                                                  text: 'Cancel',
                                                  color: Color(0xFFF3F4F6),
                                                  textColor: MyColors.black,
                                                )),
                                            hSizedBox,
                                            Expanded(
                                                child: RoundEdgedButton(
                                                  text: 'Delete',
                                                )),
                                          ],
                                        ),
                                      ],
                                    )
                                ));
                      },
                    ),
                  ],
                ),
            ],
          ),
          vSizedBox,
          if(isimage)
            Divider()
        ],
      ),
    );
  }
}

class Transaction_list extends StatelessWidget {
  final String text;
  final String subtext;
  final String deletesub;
  final String deletemain;
  final String img;
  final String price;
  final Color headingcolor;
  final bool isimage;
  final bool popupmenu;

  const Transaction_list({
    required this.text,
    required this.subtext,
    this.deletesub = 'heading',
    this.deletemain = 'subheading',
    this.img = 'MyImages.red_up',
    this.isimage = true,
    this.popupmenu = true,
    this.headingcolor = MyColors.black,

    required this.price,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // padding: EdgeInsets.symmetric(horizontal: 16),
      // margin: EdgeInsets.all(10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if(isimage)
                ClipRRect(
                  child: Image.asset(
                    img,
                    height: 48,
                    width: 48,
                  ),
                  borderRadius: BorderRadius.circular(0),
                ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: text,
                      style: TextStyle(
                          fontSize: 16,
                          color: headingcolor,
                          fontFamily: 'bold'
                      ),
                    ),
                  ),
                  // vSizedBox05,
                  ParagraphText(
                    text: subtext,
                    fontSize: 14,
                    color: MyColors.labelcolor,
                  )
                ],
              ),
              // if(isimage)

              if(isimage==false)
                Chip_Custom(text: 'Assigned', background: Color(0xFFDBEAFE), textcolor: MyColors.primaryColor,fontfamily: 'semibold',),

              ParagraphText(
                text: price,
                fontSize: 16,
                fontFamily: 'bold',
                color: img.toString() ==MyImages.red_up ? MyColors.red:MyColors.secondarycolor,
              ),
              if(popupmenu)
                PopupMenuButton(
                  // icon: Icon(Icons.more_vert, color: Colors.black,),
                  child: Icon(Icons.more_vert, color: MyColors.labelcolor,),
                  elevation: 1,
                  offset: Offset(0, 30),
                  padding: EdgeInsets.all(0),
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    const PopupMenuItem(

                      child: ListTile(
                        minLeadingWidth: 25,
                        contentPadding: EdgeInsets.all(0),
                        visualDensity:
                        VisualDensity(horizontal: -4, vertical: -4),
                        title: Text('Edit'),
                        leading: ImageIcon(
                          AssetImage(
                            MyImages.change,
                          ),
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(

                        contentPadding: EdgeInsets.all(0),
                        minLeadingWidth: 25,
                        visualDensity:
                        VisualDensity(horizontal: -4, vertical: -4),
                        title: Text('Delete'),
                        leading: ImageIcon(
                          AssetImage(
                            MyImages.bin,
                          ),
                        ),
                      ),
                      onTap: (){
                        print('hkh');
                        Future.delayed(
                            const Duration(seconds: 0),
                                () =>
                                showCustomDialogBox(
                                    context: context,
                                    child: Column(
                                      children: [
                                        vSizedBox,
                                        Image.asset(MyImages.delete, height: 35, width: 35,),
                                        vSizedBox2,
                                        MainHeadingText(text: deletemain, color: MyColors.black,),
                                        vSizedBox2,
                                        ParagraphText(text: deletesub),
                                        vSizedBox4,
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child: RoundEdgedButton(
                                                  text: 'Cancel',
                                                  color: Color(0xFFF3F4F6),
                                                  textColor: MyColors.black,
                                                )),
                                            hSizedBox,
                                            Expanded(
                                                child: RoundEdgedButton(
                                                  text: 'Delete',
                                                )),
                                          ],
                                        ),
                                      ],
                                    )
                                ));
                      },
                    ),
                  ],
                ),
            ],
          ),
          vSizedBox,
          // if(isimage)
          Divider(color: Color(0xFFCAD8D8),)
        ],
      ),
    );
  }
}

class Approval_list extends StatelessWidget {
  final String text;
  final String subtext;
  final String chiptext;
  final String deletesub;
  final String deletemain;
  final String img;
  final Color headingcolor;
  final Color chiptextcolor;
  final Color chipcolor;
  final bool isimage;
  final bool chip;
  final bool popupmenu;
  final bool asignby;
  final bool location;
  final bool btns;
  final double horizontalpad;
  final double verticalpad;

  const Approval_list({
    required this.text,
    required this.subtext,
    this.chiptext = 'assigned',
    this.deletesub = 'heading',
    this.deletemain = 'subheading',
    this.img = 'MyImages.red_up',
    this.isimage = true,
    this.chip = true,
    this.popupmenu = false,
    this.asignby = false,
    this.location = true,
    this.btns = true,
    this.headingcolor = MyColors.black,
    this.chipcolor = MyColors.yellow,
    this.chiptextcolor = MyColors.yellow,
    this.horizontalpad = 16,
    this.verticalpad = 16,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController search= TextEditingController();
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: horizontalpad, vertical: verticalpad) ,
      decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(4)
      ),
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            // padding: EdgeInsets.symmetric(horizontal: 16),
            // margin: EdgeInsets.all(10),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    if(isimage)
                      ClipRRect(
                        child: Image.asset(
                          img,
                          height: 48,
                          width: 48,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    if(isimage)
                      hSizedBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: text,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: headingcolor,
                                  fontFamily: 'bold'
                              ),
                            ),
                          ),
                          // vSizedBox05,
                          ParagraphText(
                            text: subtext,
                            fontSize: 14,
                            color: MyColors.labelcolor,
                          )
                        ],
                      ),
                    ),
                    if(chip)
                      Chip_Custom(
                        text: chiptext,
                        background: chipcolor,
                        textcolor: chiptextcolor,
                        fontfamily: 'semibold',
                        fontsize: 14,
                      ),
                    if(popupmenu)
                      PopupMenuButton(
                        // icon: Icon(Icons.more_vert, color: Colors.black,),
                        child: Icon(Icons.more_vert, color: MyColors.labelcolor,),
                        elevation: 1,
                        offset: Offset(0, 30),
                        padding: EdgeInsets.all(0),
                        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                          const PopupMenuItem(

                            child: ListTile(
                              minLeadingWidth: 25,
                              contentPadding: EdgeInsets.all(0),
                              visualDensity:
                              VisualDensity(horizontal: -4, vertical: -4),
                              title: Text('Edit'),
                              leading: ImageIcon(
                                AssetImage(
                                  MyImages.change,
                                ),
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            child: ListTile(

                              contentPadding: EdgeInsets.all(0),
                              minLeadingWidth: 25,
                              visualDensity:
                              VisualDensity(horizontal: -4, vertical: -4),
                              title: Text('Delete'),
                              leading: ImageIcon(
                                AssetImage(
                                  MyImages.bin,
                                ),
                              ),
                            ),
                            onTap: (){
                              print('hkh');
                              Future.delayed(
                                  const Duration(seconds: 0),
                                      () =>
                                      showCustomDialogBox(
                                          context: context,
                                          child: Column(
                                            children: [
                                              vSizedBox,
                                              Image.asset(MyImages.delete, height: 35, width: 35,),
                                              vSizedBox2,
                                              MainHeadingText(text: deletemain, color: MyColors.black,),
                                              vSizedBox2,
                                              ParagraphText(text: deletesub),
                                              vSizedBox4,
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                      child: RoundEdgedButton(
                                                        text: 'Cancel',
                                                        color: Color(0xFFF3F4F6),
                                                        textColor: MyColors.black,
                                                      )),
                                                  hSizedBox,
                                                  Expanded(
                                                      child: RoundEdgedButton(
                                                        text: 'Delete',
                                                      )),
                                                ],
                                              ),
                                            ],
                                          )
                                      ));
                            },
                          ),
                        ],
                      ),
                  ],
                ),
                vSizedBox2,
              ],
            ),
          ),
          vSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeadingText(text: '27-07-2022', fontSize: 16,),
                    vSizedBox05,
                    ParagraphText(text: 'Date', fontSize: 14,),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeadingText(text: '09:00 AM', fontSize: 16,),
                    vSizedBox05,
                    ParagraphText(text: 'In Time', fontSize: 14,),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeadingText(text: '05:00 PM', fontSize: 16,),
                    vSizedBox05,
                    ParagraphText(text: 'Out Time', fontSize: 14,),
                  ],
                ),
              ),
            ],
          ),
          vSizedBox,
          if(location)
            Container(
              width: width(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ParagraphText(text: 'Location', fontSize: 14,),
                  vSizedBox05,
                  ParagraphText(
                    color: MyColors.black,
                    text: '9WQ2+37 Weavers Colony, Thiruchengodu, Tamil Nadu, India', fontSize: 14,),
                ],
              ),
            ),
          if(btns)
            Divider(height: 30, color: Color(0xFFCAD8D8),),
          if(btns)
            Row(
              children: [
                Expanded(
                  child: RoundEdgedButton(
                    text: 'Approve',
                    color: MyColors.secondarycolor,
                  ),
                ),hSizedBox,
                Expanded(
                  child: RoundEdgedButton(
                    text: 'Reject',
                    color: MyColors.red,
                    onTap: (){
                      bottomsheet(
                          height: 300,
                          context: context,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              vSizedBox2,
                              MainHeadingText(text: 'Reject Comment'),
                              vSizedBox4,
                              CustomTextField(
                                controller: search,
                                label: 'Add Comment',
                                showlabel: true,
                                hintText: 'hintText',
                                maxLines: 5,
                              ),
                              vSizedBox2,
                              RoundEdgedButton(text: 'Save')
                            ],
                          )
                      );
                    },
                  ),
                ),
              ],
            ),
          if(btns)
            vSizedBox,
          if(asignby)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ParagraphText(text: 'Unit', fontSize: 14,),
                      vSizedBox05,
                      MainHeadingText(text: '20', fontSize: 16,),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ParagraphText(text: 'Amount', fontSize: 14,),
                      vSizedBox05,
                      MainHeadingText(text: '₹ 25', fontSize: 16,),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ParagraphText(text: 'Total Amount', fontSize: 14,),
                      vSizedBox05,
                      MainHeadingText(text: '₹ 500', fontSize: 16,),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ParagraphText(text: 'Assigned By', fontSize: 14,),
                      vSizedBox05,
                      MainHeadingText(text: 'Elavarasa...', fontSize: 16,),
                    ],
                  ),
                ),
              ],
            ),
          if(asignby)
            vSizedBox,
        ],
      ),
    );
  }
}


class PopupmenuButtonCustom extends StatelessWidget {
  final String deletesub;
  final String deletemain;
  final Function()? onTapedit;
  final bool isEdit;
  final bool isDelete;
  final Function()? DeleteFun;




  const PopupmenuButtonCustom(
      {
        this.deletesub = 'heading',
        this.deletemain = 'subheading',
        this.onTapedit,
        required this.isEdit,
        required this.isDelete,
        required this.DeleteFun,


        Key? key
      }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(

      // icon: Icon(Icons.more_vert, color: Colors.black,),
      child: Icon(Icons.more_vert, color: MyColors.labelcolor,),
      elevation: 1,
      offset: Offset(0, 30),
      padding: EdgeInsets.all(0),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        if(isEdit)
        PopupMenuItem(

          child: ListTile(
            minLeadingWidth: 25,
            contentPadding: EdgeInsets.all(0),
            visualDensity:
            VisualDensity(horizontal: -4, vertical: -4),
            title: Text('Edit'),
            leading: ImageIcon(
              AssetImage(
                MyImages.change,
              ),
            ),
            onTap: onTapedit,
          ),
        ),
        // if(isDelete)
        PopupMenuItem(
          child: ListTile(

            contentPadding: EdgeInsets.all(0),
            minLeadingWidth: 25,
            visualDensity:
            VisualDensity(horizontal: -4, vertical: -4),
            title: Text('Delete'),
            leading: ImageIcon(
              AssetImage(
                MyImages.bin,
              ),
            ),
          ),
          onTap: (){
            print('hkh');
            Future.delayed(
                const Duration(seconds: 0),
                    () =>
                    showCustomDialogBox(
                        context: context,
                        child: Column(
                          children: [
                            vSizedBox,
                            Image.asset(MyImages.delete_this_report, height: 35, width: 35,),
                            vSizedBox2,
                            MainHeadingText(text: deletemain, color: MyColors.black,),
                            vSizedBox2,
                            ParagraphText(text: deletesub),
                            vSizedBox4,
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: RoundEdgedButton(
                                      text: 'Cancel',
                                      color: Color(0xFFF3F4F6),
                                      textColor: MyColors.black,
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                    )
                                ),
                                hSizedBox,
                                Expanded(
                                    child: RoundEdgedButton(
                                      text: 'Delete',
                                      onTap: DeleteFun

                                    )
                                ),
                              ],
                            ),
                          ],
                        )
                    ));
          },
        ),
      ],
    );
  }
}