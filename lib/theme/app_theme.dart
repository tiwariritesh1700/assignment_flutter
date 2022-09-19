import 'package:assignment_flutter/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme{

  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: AppColors.primarySwatchColor,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.bgColor,
      backgroundColor: AppColors.bgColor,
      primaryIconTheme: const IconThemeData(color: AppColors.whiteColor),
      indicatorColor: AppColors.primaryColor,
      toggleableActiveColor: AppColors.primaryColor,
      );
}