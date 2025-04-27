import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/modules/auth/controllers/auth_controller.dart';
import 'package:get_x/app/routes/app_pages.dart';
import 'package:get_x/core/utils/common/commonWidgets/theme_toggle.dart';

class HomeDrawer extends GetView<AuthController> {
   const HomeDrawer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          /// Drawer header
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: const Text("Menu"),
          ),

          ///Its a language switcher
          // PopupMenuButton<String>(
          //   onSelected: (value) {
          //     Locale newLocale;
          //     if (value == 'en') {
          //       newLocale = const Locale('en');
          //     } else {
          //       newLocale = const Locale('bn');
          //     }
          //     // You might use a callback or state management to notify the main app
          //     // For this example, assume you have a method to update the locale.
          //     // One approach is to use an InheritedWidget or a state management solution.
          //     MyApp.of(context)?.setLocale(newLocale);
          //   },
          //   itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          //     const PopupMenuItem<String>(
          //       value: 'en',
          //       child: Text("English"),
          //     ),
          //     const PopupMenuItem<String>(
          //       value: 'bn',
          //       child: Text("বাংলা"),
          //     ),
          //   ],
          // ),
          /// Theme Toggle using SwitchListTile
          ThemeToggle(),

          /// Logout option
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              //controller.storage.clearAllData();
              controller.signOut();
              Get.offAllNamed(Routes.AUTH);
            },
          ),
        ],
      ),
    );
  }
}