import 'package:equatable/equatable.dart';

class OperationDataEntity extends Equatable {
  final int? id;
  final int? businessId;
  final String? day;
  final String? openTime;
  final String? closedTime;

  const OperationDataEntity({
    this.id,
    this.businessId,
    this.day,
    this.openTime,
    this.closedTime,
  });

  @override
  List<Object?> get props => [id, businessId, day, openTime, closedTime];
}
