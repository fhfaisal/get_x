
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../constants/sizes.dart';
import 'text_theme.dart';

class AppSearchBarTheme {
  AppSearchBarTheme._();
  static const String fontFamily = AppConstants.fontFamily;
  static final lightSearchBar = SearchBarThemeData(
    elevation: WidgetStateProperty.all(0),
      shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  AppSizes.inputFieldRadius12),
            side: BorderSide(color: AppColors.primary.withOpacity(0.5))
          )),
    backgroundColor: WidgetStateProperty.all(AppColors.searchBg),
    textStyle: WidgetStateProperty.all(AppTextTheme.lightTextTheme.bodyMedium),
    hintStyle: WidgetStateProperty.all(AppTextTheme.lightTextTheme.bodyMedium),
    side: WidgetStateProperty.all(const BorderSide(color: AppColors.primary,))
  );

// AppBar Theme

  static final darkSearchBar = SearchBarThemeData(
      elevation: WidgetStateProperty.all(0),
      shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  AppSizes.inputFieldRadius12),
              side: BorderSide(color: AppColors.primary.withOpacity(0.5))
          )),
      backgroundColor: WidgetStateProperty.all(AppColors.searchBg),
      textStyle: WidgetStateProperty.all(AppTextTheme.darkTextTheme.bodyMedium),
      hintStyle: WidgetStateProperty.all(AppTextTheme.darkTextTheme.bodyMedium),
      side: WidgetStateProperty.all(const BorderSide(color: AppColors.primary,))
  );
} // AppBar Theme
