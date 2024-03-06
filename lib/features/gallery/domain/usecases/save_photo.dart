import 'package:gallery/core/core.dart';
import 'package:gallery/features/features.dart';
import 'package:oxidized/oxidized.dart';

class SavePhoto {
  const SavePhoto({
    required this.repository,
  });

  final GalleryRepository repository;

  Future<Result<Unit, Failure>> call({
    required String name,
    required String url,
    required DateTime date,
  }) {
    return repository.savePhoto(
      name: name,
      url: url,
      date: date,
    );
  }
}
