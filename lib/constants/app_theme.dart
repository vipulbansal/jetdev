import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color primaryBGColor;
  final Color secondaryBGColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color primaryTextColorGrey;
  final Color primaryTextColorWhite;
  final Color lightGray;
  final Color lightGreen;

  AppTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.primaryBGColor,
    required this.secondaryBGColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.primaryTextColorGrey,
    required this.primaryTextColorWhite,
    required this.lightGray,
    required this.lightGreen,
  });

  static AppTheme light = AppTheme(
    primaryColor: const Color(0xFF8A1538),
    secondaryColor: const Color(0xff158A67),
    primaryBGColor: const Color(0xFFFFFFFF),
    secondaryBGColor: const Color(0xFFEEEDE2),
    primaryTextColor: const Color(0xff343434),
    secondaryTextColor: const Color(0xff2D2D2D),
    primaryTextColorGrey: const Color(0xff535353),
    primaryTextColorWhite: const Color(0xFFFFFFFF),
    lightGray: const Color.fromRGBO(244, 245, 247, 1),
    lightGreen: const Color.fromRGBO(39, 174, 96, 0.1),
  );

  static AppTheme dark = AppTheme(
    primaryColor: const Color(0xFF5C5C5C),
    secondaryColor: const Color(0xff158A67),
    primaryBGColor: const Color(0xFF181818),
    secondaryBGColor: const Color(0xFF212121),
    primaryTextColor: const Color(0xFFFFFFFF),
    secondaryTextColor: const Color(0xFF909090),
    primaryTextColorGrey: const Color(0xff535353),
    primaryTextColorWhite: const Color(0xFFFFFFFF),
    lightGray: const Color.fromRGBO(244, 245, 247, 1),
    lightGreen: const Color.fromRGBO(39, 174, 96, 0.1),
  );

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color lightBlueGray = Color(0xFF8690A2);
  static const Color offWhite = Color(0xFFF2F6F7);
  static const Color darkBlue = Color(0xFF0A1646);
  static const Color deepRed = Color(0xFF70193D);
  static const Color lightGrayTransparent = Color(0xAFAFAF33);
  static const Color veryLightGray = Color(0xFFF4F5F7);
  static const Color gray = Color(0xFF707070);
  static const Color grayBorderColor = Color(0x00000029);

  static const Color navyBlue = Color(0xFF172B4D);
  static const Color navyBlue1 = Color(0xFF42526E);
  static const Color brightRed = Color(0xFF89163A);
  static const Color paleBlue = Color(0xFFB1BED3);
  static const Color paleBlue1 = Color(0xFFD8E0ED);
  static const Color paleBlue2 = Color(0xFFC1C7D0);
  static const Color hintTextColor = Color(0xFF84878D);
  static const Color yellow = Color(0xFFF1A605);
  static const Color whiteTransparent = Color(0xFFFFFF1A);
  static const Color lightGreenNew = Color(0xFF27AE60);
  static const Color lightGreenNew1 = Color(0xFF429082);
  static const Color red = Color(0xFFFF0000);
  static const Color rejectButton = Color(0xFFB50013);
  static const Color drawerClose = Color(0xFF0E254D);
}

class AppThemeManager with ChangeNotifier {
  static final AppThemeManager _current = AppThemeManager._();

  AppThemeManager._();

  // Default
  AppTheme currentTheme = AppTheme.light;

  static ThemeMode _mode(ThemeMode themeMode) {
    return themeMode;
  }

  static Color get primaryColor =>
      AppThemeManager._current.currentTheme.primaryColor;

  static Color get secondaryColor =>
      AppThemeManager._current.currentTheme.secondaryColor;

  static Color get primaryBGColor =>
      AppThemeManager._current.currentTheme.primaryBGColor;

  static Color get secondaryBGColor =>
      AppThemeManager._current.currentTheme.secondaryBGColor;

  static Color get primaryTextColor =>
      AppThemeManager._current.currentTheme.primaryTextColor;

  static Color get secondaryTextColor =>
      AppThemeManager._current.currentTheme.secondaryTextColor;

  static Color get selectingItemTextColor =>
      AppThemeManager._current.currentTheme.secondaryTextColor;

  static Color get aBackgroundColor =>
      AppThemeManager._current.currentTheme.primaryTextColorWhite;

  static Color get primaryTextColorGrey =>
      AppThemeManager._current.currentTheme.primaryTextColorGrey;

