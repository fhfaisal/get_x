import 'package:equatable/equatable.dart';


import 'gallery_data.dart';
import 'oparation_data.dart';

class CommonBusiness extends Equatable {
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
  final List<BusinessTypeName>? businessTypeName;
  final String? businessCategoryName;
  final String? businessSubcategoryName;
  final List<BusinessCreedName>? businessCreedName;
  final List<String>? affiliationName;
  final CountryName? countryName;
  final StateName? stateName;
  final String? cityName;
  final double? averageRating;
  final int? ratingCount;
  final List<OperationData>? operationData;
  final List<GalleryData>? galleryData;

  const CommonBusiness({
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

  factory CommonBusiness.fromJson(Map<String, dynamic> json) => CommonBusiness(
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
        : List<BusinessTypeName>.from(json["business_type_name"]!
        .map((x) => businessTypeNameValues.map[x]!)),
    businessCategoryName: json["business_category_name"],
    businessSubcategoryName: json["business_subcategory_name"],
    businessCreedName: json["business_creed_name"] == null
        ? []
        : List<BusinessCreedName>.from(json["business_creed_name"]!
        .map((x) => businessCreedNameValues.map[x]!)),
    affiliationName: json["affiliation_name"] == null
        ? []
        : List<String>.from(json["affiliation_name"]!.map((x) => x)),
    countryName: countryNameValues.map[json["country_name"]]!,
    stateName: stateNameValues.map[json["state_name"]]!,
    cityName: json["city_name"],
    averageRating: json["average_rating"]?.toDouble(),
    ratingCount: json["rating_count"],
    operationData: json["operation_data"] == null
        ? []
        : List<OperationData>.from(
        json["operation_data"]!.map((x) => OperationData.fromJson(x))),
    galleryData: json["gallery_data"] == null
        ? []
        : List<GalleryData>.from(
        json["gallery_data"]!.map((x) => GalleryData.fromJson(x))),
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
    "business_type_name": businessTypeName == null
        ? []
        : List<dynamic>.from(businessTypeName!
        .map((x) => businessTypeNameValues.reverse[x])),
    "business_category_name": businessCategoryName,
    "business_subcategory_name": businessSubcategoryName,
    "business_creed_name": businessCreedName == null
        ? []
        : List<dynamic>.from(businessCreedName!
        .map((x) => businessCreedNameValues.reverse[x])),
    "affiliation_name": affiliationName == null
        ? []
        : List<dynamic>.from(affiliationName!.map((x) => x)),
    "country_name": countryNameValues.reverse[countryName],
    "state_name": stateNameValues.reverse[stateName],
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

  CommonBusiness copyWith({
    int? id,
    String? businessName,
    String? businessProfileImage,
    String? address,
    String? zipCode,
    String? lat,
    String? long,
    String? businessPhoneNumber,
    String? businessEmail,
    String? businessWebsite,
    double? distance,
    List<BusinessTypeName>? businessTypeName,
    String? businessCategoryName,
    String? businessSubcategoryName,
    List<BusinessCreedName>? businessCreedName,
    List<String>? affiliationName,
    CountryName? countryName,
    StateName? stateName,
    String? cityName,
    double? averageRating,
    int? ratingCount,
    List<OperationData>? operationData,
    List<GalleryData>? galleryData,
  }) =>
      CommonBusiness(
        id: id ?? this.id,
        businessName: businessName ?? this.businessName,
        businessProfileImage: businessProfileImage ?? this.businessProfileImage,
        address: address ?? this.address,
        zipCode: zipCode ?? this.zipCode,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        businessPhoneNumber: businessPhoneNumber ?? this.businessPhoneNumber,
        businessEmail: businessEmail ?? this.businessEmail,
        businessWebsite: businessWebsite ?? this.businessWebsite,
        distance: distance ?? this.distance,
        businessTypeName: businessTypeName ?? this.businessTypeName,
        businessCategoryName: businessCategoryName ?? this.businessCategoryName,
        businessSubcategoryName:
        businessSubcategoryName ?? this.businessSubcategoryName,
        businessCreedName: businessCreedName ?? this.businessCreedName,
        affiliationName: affiliationName ?? this.affiliationName,
        countryName: countryName ?? this.countryName,
        stateName: stateName ?? this.stateName,
        cityName: cityName ?? this.cityName,
        averageRating: averageRating ?? this.averageRating,
        ratingCount: ratingCount ?? this.ratingCount,
        operationData: operationData ?? this.operationData,
        galleryData: galleryData ?? this.galleryData,
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
enum BusinessCreedName {
  MUSLIM_OPERATED,
  MUSLIM_OWNED,
  SERVING_MUSLIM_COMMUNITY
}
enum BusinessTypeName {
  LOCAL_PHYSICAL_STORE,
  ONLINE_VIRTUAL_STORE,
  SERVICE_BUSINESS
}
enum CountryName {
  BANGLADESH,
  CANADA,
  MEXICO,
  UNITED_STATES
}

final countryNameValues = EnumValues({
  "Bangladesh": CountryName.BANGLADESH,
  "Canada": CountryName.CANADA,
  "Mexico": CountryName.MEXICO,
  "United States": CountryName.UNITED_STATES,
});




enum StateName {
  BAJA_CALIFORNIA,
  BRITISH_COLUMBIA,
  DHAKA_DIVISION,
  FLORIDA,
  NEW_YORK,
  ONTARIO
}

final stateNameValues = EnumValues({
  "Baja California": StateName.BAJA_CALIFORNIA,
  "British Columbia": StateName.BRITISH_COLUMBIA,
  "Dhaka Division": StateName.DHAKA_DIVISION,
  "Florida": StateName.FLORIDA,
  "New York": StateName.NEW_YORK,
  "Ontario": StateName.ONTARIO,
});


final businessCreedNameValues = EnumValues({
  "Muslim Operated": BusinessCreedName.MUSLIM_OPERATED,
  "Muslim Owned": BusinessCreedName.MUSLIM_OWNED,
  "Serving Muslim Community": BusinessCreedName.SERVING_MUSLIM_COMMUNITY,
});



final businessTypeNameValues = EnumValues({
  "Local (Physical) Store": BusinessTypeName.LOCAL_PHYSICAL_STORE,
  "Online (Virtual) Store": BusinessTypeName.ONLINE_VIRTUAL_STORE,
  "Service Business": BusinessTypeName.SERVICE_BUSINESS,
});

