
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get_x/app/data/models/nearbyBusiness/common_business_model.dart';
import 'package:get_x/app/data/models/nearbyBusiness/nearby_business_list.dart';
import 'package:get_x/app/data/repositories/home/nearby_business_repository_impl.dart';
import 'package:get_x/app/domain/repositories/home/getAllBusiness/nearby_business_repository.dart';

import '../../../../core/error/failures.dart';

class NearbyBusinessUseCase{
  static NearbyBusinessUseCase get instance=>Get.find();
  final NearbyBusinessRepository nearbyBusinessRepository=NearbyBusinessRepositoryImpl();
  Future<Either<Failure, NearbyBusinessListModel>> getNearbyBusiness({required Map<String,dynamic>values}){
    return nearbyBusinessRepository.getBusiness(values: values);
  }
}