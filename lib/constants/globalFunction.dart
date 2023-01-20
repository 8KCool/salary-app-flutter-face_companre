import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/sized_box.dart';


String message='';
bool isConnected=false;






checkInternet(BuildContext context)async{
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
      isConnected=true;
      // getDashboard();
    }
  } on SocketException catch (_) {
    print('not connected');
    message='Check your internet connection';
    // showSnackbar(context, 'Check your internet connection');

    // _showMyDialog(context);

  }
}
Future<void> _showMyDialog(BuildContext context) async {
  // await Future.delayed(Duration(seconds: 2));

  return showDialog<void>(
    context: context,
    // barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // title: const Text('Alert'),
        content: SingleChildScrollView(
          child: ListBody(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Image.asset(MyImages.cancel,width: 70,height: 70,),
              Icon(
                Icons.warning_amber_outlined,
                color: Colors.yellow,
                size: 80,
              ),
              vSizedBox2,
              Text(
                '${message.toString()}',
                textAlign: TextAlign.center,
              ),
              vSizedBox,

              TextButton(
                child: const Text('OK'),
                onPressed: () {

                  Navigator.of(context).pop();
                  checkInternet(context);
                  // push(context: context, screen: TabsPage());
                },
              ),
            ],
          ),
        ),
      );
    },
  );




}


String? myCookies;



// late  WebViewController myController;

