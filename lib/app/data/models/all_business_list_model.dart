import 'dart:convert';
import 'package:equatable/equatable.dart';

import '../../domain/entities/business/common_business_data.dart';

AllBusinessListDataModel allBusinessListDataModelFromJson(String str) =>
    AllBusinessListDataModel.fromJson(json.decode(str));

String allBusinessListDataModelToJson(AllBusinessListDataModel data) =>
    json.encode(data.toJson());

class AllBusinessListDataModel extends Equatable {
  final String? status;
  final List<CommonBusiness>? data;

  const AllBusinessListDataModel({
    this.status,
    this.data,
  });

  factory AllBusinessListDataModel.fromJson(Map<String, dynamic> json) =>
      AllBusinessListDataModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<CommonBusiness>.from(json["data"]!.map((x) => CommonBusiness.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };

  AllBusinessListDataModel copyWith({
    String? status,
    List<CommonBusiness>? data,
  }) =>
      AllBusinessListDataModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  @override
  List<Object?> get props => [status, data];
}


// Enums and their mapping classes





