import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData themeEnglish = ThemeData(
  //IMP TO  APP
  fontFamily: 'Red Hat Display',
  dialogTheme: const DialogTheme(shadowColor: AppColor.secondary),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        color: AppColor.primaryText, fontSize: 24.0, fontWeight: FontWeight.w800),
    displayMedium: TextStyle(
        color: AppColor.primaryText, fontSize: 18.0, fontWeight: FontWeight.w700),
    displaySmall: TextStyle(
        color: AppColor.black87,
        fontSize: 14.0,
        letterSpacing: 0.875,
        fontWeight: FontWeight.w400),
    bodyLarge: TextStyle(
        color: AppColor.primaryText,
        fontSize: 18.0,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w700),

    bodyMedium: TextStyle(
        color: AppColor.black87,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25),
    //caption
    bodySmall: TextStyle(
        fontFamily: 'Roboto',
        color: AppColor.black87,
        fontSize: 12.0,
        letterSpacing: 0.4,
        fontWeight: FontWeight.w400),
    //BUTTON
    labelLarge: TextStyle(
        fontFamily: 'Roboto',
        color: AppColor.primaryText,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25),
    //overLine
    labelSmall: TextStyle(
        fontFamily: 'Roboto',
        color: AppColor.black87,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5),
  ),

  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue.shade50,
      primary: AppColor.primary,
      onPrimary: AppColor.alternate),
  useMaterial3: true,
);
ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        color: AppColor.primaryText,
        fontSize: 24.0,
        letterSpacing: 0.15,
        fontWeight: FontWeight.w600),
    displayMedium: TextStyle(
        color: AppColor.primaryText,
        fontSize: 18.0,
        letterSpacing: 0.15,
        fontWeight: FontWeight.w700),

    displaySmall: TextStyle(
        color: AppColor.secondaryText,
        fontSize: 14.0,
        letterSpacing: 0.875,
        fontWeight: FontWeight.w400),
    bodyLarge: TextStyle(
        color: AppColor.primaryText,
        fontSize: 18.0,
        letterSpacing: 0.15,
        fontWeight: FontWeight.w700),
    bodyMedium: TextStyle(
        color: AppColor.primaryText,
        fontSize: 16.0,
        letterSpacing: 0.25,
        fontWeight: FontWeight.w400),
    //caption
    bodySmall: TextStyle(
        color: AppColor.primaryText,
        fontSize: 12.0,
        letterSpacing: 0.4,
        fontWeight: FontWeight.w400),
    //BUTTON
    labelLarge: TextStyle(
        color: AppColor.primaryText,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.25),
    //overLine
    labelSmall: TextStyle(
        fontFamily: 'Roboto',
        color: AppColor.black87,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5),
  ),
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue.shade50,
      primary: AppColor.primary,
      onPrimary: AppColor.alternate),
  useMaterial3: true,
);
