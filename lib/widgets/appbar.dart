
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'CustomTexts.dart';

AppBar appBar(
    {String? title,
      Color appBarColor = MyColors.primaryColor,
      Color titleColor = Colors.white,
      bool implyLeading = true,
      IconData backIcon = Icons.chevron_left_outlined,
      double fontsize = 16,
      double leadingWidth = 50,
      double size = 25,
      // double toolbarHeight = 50,
      String badge = '0',
      String fontfamily = 'light',
      bool titlecenter = true,
      required BuildContext context,
      List<Widget>? actions, leading}) {
  return AppBar(
    // toolbarHeight: toolbarHeight,
    automaticallyImplyLeading: false,
    backgroundColor: appBarColor,
    elevation: 0,
    centerTitle: titlecenter,
    leadingWidth: leadingWidth,
    title: title == null
        ? null
        : AppBarHeadingText(
          text: title,
          color: titleColor,
          fontSize: fontsize,
          fontFamily: fontfamily,
        ),
    leading: implyLeading
        ? IconButton(
        icon:
        Icon(
         backIcon,
          color: titleColor,
          size: size,
        ),
      onPressed: () {
        Navigator.pop(context);
      },
    )
        : leading,
    actions: actions,
  );
}