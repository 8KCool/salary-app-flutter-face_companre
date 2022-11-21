import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../constants/colors.dart';
import '../constants/sized_box.dart';
import 'CustomTexts.dart';

class DropDwon extends StatefulWidget {
  final String label;
  final Color? labelcolor;
  final Color? bgColor;
  final double? fontsize;
  final List<String> items;
  final bool islabel;
  final bool isBorder;
  final Function(String?)? onChange;
  final String? value;

  const DropDwon({
    Key? key,
    this.label = 'label',
    this.labelcolor = MyColors.bordercolor,
    this.fontsize = 14,
    this.items = const [
      'All',
      'Option 1',
      'Option 2',
      'Option 3',
      'Option 4',
    ],
    this.islabel = true,
    this.isBorder = true,
    this.bgColor = Colors.white,
    this.onChange,
    this.value


}) : super(key: key);

  @override
  State<DropDwon> createState() => _DropDwonState();
}

class _DropDwonState extends State<DropDwon> {
  // final List<String> items = [
  //   'All',
  //   'Option 1',
  //   'Option 2',
  //   'Option 3',
  //   'Option 4',
  // ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vSizedBox2,
          if(widget.islabel)
          ParagraphText(
            text: widget.label,
            fontSize: widget.fontsize,
            color: widget.labelcolor,
          ),
          if(widget.islabel)
          SizedBox(height: 7),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Text(
                widget.items[0],
                style: TextStyle(
                  fontSize: 14,
                  color: MyColors.bordercolor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              items: widget.items
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
              value: widget.value,
              onChanged: widget.onChange,
              //     (value) {
              //   setState(() {
              //     selectedValue = value as String?;
              //   });
              // },
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
                border: widget.isBorder ? Border.all(
                  color: MyColors.bordercolor,
                ) : null,
                // color: MyColors.primaryColor,
                color: widget.bgColor,
              ),
              buttonElevation: 0,
              itemHeight: 30,
              itemPadding: const EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight: 200,
              dropdownWidth: MediaQuery.of(context).size.width - 74,
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
