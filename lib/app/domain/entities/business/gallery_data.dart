import 'package:equatable/equatable.dart';

class GalleryData extends Equatable {
  final int? id;
  final int? businessId;
  final String? businessGalleryImage;

  const GalleryData({
    this.id,
    this.businessId,
    this.businessGalleryImage,
  });

  factory GalleryData.fromJson(Map<String, dynamic> json) => GalleryData(
    id: json["id"],
    businessId: json["business_id"],
    businessGalleryImage: json["business_gallery_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "business_id": businessId,
    "business_gallery_image": businessGalleryImage,
  };

  GalleryData copyWith({
    int? id,
    int? businessId,
    String? businessGalleryImage,
  }) =>
      GalleryData(
        id: id ?? this.id,
        businessId: businessId ?? this.businessId,
        businessGalleryImage:
        businessGalleryImage ?? this.businessGalleryImage,
      );

  @override
  List<Object?> get props => [id, businessId, businessGalleryImage];
}