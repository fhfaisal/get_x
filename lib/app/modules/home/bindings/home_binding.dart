import 'package:get/get.dart';
import 'package:get_x/app/domain/repositories/search/search_repository.dart';
import 'package:get_x/app/data/repositories/search/search_repository_impl.dart';
import '../../../../core/network/api_client.dart';
import '../../../data/sources/remote/search/search_remote_data_source.dart';
import '../../../data/sources/remote/search/search_remote_data_source_impl.dart';
import '../../../domain/usecases/auth/search_usecase.dart';
import '../controllers/home_controller.dart';
import '../controllers/search_controller.dart';
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // First register the DioClient
    Get.lazyPut<DioClient>(
          () => DioClient(), // Register this FIRST
    );

    // Then register the data source with DioClient dependency
    Get.lazyPut<SearchRemoteDataSource>(
          () => SearchRemoteDataSourceImpl(Get.find<DioClient>()),
    );

    // Then register the repository
    Get.lazyPut<SearchRepository>(
          () => SearchRepositoryImpl(Get.find<SearchRemoteDataSource>()),
    );

    // Then register the SearchUseCase
    Get.lazyPut<SearchUseCase>(
          () => SearchUseCase(Get.find<SearchRepository>()),
    );

    // Then register controllers that depend on it
    Get.lazyPut<HomeController>(
          () => HomeController(Get.find<SearchUseCase>()),
    );

    Get.lazyPut<SearchBoxController>(
          () => SearchBoxController(Get.find<SearchUseCase>()),
    );
  }
}