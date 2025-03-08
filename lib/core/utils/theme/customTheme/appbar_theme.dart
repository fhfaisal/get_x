
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/sizes.dart';
import 'text_theme.dart';

class AppAppBarTheme {
  AppAppBarTheme._();
  static const String fontFamily = AppConstants.fontFamily;
  static final lightAppBar = AppBarTheme(
    elevation: 2,
    scrolledUnderElevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: AppSizes.icon24),
    actionsIconTheme: IconThemeData(color: Colors.black, size: AppSizes.icon24),
    titleTextStyle: AppTextTheme.lightTextTheme.headlineSmall!,
  );

// AppBar Theme

  static final darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.white, size: AppSizes.icon24),
    actionsIconTheme: IconThemeData(color: Colors.white, size: AppSizes.icon24),
    titleTextStyle: AppTextTheme.darkTextTheme.headlineSmall!,
  );
} // AppBar Theme
