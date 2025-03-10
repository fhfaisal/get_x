
import 'package:get/get.dart';
import 'package:get_x/app/domain/usecases/auth/search_usecase.dart';
import 'package:get_x/app/modules/home/controllers/home_controller.dart';
import 'package:get_x/core/network/api_client.dart';

import '../../home/controllers/search_controller.dart';
import '../controllers/bottom_navbar_controller.dart';

class BottomNavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavbarController>(
      () => BottomNavbarController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<SearchBoxController>(
      () => SearchBoxController(),
    );
    Get.lazyPut<SearchUseCase>(
      () => SearchUseCase(),
    );Get.lazyPut<DioClient>(
      () => DioClient(),
    );

  }
}
