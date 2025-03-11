import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:get_x/app/domain/entities/business/nearby_business_list_entity.dart';
import 'common_business_model.dart';

NearbyBusinessListModel nearbyBusinessListFromJson(String str) =>
    NearbyBusinessListModel.fromJson(json.decode(str));

String nearbyBusinessListToJson(NearbyBusinessListModel data) =>
    json.encode(data.toJson());

class NearbyBusinessListModel extends Equatable {
  final String? status;
  final List<CommonBusinessModel>? data;

  const NearbyBusinessListModel({
    this.status,
    this.data,
  });

  factory NearbyBusinessListModel.fromJson(Map<String, dynamic> json) =>
      NearbyBusinessListModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<CommonBusinessModel>.from(
            json["data"]!.map((x) => CommonBusinessModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };

  NearbyBusinessListModel copyWith({
    String? status,
    List<CommonBusinessModel>? data,
  }) =>
      NearbyBusinessListModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  /// Converts this data model to its corresponding domain entity.
  NearbyBusinessListEntity toEntity() => NearbyBusinessListEntity(
    status: status,
    data: data!.map((business) => business.toEntity()).toList(),
  );

  @override
  List<Object?> get props => [status, data];
}
