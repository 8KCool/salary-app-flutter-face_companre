import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/sized_box.dart';
import 'CustomTexts.dart';

class RowItem extends StatelessWidget {
  final String text;
  final String price;
  final bool isAdd;
  final bool isUnpaid;

  const RowItem({Key? key,
    required this.text,
    required this.price,
    this.isAdd = false,
    this.isUnpaid = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Row(
              children: [
                ParagraphText(text: text, color: MyColors.black,),
                hSizedBox2,
                if(isUnpaid)
                ParagraphText(text: 'UNPAID - ₹ 2,000', color: MyColors.red, fontSize: 14,),
                if(isUnpaid)
                hSizedBox2,
                if(isAdd)
                ParagraphText(text: '+ ADD', color: MyColors.primaryColor, fontSize: 14,),
              ],
            )
        ),
        ParagraphText(text: price, color: MyColors.black,)
      ],
    );
  }
}
