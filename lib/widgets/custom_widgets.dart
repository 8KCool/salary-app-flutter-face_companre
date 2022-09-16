
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import '../constants/colors.dart';
import '../functions/navigation_functions.dart';
import 'CustomTexts.dart';
import 'buttons.dart';

class Chip_Custom extends StatelessWidget {

  final String text;
  final Color background;
  final Color textcolor;
  final double fontsize;

  const Chip_Custom({
    Key? key,
    required this.text,
    this.background = MyColors.green,
    this.textcolor = Colors.white,
    this.fontsize = 16,
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
        fontFamily: 'bold',
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
        padding:EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                      fontFamily: fontFamily
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