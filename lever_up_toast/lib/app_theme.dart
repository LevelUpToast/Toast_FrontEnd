// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lever_up_toast/values/values.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const _lightFillColor = Colors.black;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData =
  themeData(lightColorScheme, _lightFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      iconTheme: IconThemeData(color: AppColors.white),
      canvasColor: colorScheme.background,
      appBarTheme: AppBarTheme(
        color: AppColors.primaryColor,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.black,
        selectionColor: AppColors.secondaryColor,
        selectionHandleColor: AppColors.secondaryColor,
      ),
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      accentColor: colorScheme.primary,
      focusColor: AppColors.primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: AppColors.primaryColor,
    primaryVariant: AppColors.primaryColor,
    secondary: AppColors.secondaryColor,
    secondaryVariant: AppColors.black,
    background: AppColors.primaryColor,
    surface: AppColors.primaryColor,
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xCC88A67B),
    onSurface: Color(0x9988A67B),
    brightness: Brightness.light,
  );

  static const _bold = FontWeight.w700;
  static const _semiBold = FontWeight.w500;
  static const _medium = FontWeight.w400;
  static const _regular = FontWeight.w300;
  static const _semiLight = FontWeight.w200;
  static const _light = FontWeight.w100;


  static final TextTheme _textTheme = TextTheme(
    headline1: TextStyle(
      fontFamily: StringConst.Roboto,
      fontSize: Sizes.TEXT_SIZE_96,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
  );
}
