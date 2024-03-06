import 'package:gallery/core/core.dart';
import 'package:gallery/features/features.dart';
import 'package:oxidized/oxidized.dart';

class GetPhotos {
  const GetPhotos({
    required this.repository,
  });

  final GalleryRepository repository;

  Result<Stream<List<Photo>>, Failure> call() {
    return repository.getPhotos();
  }
}
