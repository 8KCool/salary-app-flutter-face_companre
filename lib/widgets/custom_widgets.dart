
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/constans.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';
import '../constants/colors.dart';
import '../functions/navigation_functions.dart';
import 'CustomTexts.dart';
import 'buttons.dart';

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

class Leave_Request_list extends StatelessWidget {
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
  final bool privilaged_leave;
  final double horizontalpad;
  final double verticalpad;

  const Leave_Request_list({
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
    this.privilaged_leave = false,
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
      margin: EdgeInsets.only(bottom: 5),
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
                    ParagraphText(text: 'Start Date', fontSize: 14,),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeadingText(text: '28-07-2022', fontSize: 16,),
                    vSizedBox05,
                    ParagraphText(text: 'End Date', fontSize: 14,),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeadingText(text: '1 Day', fontSize: 16,),
                    vSizedBox05,
                    ParagraphText(text: 'Leave Days', fontSize: 14,),
                  ],
                ),
              ),
            ],
          ),
          if(privilaged_leave)
          vSizedBox,
          if(privilaged_leave)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeadingText(text: 'Privilaged Leave', fontSize: 16,),
                    vSizedBox05,
                    ParagraphText(text: 'Leave Type', fontSize: 14,),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeadingText(text: '2 Days', fontSize: 16,),
                    vSizedBox05,
                    ParagraphText(text: 'This Month', fontSize: 14,),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeadingText(text: '10 Days', fontSize: 16,),
                    vSizedBox05,
                    ParagraphText(text: 'This Year', fontSize: 14,),
                  ],
                ),
              ),
            ],
          ),
          vSizedBox2,
          if(location)
          Container(
            width: width(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ParagraphText(
                  text: 'Description',
                  fontSize: 16,
                  color: MyColors.black,
                  fontFamily: 'semibold',
                ),
                vSizedBox05,
                ParagraphText(
                  // color: MyColors.black,
                  text: 'Today I am Going to hospital sir. I need Leave.  Please Grand me today. It is help for my reco...',
                  fontSize: 14,
                ),

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

class Permission_Request_list extends StatelessWidget {
  final String text;
  final String subtext;
  final String chiptext;
  final String deletesub;
  final String deletemain;
  final String img;
  final String date;
  final String start;
  final String end;
  final String total;
  final String? description;
  final Color headingcolor;
  final Color chiptextcolor;
  final Color chipcolor;
  final bool isimage;
  final bool chip;
  final bool popupmenu;
  final bool asignby;
  final bool location;
  final bool btns;
  final bool privilaged_leave;
  final bool permission_hours;
  final bool overtime;
  final bool overtime_hours;
  final double horizontalpad;
  final double verticalpad;

  const Permission_Request_list({
    required this.text,
    required this.subtext,
    required this.date,
    required this.start,
    required this.end,
    required this.total,
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
    this.privilaged_leave = false,
    this.permission_hours = false,
    this.overtime = false,
    this.overtime_hours = false,
    this.headingcolor = MyColors.black,
    this.chipcolor = MyColors.yellow,
    this.chiptextcolor = MyColors.yellow,
    this.horizontalpad = 16,
    this.verticalpad = 16,
    this.description='Going to bank so that i need permission sir.',

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
                        child: Image.network(
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
                    MainHeadingText(text: '${date}', fontSize: 16,),
                    vSizedBox05,
                    ParagraphText(text: 'Date', fontSize: 14,),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeadingText(text: '${start}', fontSize: 16,),
                    vSizedBox05,
                    ParagraphText(text: 'From Time', fontSize: 14,),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeadingText(text: '${end}', fontSize: 16,),
                    vSizedBox05,
                    ParagraphText(text: 'To Time', fontSize: 14,),
                  ],
                ),
              ),
            ],
          ),
          if(privilaged_leave)
          vSizedBox,
          if(privilaged_leave)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeadingText(text: '${total} Hour', fontSize: 16,),
                    vSizedBox05,
                    ParagraphText(
                      text: overtime_hours? 'OT Hours':'Permission Duration',
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              if(permission_hours)
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeadingText(
                      text: overtime? '₹ 200':'02 hours 30 Mins',
                      fontSize: 16,
                    ),
                    vSizedBox05,
                    ParagraphText(
                      text: overtime? 'OT Amount' : 'Permission in this month',
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if(location)
            vSizedBox2,
          if(location)
          Container(
            width: width(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ParagraphText(text: 'Description', fontSize: 14,),
                vSizedBox05,
                ParagraphText(
                  color: MyColors.black,
                  text: '${description}', fontSize: 16,),
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
                  verticalMargin: 0,
                ),
              ),
              hSizedBox,
              Expanded(
                child: RoundEdgedButton(
                  text: 'Reject',
                  color: MyColors.red,
                  verticalMargin: 0,
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
          // if(btns)
          // vSizedBox,
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

class Approval_correction_list extends StatelessWidget {
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

  const Approval_correction_list({
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
                    MainHeadingText(text: '01-07-2022 09:00AM', fontSize: 16,),
                    vSizedBox05,
                    ParagraphText(text: 'Captured Time', fontSize: 14,),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeadingText(text: '01-07-2022 08:00AM', fontSize: 16,),
                    vSizedBox05,
                    ParagraphText(text: 'Requested Time', fontSize: 14,),
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
                ParagraphText(text: 'Captured Location', fontSize: 14,),
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
                  onTap: (){
                    Navigator.pop(context);
                  },
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
  final bool issubheading;
  final bool editbtn;
  final bool deletebtn;

  const PopupmenuButtonCustom(
      {
        this.deletesub = 'heading',
        this.deletemain = 'subheading',
        this.onTapedit,
        this.issubheading = true,
        this.editbtn = true,
        this.deletebtn = true,
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
        if(editbtn)
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
        if(deletebtn)
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
                            MainHeadingText(text: deletemain, color: MyColors.black,textAlign: TextAlign.center,),
                            if(issubheading)
                            vSizedBox2,
                            if(issubheading)
                            ParagraphText(text: deletesub,textAlign: TextAlign.center),
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
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
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

class Pay_per_work_list extends StatelessWidget {
  final String text;
  final String subtext;
  final String deletesub;
  final String deletemain;
  final String img;
  final Color headingcolor;
  final bool isimage;
  final bool popupmenu;

  const Pay_per_work_list({
    required this.text,
    required this.subtext,
    this.deletesub = 'heading',
    this.deletemain = 'subheading',
    this.img = 'MyImages.red_up',
    this.isimage = true,
    this.popupmenu = true,
    this.headingcolor = MyColors.black,

    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: EdgeInsets.only(bottom: 5),
      color: MyColors.white,

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
                    fit: BoxFit.cover,
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
                Chip_Custom(text: 'Wait for approval', background: Color(0xFFDBEAFE), textcolor: MyColors.primaryColor,fontfamily: 'semibold',),
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
                        Future.delayed(
                            const Duration(seconds: 0),
                                () =>
                                showCustomDialogBox(
                                    context: context,
                                    child: Stack(
                                      children: [
                                        Column(
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
                                                    )),
                                                hSizedBox,
                                                Expanded(
                                                    child: RoundEdgedButton(
                                                      text: 'Delete',
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          right:0,
                                          top:0,
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.pop(context);
                                              },
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xff4B5563),
                                                )
                                            )
                                        )
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Shirt Stitching',
                  style: TextStyle(
                      fontSize: 16,
                      color: MyColors.primaryColor,
                      fontFamily: 'bold'
                  ),
                ),
              ),
              vSizedBox05,
              ParagraphText(
                text: '29-07-2022 12:48',
                fontSize: 14,
                color: MyColors.labelcolor,
              )
            ],
          ),
          vSizedBox2,
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
          vSizedBox,
        ],
      ),
    );
  }
}

class Pay_per_work_detail_list extends StatelessWidget {
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
  final bool privilaged_leave;
  final bool permission_hours;
  final bool overtime;
  final bool overtime_hours;
  final bool empl_comment;
  final double horizontalpad;
  final double verticalpad;

  const Pay_per_work_detail_list({
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
    this.privilaged_leave = false,
    this.permission_hours = false,
    this.overtime = false,
    this.overtime_hours = false,
    this.empl_comment = false,
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
              ],
            ),
          ),
          vSizedBox2,
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Shirt Stitching',
                    style: TextStyle(
                        fontSize: 16,
                        color: MyColors.primaryColor,
                        fontFamily: 'bold'
                    ),
                  ),
                ),
                vSizedBox05,
                ParagraphText(
                  text: '29-07-2022 12:48',
                  fontSize: 14,
                  color: MyColors.labelcolor,
                )
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
                    MainHeadingText(text: '20', fontSize: 16,),
                    vSizedBox05,
                    ParagraphText(text: 'Unit', fontSize: 14,),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeadingText(text: '₹ 25', fontSize: 16,),
                    vSizedBox05,
                    ParagraphText(text: 'Amount', fontSize: 14,),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeadingText(text: '₹ 500', fontSize: 16,),
                    vSizedBox05,
                    ParagraphText(text: 'Total Amount', fontSize: 14,),
                  ],
                ),
              ),
            ],
          ),
          if(privilaged_leave)
            vSizedBox2,
          if(privilaged_leave)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainHeadingText(text: 'Elavarasan', fontSize: 16,),
                      vSizedBox05,
                      ParagraphText(
                        text: 'Assigned By',
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
                if(permission_hours)
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainHeadingText(
                          text: overtime? '₹ 200':'02 hours 30 Mins',
                          fontSize: 16,
                        ),
                        vSizedBox05,
                        ParagraphText(
                          text: overtime? 'OT Amount' : 'Permission in this month',
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          if(location)
            vSizedBox2,
          if(location)
            Container(
              width: width(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ParagraphText(
                    text: 'Description',
                    fontSize: 16,
                    fontFamily: 'semibold',
                    color: MyColors.black,
                  ),
                  vSizedBox05,
                  ParagraphText(
                    text: 'Enter the descriptioj here',
                    fontSize: 14,),
                ],
              ),
            ),
          vSizedBox2,
          Container(
            width: width(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ParagraphText(
                  text: 'Attachments',
                  fontSize: 16,
                  fontFamily: 'semibold',
                  color: MyColors.black,
                ),
                vSizedBox05,
                ParagraphText(
                  text: 'image.png', fontSize: 14,),
              ],
            ),
          ),
          if(empl_comment)
            Column(
              children: [
                vSizedBox2,
                Container(
                  width: width(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ParagraphText(
                        text: 'Attachments',
                        fontSize: 16,
                        fontFamily: 'semibold',
                        color: MyColors.black,
                      ),
                      vSizedBox05,
                      ParagraphText(
                        text: 'image.png', fontSize: 14,),
                    ],
                  ),
                ),
                vSizedBox2,
                Container(
                  width: width(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ParagraphText(
                        text: 'Employee Comment',
                        fontSize: 16,
                        fontFamily: 'bold',
                        color: MyColors.black,
                      ),
                    ],
                  ),
                ),
                vSizedBox2,
                Container(
                  width: width(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ParagraphText(
                        text: 'Attachments',
                        fontSize: 16,
                        fontFamily: 'semibold',
                        color: MyColors.black,
                      ),
                      vSizedBox05,
                      ParagraphText(
                        text: 'image.png', fontSize: 14,),
                    ],
                  ),
                ),
                vSizedBox2,
                Container(
                  width: width(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ParagraphText(
                        text: 'Attachments',
                        fontSize: 16,
                        fontFamily: 'semibold',
                        color: MyColors.black,
                      ),
                      vSizedBox05,
                      ParagraphText(
                        text: 'image.png', fontSize: 14,),
                    ],
                  ),
                ),
              ],
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
                    verticalMargin: 0,
                  ),
                ),
                hSizedBox,
                Expanded(
                  child: RoundEdgedButton(
                    text: 'Reject',
                    color: MyColors.red,
                    verticalMargin: 0,
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
        ],
      ),
    );
  }
}

