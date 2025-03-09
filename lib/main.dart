import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x/core/utils/theme/theme.dart';

import 'app/modules/home/controllers/theme_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  // Initialize GetStorage
  await GetStorage.init();

  // Register ThemeController
  Get.put(ThemeController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // Get the theme controller
  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      // Use Obx to reactively update theme
      themeMode: themeController.themeMode,
      theme: AppTheme.lightTheme, // Your light theme
      darkTheme: AppTheme.darkTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
