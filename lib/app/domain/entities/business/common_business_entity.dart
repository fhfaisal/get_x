import 'package:equatable/equatable.dart';

import 'gallery_entity.dart';
import 'operation_entity.dart';

class CommonBusinessEntity extends Equatable {
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
  final List<OperationDataEntity>? operationData;
  final List<GalleryEntity>? galleryData;

  const CommonBusinessEntity({
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