class Reports_list extends StatelessWidget {
  final String text;
  final String subtext;
  final String datetext;
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
  final bool privilaged_leave;
  final bool permission_hours;
  final bool overtime;
  final bool overtime_hours;
  final bool empl_comment;
  final double horizontalpad;
  final double verticalpad;

  const Reports_list({
    required this.text,
    required this.subtext,
    required this.datetext,
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
    this.privilaged_leave = false,
    this.permission_hours = false,
    this.overtime = false,
    this.overtime_hours = false,
    this.empl_comment = false,
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
      margin: EdgeInsets.only(bottom: 05),
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
                          height: 60,
                          width: 60,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    if(isimage)
                      hSizedBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ParagraphText(
                            text: subtext,
                            fontSize: 14,
                            color: MyColors.labelcolor,
                          ),
                          SizedBox(height: 3,),
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
                          SizedBox(height: 3,),
                          ParagraphText(
                            text: datetext,
                            fontSize: 14,
                            color: MyColors.labelcolor,
                          ),
                        ],
                      ),
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
                              title: Text('Download'),
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
                                              Row(
                                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                children: [
                                                  MainHeadingText(
                                                    text: 'Delete Department',
                                                    fontSize: 14,
                                                  ),
                                                  GestureDetector(
                                                    onTap: (){
                                                      Navigator.pop(context);
                                                    },
                                                      child: Icon(
                                                        Icons.close,
                                                        color: MyColors.paragraphcolor,
                                                      ),
                                                  )
                                                ],
                                              ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class clickable_list_horizontal extends StatelessWidget {

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
  final bool image_vert;
  final bool badge;
  // final Color textcolor;

  const clickable_list_horizontal({

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
    this.image_vert = false,
    this.badge = false,
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
              stops: [0.02, 0.02],
              colors: [
                colorborderleft,
                MyColors.white,
              ]
          ),
          borderRadius: BorderRadius.circular(4),

        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: verticalpadding),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: width(context),
              child: Column(
                children: [
                  image_vert? Image.asset(img, height: 36, width: 36,): SizedBox(width: 0,),
                  vSizedBox05,
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
            ),
            Positioned(
                right: -10,
                bottom: -5,
                child:Icon(Icons.chevron_right_outlined,
                  size: 25, color: MyColors.labelcolor,)
            ),
            if(badge)
              Positioned(
                  right: -5,
                  top: -5,
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFDC2626)
                    ),
                  )
              )
          ],
        ),
      ),
    );
  }
}

