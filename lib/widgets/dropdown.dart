import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../constants/colors.dart';
import '../constants/sized_box.dart';
import 'CustomTexts.dart';

class DropDwon extends StatelessWidget {
  const DropDwon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      '0 - 10',
      '10 - 50',
      '50 - 100',
      '100 - 50',
      '150 - 200',
    ];
    String? selectedValue;
    return Container(
      child: Column(
        children: [
          vSizedBox2,
          ParagraphText(
            text: 'Select Employee Count',
            fontSize: 14,
            color: MyColors.bordercolor,
          ),
          SizedBox(height: 7),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Text(
                '0 - 10',
                style: TextStyle(
                  fontSize: 14,
                  color: MyColors.bordercolor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              items: items
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                // setState(() {
                //   selectedValue = value as String;
                // });
              },
              icon: const Icon(
                Icons.expand_more_outlined,
              ),
              iconSize: 20,
              iconEnabledColor: MyColors.bordercolor,
              iconDisabledColor: Colors.grey,
              buttonHeight: 52,
              buttonWidth: MediaQuery.of(context).size.width,
              buttonPadding: const EdgeInsets.only(left: 14, right: 14),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: MyColors.bordercolor,
                ),
                // color: MyColors.primaryColor,
                color: Colors.white,
              ),
              buttonElevation: 0,
              itemHeight: 30,
              itemPadding: const EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight: 200,
              dropdownWidth: MediaQuery.of(context).size.width - 48,
              dropdownPadding: null,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
                border: Border.all(
                  color: MyColors.bordercolor,
                ),

              ),
              dropdownElevation: 0,
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 6,
              scrollbarAlwaysShow: true,
              offset: const Offset(0, 0),
            ),
          ),
        ],
      ),
    );
  }
}
