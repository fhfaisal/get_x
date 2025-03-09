import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/modules/home/controllers/theme_controller.dart';

class ThemeToggle extends GetWidget<ThemeController> {
  const ThemeToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = controller.isDarkMode(context);
      return ListTile(
        leading: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
        title: Text(isDark ? "Light Mode" : "Dark Mode"),
        trailing: Switch(
          value: isDark,
          onChanged: (value) {
            controller.toggleTheme(
              brightness: value ? Brightness.dark : Brightness.light,
            );
          },
        ),
      );
    });
  }
}