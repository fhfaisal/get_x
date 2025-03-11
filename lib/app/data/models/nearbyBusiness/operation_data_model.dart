import 'package:equatable/equatable.dart';

import '../../../domain/entities/business/operation_entity.dart';

class OperationDataModel extends Equatable {
  final int? id;
  final int? businessId;
  final String? day;
  final String? openTime;
  final String? closedTime;

  const OperationDataModel({
    this.id,
    this.businessId,
    this.day,
    this.openTime,
    this.closedTime,
  });

  factory OperationDataModel.fromJson(Map<String, dynamic> json) =>
      OperationDataModel(
        id: json["id"],
        businessId: json["business_id"],
        day: json["day"],
        openTime: json["open_time"],
        closedTime: json["closed_time"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "business_id": businessId,
    "day": day,
    "open_time": openTime,
    "closed_time": closedTime,
  };

  /// Converts this data model to a domain entity.
  OperationDataEntity toEntity() => OperationDataEntity(
    id: id,
    businessId: businessId,
    day: day,
    openTime: openTime,
    closedTime: closedTime,
  );

  @override
  List<Object?> get props => [id, businessId, day, openTime, closedTime];
}
