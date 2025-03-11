import 'package:dartz/dartz.dart';
import 'package:get_x/app/data/models/nearbyBusiness/common_business_model.dart';

import '../../../../../core/error/failures.dart';
import '../../../../data/models/nearbyBusiness/nearby_business_list.dart';
import '../../../entities/business/common_business_entity.dart';

abstract class NearbyBusinessRepository {
  Future<Either<Failure, NearbyBusinessListModel>> getBusiness({required Map<String,dynamic>values});
}