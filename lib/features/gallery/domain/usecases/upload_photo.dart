import 'dart:io';

import 'package:gallery/core/core.dart';
import 'package:gallery/features/features.dart';
import 'package:oxidized/oxidized.dart';

class UploadPhoto {
  const UploadPhoto({
    required this.repository,
  });

  final GalleryRepository repository;

  Future<Result<String, Failure>> call(File image) {
    return repository.uploadPhoto(image);
  }
}
