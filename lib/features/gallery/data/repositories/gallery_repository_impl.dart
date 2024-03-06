import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:gallery/core/error/failures.dart';
import 'package:gallery/features/features.dart';
import 'package:oxidized/oxidized.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  const GalleryRepositoryImpl({
    required this.remote,
  });

  final GalleryRemoteDataSource remote;

  @override
  Result<Stream<List<Photo>>, Failure> getPhotos() {
    try {
      return Result.ok(remote.getPhotos());
    } on FirebaseException catch (e) {
      return Result.err(
        FirebaseFailure(
          e.message ?? '',
        ),
      );
    }
  }

  @override
  Future<Result<String, Failure>> uploadPhoto(File image) async {
    try {
      final url = await remote.uploadPhoto(image);
      return Result.ok(url);
    } on FirebaseException catch (e) {
      return Result.err(
        FirebaseFailure(
          e.message ?? '',
        ),
      );
    }
  }

  @override
  Future<Result<Unit, Failure>> savePhoto({
    required String name,
    required String url,
    required DateTime date,
  }) async {
    try {
      await remote.savePhoto(
        name: name,
        url: url,
        date: date,
      );
      return const Result.ok(unit);
    } on FirebaseException catch (e) {
      return Result.err(
        FirebaseFailure(
          e.message ?? '',
        ),
      );
    }
  }
}
