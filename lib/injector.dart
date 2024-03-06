import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gallery/features/features.dart';
import 'package:get_it/get_it.dart';

class Get {
  static final it = GetIt.instance;

  static void init() {
    final store = FirebaseFirestore.instance;
    final storage = FirebaseStorage.instance;

    it.registerLazySingleton(() => store);
    it.registerLazySingleton(() => storage);

    it.registerLazySingleton(
      () => GalleryRemoteDataSourceImpl(
        storage: it.call<FirebaseStorage>(),
        store: it.call<FirebaseFirestore>(),
      ),
    );

    it.registerLazySingleton(
      () => GalleryRepositoryImpl(
        remote: it.call<GalleryRemoteDataSourceImpl>(),
      ),
    );

    it.registerLazySingleton(
      () => GetPhotos(
        repository: it.call<GalleryRepositoryImpl>(),
      ),
    );
    it.registerLazySingleton(
      () => SavePhoto(
        repository: it.call<GalleryRepositoryImpl>(),
      ),
    );
    it.registerLazySingleton(
      () => UploadPhoto(
        repository: it.call<GalleryRepositoryImpl>(),
      ),
    );
  }
}
