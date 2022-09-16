import 'package:flutter/material.dart';

import '../constants/sized_box.dart';


showMyDialog(String message,BuildContext context,bool isSuccess) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // title: const Text('Alert'),
        content: SingleChildScrollView(
          child: ListBody(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              // Image.asset(MyImages.cancel,width: 70,height: 70,),
              // Icon(Icons.dangerous,color: Colors.red,size: 80,),
              // vSizedBox2,
              // Text('Alert',textAlign: TextAlign.center,),
              // vSizedBox,
              if(!isSuccess)
              Icon(Icons.dangerous,color: Colors.red,size: 80,),
              if(isSuccess)
                Icon(Icons.check_circle_rounded,color: Colors.green,size: 80,),
              Text('${message.toString()}',textAlign: TextAlign.center,),
              vSizedBox,

              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  // push(context: context, screen: newTabsPage());
                },
              ),
            ],
          ),
        ),

      );
    },
  );
}
