
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';
import 'text_theme.dart';

class AppBottomNavigationTheme {
  AppBottomNavigationTheme._(); //To avoid creating instances
  static const String fontFamily = AppConstants.fontFamily;
  ///Light Theme
  static final lightBottomNavigationTheme = BottomNavigationBarThemeData(
    elevation: 10,
    backgroundColor: AppColors.lightGrey,
    selectedIconTheme: const IconThemeData(color: AppColors.primary),
    unselectedIconTheme: const IconThemeData(color: AppColors.light),
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.light,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    unselectedLabelStyle: AppTextTheme.lightTextTheme.titleLarge!.copyWith(fontSize: 10.0, fontWeight: FontWeight.w600,color: AppColors.disableText,fontFamily: fontFamily),
    selectedLabelStyle: AppTextTheme.lightTextTheme.titleLarge!.copyWith(fontSize: 10.0, fontWeight: FontWeight.w600, color: AppColors.primary,fontFamily: fontFamily),
  );

  ///DorkTheme
  static final darkElevatedButtonTheme = BottomNavigationBarThemeData(
    elevation: 10,
    backgroundColor: AppColors.darkerGrey,
    selectedIconTheme: const IconThemeData(color: AppColors.primary),
    selectedItemColor: AppColors.primary,
    unselectedIconTheme: const IconThemeData(color: AppColors.dark),
    unselectedItemColor: AppColors.dark,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    unselectedLabelStyle: AppTextTheme.darkTextTheme.titleLarge!.copyWith(fontSize: 10.0, fontWeight: FontWeight.w600,color: AppColors.disableText,fontFamily: fontFamily),
    selectedLabelStyle: AppTextTheme.darkTextTheme.titleLarge!.copyWith(fontSize: 10.0, fontWeight: FontWeight.w600, color: AppColors.primary,fontFamily: fontFamily),
  );
}