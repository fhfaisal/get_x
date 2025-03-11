import 'package:equatable/equatable.dart';
import 'common_business_entity.dart';

class NearbyBusinessListEntity extends Equatable {
  final String? status;
  final List<CommonBusinessEntity>? data;

  const NearbyBusinessListEntity({
    this.status,
    this.data,
  });

  @override
  List<Object?> get props => [status, data];
}
