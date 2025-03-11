import 'package:equatable/equatable.dart';

import '../../../domain/entities/business/common_business_entity.dart';
import 'gallery_data_model.dart';
import 'operation_data_model.dart';
class CommonBusinessModel extends Equatable {
  final int? id;
  final String? businessName;
  final String? businessProfileImage;
  final String? address;
  final String? zipCode;
  final String? lat;
  final String? long;
  final String? businessPhoneNumber;
  final String? businessEmail;
  final String? businessWebsite;
  final double? distance;
  final List<String>? businessTypeName;
  final String? businessCategoryName;
  final String? businessSubcategoryName;
  final List<String>? businessCreedName;
  final List<String>? affiliationName;
  final String? countryName;
  final String? stateName;
  final String? cityName;
  final double? averageRating;
  final int? ratingCount;
  final List<OperationDataModel>? operationData;
  final List<GalleryDataModel>? galleryData;

  const CommonBusinessModel({
    this.id,
    this.businessName,
    this.businessProfileImage,
    this.address,
    this.zipCode,
    this.lat,
    this.long,
    this.businessPhoneNumber,
    this.businessEmail,
    this.businessWebsite,
    this.distance,
    this.businessTypeName,
    this.businessCategoryName,
    this.businessSubcategoryName,
    this.businessCreedName,
    this.affiliationName,
    this.countryName,
    this.stateName,
    this.cityName,
    this.averageRating,
    this.ratingCount,
    this.operationData,
    this.galleryData,
  });

  factory CommonBusinessModel.fromJson(Map<String, dynamic> json) =>
      CommonBusinessModel(
        id: json["id"],
        businessName: json["business_name"],
        businessProfileImage: json["business_profile_image"],
        address: json["address"],
        zipCode: json["zip_code"],
        lat: json["lat"],
        long: json["long"],
        businessPhoneNumber: json["business_phone_number"],
        businessEmail: json["business_email"],
        businessWebsite: json["business_website"],
        distance: json["distance"]?.toDouble(),
        businessTypeName: json["business_type_name"] == null
            ? []
            : List<String>.from(json["business_type_name"].map((x) => x)),
        businessCategoryName: json["business_category_name"],
        businessSubcategoryName: json["business_subcategory_name"],
        businessCreedName: json["business_creed_name"] == null
            ? []
            : List<String>.from(json["business_creed_name"].map((x) => x)),
        affiliationName: json["affiliation_name"] == null
            ? []
            : List<String>.from(json["affiliation_name"].map((x) => x)),
        countryName: json["country_name"],
        stateName: json["state_name"],
        cityName: json["city_name"],
        averageRating: json["average_rating"]?.toDouble(),
        ratingCount: json["rating_count"],
        operationData: json["operation_data"] == null
            ? []
            : List<OperationDataModel>.from(
            json["operation_data"].map((x) => OperationDataModel.fromJson(x))),
        galleryData: json["gallery_data"] == null
            ? []
            : List<GalleryDataModel>.from(
            json["gallery_data"].map((x) => GalleryDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "business_name": businessName,
    "business_profile_image": businessProfileImage,
    "address": address,
    "zip_code": zipCode,
    "lat": lat,
    "long": long,
    "business_phone_number": businessPhoneNumber,
    "business_email": businessEmail,
    "business_website": businessWebsite,
    "distance": distance,
    "business_type_name": businessTypeName,
    "business_category_name": businessCategoryName,
    "business_subcategory_name": businessSubcategoryName,
    "business_creed_name": businessCreedName,
    "affiliation_name": affiliationName,
    "country_name": countryName,
    "state_name": stateName,
    "city_name": cityName,
    "average_rating": averageRating,
    "rating_count": ratingCount,
    "operation_data": operationData == null
        ? []
        : List<dynamic>.from(operationData!.map((x) => x.toJson())),
    "gallery_data": galleryData == null
        ? []
        : List<dynamic>.from(galleryData!.map((x) => x.toJson())),
  };

  /// Converts this data model to its corresponding domain entity.
  CommonBusinessEntity toEntity() => CommonBusinessEntity(
    id: id,
    businessName: businessName,
    businessProfileImage: businessProfileImage,
    address: address,
    zipCode: zipCode,
    lat: lat,
    long: long,
    businessPhoneNumber: businessPhoneNumber,
    businessEmail: businessEmail,
    businessWebsite: businessWebsite,
    distance: distance,
    businessTypeName: businessTypeName,
    businessCategoryName: businessCategoryName,
    businessSubcategoryName: businessSubcategoryName,
    businessCreedName: businessCreedName,
    affiliationName: affiliationName,
    countryName: countryName,
    stateName: stateName,
    cityName: cityName,
    averageRating: averageRating,
    ratingCount: ratingCount,
    operationData:
    operationData?.map((e) => e.toEntity()).toList(),
    galleryData:
    galleryData?.map((e) => e.toEntity()).toList(),
  );

  @override
  List<Object?> get props => [
    id,
    businessName,
    businessProfileImage,
    address,
    zipCode,
    lat,
    long,
    businessPhoneNumber,
    businessEmail,
    businessWebsite,
    distance,
    businessTypeName,
    businessCategoryName,
    businessSubcategoryName,
    businessCreedName,
    affiliationName,
    countryName,
    stateName,
    cityName,
    averageRating,
    ratingCount,
    operationData,
    galleryData,
  ];
}
