import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vipul_jet_assignment/components/widgets_helper.dart';

import '../constants/app_theme.dart';


class CustomEmailTextTitleField extends StatelessWidget {
  final String? headerTitle;
  final bool emailVerified;
  final String hint;
  final TextEditingController controller;
  final ValueChanged onChangedValue;
  final TextStyle hintStyle;
  final TextStyle headerStyle;
  final bool enabled;

  CustomEmailTextTitleField(
      {super.key,
      this.headerTitle,
      required this.onChangedValue,
      required this.controller,
      required this.hint,
      required this.emailVerified,
      TextStyle? hintStyle,
      TextStyle? headerStyle,
      this.enabled=true,})
      : hintStyle = hintStyle ??
            AppThemeManager.gilroyMedium(
              fontSize: 14,
              color:
                  AppThemeManager.secondaryTextColor, // Add the hint color here
            ),
        headerStyle = headerStyle ??
            AppThemeManager.gilroySemiBold(
              fontSize: 14,
              color: AppThemeManager.primaryTextColor,
            );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(headerTitle != null ? headerTitle ?? '' : 'email',
            textStyle: headerStyle),
        verticalSpacer(5),
        TextFormField(
          controller: controller,
          inputFormatters: [
            LengthLimitingTextInputFormatter(35),
          ],
          enabled: enabled,
          style: AppThemeManager.gilroyMedium(
              fontSize: 14, color: AppThemeManager.primaryTextColor),
          cursorColor: AppThemeManager.primaryColor,
          textInputAction: TextInputAction.next,
          obscureText: false,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: hintStyle,
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppThemeManager.primaryBGColor, width: 0),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppThemeManager.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            border: InputBorder.none,
            fillColor: AppThemeManager.lightGrayColor,
            filled: true,
            suffixIcon: Visibility(
              visible: emailVerified,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: SvgPicture.asset(
                  'assets/images/email_verified_icon.svg',
                ),
              ),
            ),
          ),
          onChanged: (text) {
            if (controller.text.length > 5 &&
                    controller.text.toString().contains('@') &&
                    controller.text.endsWith('.com') ||
                controller.text.endsWith('.us')) {
              onChangedValue(true);
            } else {
              onChangedValue(false);
            }
          },
        ),
      ],
    );
  }
}
