import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/sized_box.dart';
import '../widgets/CustomTexts.dart';
Future push({required  BuildContext context, required Widget screen,})async{
  print('presse kjhn d');
  return Navigator.push(context, MaterialPageRoute(builder: (context){
    return screen;
  }));
}

Future pushReplacement({required  BuildContext context, required Widget screen,})async{
  return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
    return screen;
  }));
}

Future bottomsheet(
    {
      double height = 650,
      double radius = 20,
      required BuildContext context,
      required dynamic child,
    }
    )async{
  return showModalBottomSheet<void>(
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
                    topLeft: Radius.circular(radius),
                    topRight: Radius.circular(radius),
                  )
              ),
              height: height,
              child: child,
            );
          }
      );
    },
  );

}

Future showCustomDialogBox({required BuildContext context, required dynamic child}){
  return showDialog(context: context, builder: (context){
    return SimpleDialog(
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      insetPadding: EdgeInsets.all(0),
      contentPadding: EdgeInsets.all(0),
      // title: Text('Allow Liza to see', textAlign: TextAlign.center,),
      children: [
        SimpleDialogOption(
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height - 470,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                // border: Border.all(
                //     color: MyColors.primaryColor
                // ),

              ),
              child: child,
            )
        ),
      ],
    );
  });
}