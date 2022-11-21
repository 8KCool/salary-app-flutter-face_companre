import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'CustomTexts.dart';

class DropDownBottomSheet extends StatelessWidget {
  final String label;
  final String hint;
  final Function()? func;

  const DropDownBottomSheet({Key? key,
    required this.label,
    required this.hint,
    required this.func,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ParagraphText(text: label, color: MyColors.black,),
        GestureDetector(
          onTap: func,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: MyColors.bordercolor,
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ParagraphText(text: hint, color: MyColors.bordercolor, fontSize: 14, fontFamily: 'regular',),
                Icon(Icons.expand_more_rounded, size: 18,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
