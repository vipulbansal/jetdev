import 'package:flutter/material.dart';
import 'package:vipul_jet_assignment/config/routes/navigation_helper.dart';


import '../constants/app_theme.dart';

///like divider in between vertical
Widget verticalSpacer(double height) {
  return SizedBox(
    height: height,
  );
}

///like divider in between horizontal
Widget horizontalSpacer(double width) {
  return SizedBox(
    width: width,
  );
}

///text title above of text field form
Widget title(String title, {TextStyle? textStyle}) {
  return Text(title,
      textAlign: TextAlign.center,
      style: textStyle ??
          AppThemeManager.gilroySemiBold(
            fontSize: 14,
            color: AppThemeManager.primaryTextColor,
          ));
}

