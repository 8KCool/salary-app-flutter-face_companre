import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/sized_box.dart';
import '../providers/clock.dart';
import 'CustomTexts.dart';

class DropDwonNew extends StatefulWidget {
  final String label;
  final String hintlabel;
  final Color? labelcolor;
  // final List<String> items;
  final bool islabel;
  final Function(String?) onChange;
  final  String? selectedValue;
  final  List<DropdownMenuItem<String>>? items;


  const DropDwonNew({
    Key? key,
    this.label = 'label',
    this.hintlabel = 'Select',
    required this.onChange,
    this.selectedValue,
    this.labelcolor = MyColors.bordercolor,
    this.items ,
    this.islabel = true,


  }) : super(key: key);

  @override
  State<DropDwonNew> createState() => _DropDwonNewState();
}

class _DropDwonNewState extends State<DropDwonNew> {
  // final List<String> items = [
  //   'All',
  //   'Option 1',
  //   'Option 2',
  //   'Option 3',
  //   'Option 4',
  // ];

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
              fontSize: 14,
              color: widget.labelcolor,
            ),
          SizedBox(height: 7),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Text(
                widget.hintlabel,
                style: TextStyle(
                  fontSize: 14,
                  color: MyColors.bordercolor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              items: widget.items,
              // items: Provider.of<GlobalModal>(context, listen: false).departmentBranchAll.map((e) {
              //   return DropdownMenuItem<String>(
              //     value: e['name'].toString(),
              //     child: Text(e['name']),
              //   );
              // }).toList(),

              value: widget.selectedValue,
              onChanged:widget.onChange,
              //     (value) {
              //   setState(() {
              //     selectedValue = value as String?;
              //
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
              dropdownWidth: MediaQuery.of(context).size.width-74,
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

