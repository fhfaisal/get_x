import 'package:get/get.dart';
import 'package:get_x/app/data/repositories/auth/auth_repository_impl.dart';
import 'package:get_x/app/data/sources/local/auth_local_data_source.dart';
import 'package:get_x/app/data/sources/local/auth_local_data_source_impl.dart';
import 'package:get_x/app/data/sources/remote/auth/auth_remote_data_source.dart';
import 'package:get_x/app/data/sources/remote/auth/auth_remote_data_source_impl.dart';
import 'package:get_x/app/domain/repositories/auth/auth_repository.dart';
import 'package:get_x/app/domain/usecases/auth/auth_usecase.dart';
import 'package:get_x/core/network/api_client.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(
          () => DioClient(),
    );
    Get.lazyPut<AuthLocalDataSource>(
          () => AuthLocalDataSourceImpl(),
    );
    Get.lazyPut<AuthRemoteDataSource>(
          () => AuthRemoteDataSourceImpl(Get.find<DioClient>()),
    );
    Get.lazyPut<AuthRepository>(
          () => AuthRepositoryImpl(remoteDataSource: Get.find<AuthRemoteDataSource>(), localDataSource: Get.find<AuthLocalDataSource>()),
    );

    Get.lazyPut<AuthUseCase>(
          () => AuthUseCase(Get.find<AuthRepository>()),
    );
    Get.lazyPut<AuthController>(
          () => AuthController(authUseCase:Get.find<AuthUseCase>()),
    );
  }
}
