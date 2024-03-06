import 'dart:io';

import 'package:gallery/core/core.dart';
import 'package:gallery/features/features.dart';
import 'package:oxidized/oxidized.dart';

abstract class GalleryRepository {
  Result<Stream<List<Photo>>, Failure> getPhotos();
  Future<Result<String, Failure>> uploadPhoto(File image);
  Future<Result<Unit, Failure>> savePhoto({
    required String name,
    required String url,
    required DateTime date,
  });
}
