import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../constants/colors.dart';

class CustomPhoneNumberInputField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(Country) onInputChanged;
  String selectedCountry;
  CustomPhoneNumberInputField({
    Key? key,
    required this.controller,
    required this.onInputChanged,
    required this.selectedCountry

  }) : super(key: key);

  @override
  State<CustomPhoneNumberInputField> createState() => _CustomPhoneNumberInputFieldState();
}

class _CustomPhoneNumberInputFieldState extends State<CustomPhoneNumberInputField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      // padding: const EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(
          horizontal:0),
      decoration: BoxDecoration(
        // color: Colors.white,
          border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
        ),
        // border: Border,
        // borderRadius: BorderRadius.circular(8),
        // boxShadow:[
        //   shadow
        // ]
      ),

      child: TextField(

        controller: widget.controller,
        keyboardType: TextInputType.phone,
        style:TextStyle(fontFamily: 'av_book'),



        decoration: InputDecoration(
            contentPadding:EdgeInsets.all(0) ,
            hintText: 'Phone',
            border: InputBorder.none,

            prefixIcon: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){

                },
                child: Padding(

                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      // Icon(
                      //   Icons.favorite,
                      //   color: Colors.pink,
                      //   size: 24.0,
                      //   semanticLabel: 'Text to announce in accessibility modes',
                      // ),
                      Image.asset('assets/images/flag.png',height: 25,width: 25,),
                      SizedBox(width: 10,),
                      Text(widget.selectedCountry==null?"":'+' + '91',
                        style: TextStyle(fontSize: 16, fontFamily: 'av_book',),



                      ),
                    ],
                  ),
                )
            )
        ),
      ),
    );
  }
}
