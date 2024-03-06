part of 'gallery_notifier.dart';

enum GalleryStatus {
    loading,
  success,
  error,
}

enum UploadStatus {
  initial,
  loading,
  success,
  error,
}

class GalleryState extends Equatable {
  const GalleryState({
    this.galleryStatus = GalleryStatus.loading,
    this.uploadStatus = UploadStatus.initial,
    this.photos = const [],
  });

  final GalleryStatus galleryStatus;
  final UploadStatus uploadStatus;
  final List<Photo> photos;

  GalleryState copyWith({
    GalleryStatus? galleryStatus,
    UploadStatus? uploadStatus,
    List<Photo>? photos,
  }) {
    return GalleryState(
      galleryStatus: galleryStatus ?? this.galleryStatus,
      uploadStatus: uploadStatus ?? this.uploadStatus,
      photos: photos ?? this.photos,
    );
  }

  @override
  List<Object?> get props => [
        galleryStatus,
        uploadStatus,
        photos,
      ];
}