  static Color get primaryTextColorWhite =>
      AppThemeManager._current.currentTheme.primaryTextColorWhite;

  static Color get lightGrayColor =>
      AppThemeManager._current.currentTheme.lightGray;

  static Color get lightGreenColor =>
      AppThemeManager._current.currentTheme.lightGreen;

  static const renegeColor = Color(0xff00B288);

  static const textPrimary =
      TextStyle(fontSize: 14, fontWeight: FontWeight.normal);

  static const textSecondary =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  static const textTertiary =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  static TextStyle gilroyBold(
      {required double fontSize,
      Color color = Colors.black,
      TextDecoration decoration = TextDecoration.none}) {
    // fontSize = (LocalizationsManager.isArabic) ? fontSize * 1.1 : fontSize;
    return TextStyle(
        fontSize: fontSize,
        fontFamily: 'Gilroy',
        color: color,
        fontWeight: FontWeight.bold,
        decoration: decoration);
  }

  static TextStyle gilroySemiBold(
      {required double fontSize,
      Color color = Colors.black,
      TextDecoration decoration = TextDecoration.none}) {
    // fontSize = (LocalizationsManager.isArabic) ? fontSize * 1.1 : fontSize;
    return TextStyle(
        fontSize: fontSize,
        fontFamily: 'Gilroy',
        color: color,
        fontWeight: FontWeight.w600,
        decoration: decoration);
  }

  static TextStyle gilroyMedium(
      {required double fontSize,
      Color color = Colors.black,
      TextDecoration decoration = TextDecoration.none}) {
    // fontSize = (LocalizationsManager.isArabic) ? fontSize * 1.1 : fontSize;
    return TextStyle(
        fontSize: fontSize,
        fontFamily: 'Gilroy',
        color: color,
        fontWeight: FontWeight.w500,
        decoration: decoration);
  }

  static BoxDecoration borderDecoration({
    Color color = AppThemeManager.renegeColor,
    Color bgColor = AppThemeManager.renegeColor,
    double width = 1,
    double strokeAlign = BorderSide.strokeAlignCenter,
    double borderRadius = 4,
  }) {
    color = color == AppThemeManager.renegeColor ? primaryColor : color;
    bgColor = bgColor == AppThemeManager.renegeColor ? primaryBGColor : bgColor;
    return BoxDecoration(
      border: Border.all(
        color: color,
        width: width,
        strokeAlign: strokeAlign,
      ),
      borderRadius: BorderRadius.circular(borderRadius),
      color: bgColor,
    );
  }

  static ButtonStyle filledButton({
    Color fillColor = AppThemeManager.renegeColor,
    BorderRadius borderRadius = BorderRadius.zero,
  }) {
    fillColor =
        fillColor == AppThemeManager.renegeColor ? primaryColor : fillColor;
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(fillColor),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
    );
  }

  static ButtonStyle borderlineButton({
    Color fillColor = AppThemeManager.renegeColor,
    BorderRadius borderRadius = BorderRadius.zero,
  }) {
    fillColor =
        fillColor == AppThemeManager.renegeColor ? primaryColor : fillColor;
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(fillColor),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          side: BorderSide(
            color: primaryColor,
            width: 1.1,
          ),
          borderRadius: borderRadius,
        ),
      ),
    );
  }

  static const MaterialColor appPrimaryColor =
      MaterialColor(_appPrimaryColorPrimaryValue, <int, Color>{
    50: Color(0xFFF1E3E7),
    100: Color(0xFFDCB9C3),
    200: Color(0xFFC58A9C),
    300: Color(0xFFAD5B74),
    400: Color(0xFF9C3856),
    500: Color(_appPrimaryColorPrimaryValue),
    600: Color(0xFF821232),
    700: Color(0xFF770F2B),
    800: Color(0xFF6D0C24),
    900: Color(0xFF5A0617),
  });
  static const int _appPrimaryColorPrimaryValue = 0xFF8A1538;

  static const MaterialColor appPrimaryColorAccent =
      MaterialColor(_appPrimaryColorAccentValue, <int, Color>{
    100: Color(0xFFFF8C9D),
    200: Color(_appPrimaryColorAccentValue),
    400: Color(0xFFFF2647),
    700: Color(0xFFFF0D31),
  });
  static const int _appPrimaryColorAccentValue = 0xFFFF5972;
}
