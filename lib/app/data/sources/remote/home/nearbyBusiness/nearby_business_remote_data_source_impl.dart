
import 'package:get_x/app/data/models/nearbyBusiness/nearby_business_list.dart';

import '../../../../../../core/network/api_client.dart';
import '../../../../../../core/network/api_constants.dart';
import 'nearby_business_remote_data_source.dart';

class NearbyBusinessRemoteDataSourceImpl implements NearbyBusinessRemoteDataSource{
  final DioClient _dioClient = DioClient.instant;

  @override
  Future<NearbyBusinessListModel> getBusiness({required Map<String,dynamic>values}) async {
    try {
      final response = await _dioClient.get('${'https://13.60.231.236/creed/api/'}${ApiConstants.nearbyBusiness}', queryParameters: values);
      final model = NearbyBusinessListModel.fromJson(response.data);
      return model;
    } catch (_) {
      rethrow;
    }
  }
}