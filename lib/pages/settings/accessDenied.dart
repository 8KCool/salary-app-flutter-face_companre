import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/widgets/appbar.dart';

import '../../widgets/buttons.dart';
class AccessDenied extends StatefulWidget {
  final String title;
  const AccessDenied({Key? key,required this.title}) : super(key: key);

  @override
  State<AccessDenied> createState() => _AccessDeniedState();
}

class _AccessDeniedState extends State<AccessDenied> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appBar(context: context, title: '${widget.title}',titlecenter:false,
      // leading:Icon(Icons.arrow_back,),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 180,left: 32,right: 32,),
        color: Colors.white,
        height: 800,
        child: Center(
          child: Column(
            children: [
              Icon(Icons.help_outline,color: Colors.red,size: 60,),
              vSizedBox2,
              Text('ACCESS DENIED',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
              vSizedBox,
              Text('You do\'nt have access ${widget.title}.\n        Please ugrade your plan.',style: TextStyle(fontSize: 16),),
              vSizedBox,
              RoundEdgedButton(
             text: 'UPGRADE',
              fontSize: 16,
              width: 150,),
              vSizedBox,
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back,color:Color(0xFF4B5563),),
                    hSizedBox,
                    Text('GO back',style: TextStyle(color: Color(0xFF4B5563)),)

                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
