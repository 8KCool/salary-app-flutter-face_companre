import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';

import '../constants/globalkeys.dart';
import '../pages/webviewPages/new_web_view_tab.dart';

Future<bool?> showSnackbar(BuildContext context, String text, {int seconds = 4})async{
  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(content: Text(text),
  //     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //     behavior: SnackBarBehavior.floating,
  //     duration: Duration(seconds: seconds),
  //   )
  // );
  await Future.delayed(Duration(seconds: 1));
  await showPopupDialog(context, text: text);
  return true;
}


showPopupDialog(BuildContext context,  {String headingText = '', required String text,List<Widget> buttons=const [] ,} ){
  return showDialog(context: context, builder: (context){
    return WillPopScope(
      onWillPop: ()async=>false,
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 32),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SubHeadingText(text: headingText, fontWeight: FontWeight.w700,),
              if(headingText!='')
                vSizedBox,
              ParagraphText(text: text, fontWeight: FontWeight.w500,),
              vSizedBox2,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:buttons.length==0?[
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                    try{

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => NewTabScreen()),
                              (Route<dynamic> route) => false);

                    }catch(e){
                      print('Error in catch block 342 $e');
                    }
                  }, child: SubHeadingText(text: 'Ok',))
                ]: buttons,
              )
            ],
          ),
        ),
      ),
    );
  });
}