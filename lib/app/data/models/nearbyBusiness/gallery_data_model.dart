import 'package:equatable/equatable.dart';
import '../../../domain/entities/business/gallery_entity.dart';

class GalleryDataModel extends Equatable {
  final int? id;
  final int? businessId;
  final String? businessGalleryImage;

  const GalleryDataModel({
    this.id,
    this.businessId,
    this.businessGalleryImage,
  });

  factory GalleryDataModel.fromJson(Map<String, dynamic> json) =>
      GalleryDataModel(
        id: json["id"],
        businessId: json["business_id"],
        businessGalleryImage: json["business_gallery_image"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "business_id": businessId,
    "business_gallery_image": businessGalleryImage,
  };

  /// Converts this data model to a domain entity.
  GalleryEntity toEntity() => GalleryEntity(
    id: id,
    businessId: businessId,
    businessGalleryImage: businessGalleryImage,
  );

  @override
  List<Object?> get props => [id, businessId, businessGalleryImage];
}
