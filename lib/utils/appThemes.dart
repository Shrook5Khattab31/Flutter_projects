import 'package:flutter/material.dart';

import 'appColors.dart';
import 'appStyles.dart';

class AppThemes{
  static ThemeData appTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.goldColor,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.whiteColor,
      selectedLabelStyle: AppStyles.bold12white,
    ),
    primaryColor: AppColors.goldColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackBg,
      centerTitle: true,
    ),
  );
}