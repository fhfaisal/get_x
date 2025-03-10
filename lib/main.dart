import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x/core/utils/theme/theme.dart';

import 'app/modules/home/controllers/theme_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetStorage
  await GetStorage.init();

  // Register ThemeController
  Get.put(ThemeController());

  // // Initialize StorageService
  // final StorageService storage = StorageService();
  //
  // // Check if user is logged in
  // final bool isLoggedIn = storage.isLoggedIn();

  // // Set initial route dynamically
  // final String initialRoute = isLoggedIn ? Routes.HOME : Routes.AUTH;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  //MyApp({Key? key, required this.initialRoute}) : super(key: key);
  MyApp({super.key});

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
      initialRoute: AppPages.INITIAL, // Set dynamically based on auth state
      getPages: AppPages.routes,
    );
  }
}
