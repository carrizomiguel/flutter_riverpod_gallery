import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gallery/features/features.dart';

part 'gallery_state.dart';

class GalleryNotifier extends StateNotifier<GalleryState> {
  GalleryNotifier({
    required this.getPhotos,
    required this.uploadPhoto,
    required this.savePhoto,
  }) : super(const GalleryState()) {
    onGetPhotos();
  }

  final GetPhotos getPhotos;
  final UploadPhoto uploadPhoto;
  final SavePhoto savePhoto;

  late StreamSubscription<List<Photo>> subscription;

  void _emit(GalleryState s) => state = s;

  void onGetPhotos() {
    _emit(state.copyWith(galleryStatus: GalleryStatus.loading));
    final watcher = getPhotos.call();
    watcher.when(
      ok: (stream) {
        subscription = stream.listen(
          (photos) {
            _emit(
              state.copyWith(
                galleryStatus: GalleryStatus.success,
                photos: photos,
              ),
            );
          },
        );
      },
      err: (failure) => _emit(
        state.copyWith(
          galleryStatus: GalleryStatus.error,
        ),
      ),
    );
  }

  Future<void> onUploadPhoto({
    required File image,
    required DateTime date,
  }) async {
    _emit(state.copyWith(uploadStatus: UploadStatus.loading));
    final result = await uploadPhoto.call(image);
    result.when(
      ok: (url) => onSavePhoto(
        name: image.path.split('/').last,
        date: date,
        url: url,
      ),
      err: (failure) => _emit(
        state.copyWith(
          uploadStatus: UploadStatus.error,
        ),
      ),
    );
  }

  Future<void> onSavePhoto({
    required String name,
    required String url,
    required DateTime date,
  }) async {
    _emit(state.copyWith(uploadStatus: UploadStatus.loading));
    final result = await savePhoto.call(
      name: name,
      date: date,
      url: url,
    );
    result.when(
      ok: (url) => _emit(
        state.copyWith(
          uploadStatus: UploadStatus.success,
        ),
      ),
      err: (failure) => _emit(
        state.copyWith(
          uploadStatus: UploadStatus.error,
        ),
      ),
    );
  }
}
