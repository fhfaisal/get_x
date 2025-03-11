
import 'package:get_x/app/data/models/nearbyBusiness/nearby_business_list.dart';
import 'package:get_x/app/domain/entities/business/nearby_business_list_entity.dart';

import '../../../../models/nearbyBusiness/common_business_model.dart';

abstract class NearbyBusinessRemoteDataSource {
  /// Sends a sign in request and returns a [UserModel] on success.
  Future<NearbyBusinessListModel> getBusiness({required Map<String,dynamic>values});
}