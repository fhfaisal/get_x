import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_x/core/utils/constants/sizes.dart';

import '../../home/controllers/home_controller.dart';
import '../../home/views/home_view.dart';
import '../controllers/bottom_navbar_controller.dart';

class BottomNavbarView extends GetView<BottomNavbarController> {
  const BottomNavbarView({super.key});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //await controller.showAlertDialog(context);
        return true;
      },
      child: Obx(() => Scaffold(
        body: getPage(controller.selectedIndex.value),
        bottomNavigationBar: BottomNavigationBar(
          elevation: AppSizes.elevation8,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).navigationBarTheme.backgroundColor,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.onSecondary,
          selectedIconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
          unselectedIconTheme: IconThemeData(color: Theme.of(context).colorScheme.onSecondary),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          currentIndex: controller.selectedIndex.value,
          onTap: (value) => controller.changeTabIndex(value),

          items:  [
            BottomNavigationBarItem(
              label:'home'.tr,
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label:'Search'.tr,
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label:'profile'.tr,
              icon: Icon(Icons.person),
            ),
          ],
        ),
      )),
    );
  }
}

Widget getPage(int index) {
  switch (index) {
    case 0:
      return const HomeView();
    case 1:
      return SearchBox();
    case 2:
      return Container();
    default:
      return Center(
        child: Text("something wrong"),
      );
  }
}
