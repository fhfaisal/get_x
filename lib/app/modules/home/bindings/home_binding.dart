import 'package:get/get.dart';

import 'package:get_x/app/data/repositories/search/search_repository_impl.dart';
import 'package:get_x/app/domain/repositories/auth/auth_repository.dart';
import 'package:get_x/app/domain/repositories/search/search_repository.dart';
import 'package:get_x/app/domain/usecases/auth/auth_usecase.dart';
import 'package:get_x/app/modules/home/controllers/theme_controller.dart';

import '../../../../core/network/api_client.dart';
import '../../../data/sources/remote/search/search_remote_data_source.dart';
import '../../../data/sources/remote/search/search_remote_data_source_impl.dart';
import '../../../domain/usecases/auth/search_usecase.dart';
import '../controllers/home_controller.dart';
import '../controllers/search_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(
      () => ThemeController(),
    );
    // First register the DioClient
    Get.lazyPut<DioClient>(
      () => DioClient(), // Register this FIRST
    );
    // Then register controllers that depend on it
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<SearchBoxController>(
      () => SearchBoxController(),
    );
    Get.lazyPut<SearchUseCase>(
      () => SearchUseCase(),
    );
  }
}
