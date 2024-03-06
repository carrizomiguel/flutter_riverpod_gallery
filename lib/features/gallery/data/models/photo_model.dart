import 'package:cloud_firestore/cloud_firestore.dart';

class PhotoModel {
  const PhotoModel({
    required this.id,
    required this.name,
    required this.date,
    required this.url,
  });

  factory PhotoModel.fromSnapshot(DocumentSnapshot snapshot) {
    return PhotoModel(
      id: snapshot.get('photoId') as String,
      name: snapshot.get('name') as String,
      date: DateTime.parse(
        snapshot.get('date') as String,
      ),
      url: snapshot.get('url') as String,
    );
  }

  final String id;
  final String name;
  final DateTime date;
  final String url;

  Map<String, dynamic> toDocument() {
    return {
      'photoId': id,
      'name': name,
      'date': date.toIso8601String(),
      'url': url,
    };
  }
}
