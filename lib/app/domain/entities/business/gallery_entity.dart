import 'package:equatable/equatable.dart';

class GalleryEntity extends Equatable {
  final int? id;
  final int? businessId;
  final String? businessGalleryImage;

  const GalleryEntity({
    this.id,
    this.businessId,
    this.businessGalleryImage,
  });

  @override
  List<Object?> get props => [id, businessId, businessGalleryImage];
}
