import 'package:flutter/material.dart';
import 'package:getx_clean_architecture/common/colors.dart';

class LightAndDarkTheme {
  static ThemeData themeDatalight = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      textTheme: TextTheme(),
      primaryColor: AppColors.buttonColor.color);
  static ThemeData themeDataDark = ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      primaryColor: AppColors.white.color);
}
