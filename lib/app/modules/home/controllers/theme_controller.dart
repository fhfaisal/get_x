import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _storage = GetStorage();
  final Rx<ThemeMode> _themeMode = ThemeMode.system.obs;

  // Getter for theme mode
  ThemeMode get themeMode => _themeMode.value;

  // Getter to check if dark mode is active
  bool isDarkMode(BuildContext context) {
    final platformBrightness = MediaQuery.of(context).platformBrightness;
    return _themeMode.value == ThemeMode.dark ||
        (_themeMode.value == ThemeMode.system && platformBrightness == Brightness.dark);
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    // Load saved theme mode from storage if available
    final savedThemeIndex = _storage.read('themeMode');
    if (savedThemeIndex != null) {
      _themeMode.value = ThemeMode.values[savedThemeIndex];
    }
  }

  /// Toggle theme based on the switch value.
  /// If brightness is dark (switch is on), set dark theme.
  /// Otherwise, set light theme.
  void toggleTheme({required Brightness brightness}) {
    if (brightness == Brightness.dark) {
      _themeMode.value = ThemeMode.dark;
      _storage.write('themeMode', ThemeMode.dark.index);
    } else {
      _themeMode.value = ThemeMode.light;
      _storage.write('themeMode', ThemeMode.light.index);
    }

    // Update the GetX theme mode
    Get.changeThemeMode(_themeMode.value);
    update();
  }

}