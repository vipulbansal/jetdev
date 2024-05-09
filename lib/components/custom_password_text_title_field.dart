import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vipul_jet_assignment/components/widgets_helper.dart';

import '../constants/app_theme.dart';




class CustomPasswordTextTitleField extends StatelessWidget {
  final bool isPassword;
  final String hint;
  final TextEditingController controller;
  final VoidCallback onPressedValue;

  const CustomPasswordTextTitleField({super.key, required this.isPassword, required this.hint, required this.controller, required this.onPressedValue});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title(hint),
          verticalSpacer(5),
          TextFormField(
            controller: controller,
            inputFormatters: [
              LengthLimitingTextInputFormatter(35),
            ],
            style: AppThemeManager.gilroyMedium(fontSize: 14, color: AppThemeManager.primaryTextColor),
            cursorColor: AppThemeManager.primaryColor,
            textInputAction: TextInputAction.next,
            obscureText: !isPassword,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppThemeManager.gilroyMedium(
                fontSize: 14,
                color: AppThemeManager.secondaryTextColor, // Add the hint color here
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppThemeManager.primaryBGColor, width: 0),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppThemeManager.primaryColor, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              border: InputBorder.none,
              fillColor: AppThemeManager.lightGrayColor,
              filled: true,
              suffixIcon: IconButton(
                icon: Icon(
                  isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: isPassword ? AppThemeManager.primaryColor : AppThemeManager.primaryTextColor,
                ),
                onPressed: () {
                  onPressedValue();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
