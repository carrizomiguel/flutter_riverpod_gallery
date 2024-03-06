import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gallery/features/features.dart';

abstract class GalleryRemoteDataSource {
  Stream<List<Photo>> getPhotos();
  Future<String> uploadPhoto(File image);
  Future<void> savePhoto({
    required String name,
    required String url,
    required DateTime date,
  });
}

class GalleryRemoteDataSourceImpl implements GalleryRemoteDataSource {
  GalleryRemoteDataSourceImpl({
    required this.storage,
    required this.store,
  });

  final FirebaseStorage storage;
  final FirebaseFirestore store;

  @override
  Stream<List<Photo>> getPhotos() {
    final collection = store.collection('photos');
    final snapshots = collection.orderBy('date', descending: true).snapshots();
    final stream = snapshots.map(
      (snapshots) => snapshots.docs.map(
        (e) => PhotoModel.fromSnapshot(e),
      ),
    );
    return stream.map(
      (list) {
        final mapped = list.map(
          (e) => Photo(
            id: e.id,
            url: e.url,
            name: e.name,
            date: e.date,
          ),
        );
        return mapped.toList();
      },
    );
  }

  @override
  Future<String> uploadPhoto(File image) async {
    final ref = storage.ref();
    final images = ref.child("images");
    final name = image.path.split('/').last;
    final photo = images.child(name);
    await photo.putFile(image);
    return await photo.getDownloadURL();
  }

  @override
  Future<void> savePhoto({
    required String name,
    required String url,
    required DateTime date,
  }) async {
    final collection = store.collection('photos');
    final photoId = collection.doc().id;
    final model = PhotoModel(
      id: photoId,
      name: name,
      date: date,
      url: url,
    );
    final doc = collection.doc(photoId);
    await doc.set(model.toDocument());
  }
}
