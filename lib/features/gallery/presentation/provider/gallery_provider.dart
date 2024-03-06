import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gallery/features/features.dart';
import 'package:gallery/injector.dart';

final galleryProvider = StateNotifierProvider<GalleryNotifier, GalleryState>(
  (ref) => GalleryNotifier(
    getPhotos: Get.it<GetPhotos>(),
    uploadPhoto: Get.it<UploadPhoto>(),
    savePhoto: Get.it<SavePhoto>(),
  ),
);
