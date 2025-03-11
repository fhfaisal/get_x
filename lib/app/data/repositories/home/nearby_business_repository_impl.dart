import 'package:dartz/dartz.dart';
import 'package:get_x/app/data/models/nearbyBusiness/common_business_model.dart';
import 'package:get_x/app/data/models/nearbyBusiness/nearby_business_list.dart';
import 'package:get_x/app/domain/entities/business/common_business_entity.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/safe_api_call.dart';
import '../../../domain/repositories/home/getAllBusiness/nearby_business_repository.dart';
import '../../sources/remote/home/nearbyBusiness/nearby_business_remote_data_source.dart';
import '../../sources/remote/home/nearbyBusiness/nearby_business_remote_data_source_impl.dart';

class NearbyBusinessRepositoryImpl implements NearbyBusinessRepository {
  final NearbyBusinessRemoteDataSource nearbyBusinessRemoteDataSource = NearbyBusinessRemoteDataSourceImpl();

  @override
  Future<Either<Failure, NearbyBusinessListModel>> getBusiness({required Map<String, dynamic> values}) {
    return safeApiCall<NearbyBusinessListModel>(() async {
      final model = await nearbyBusinessRemoteDataSource.getBusiness(values: values);
      return model;
    });
  }
}
