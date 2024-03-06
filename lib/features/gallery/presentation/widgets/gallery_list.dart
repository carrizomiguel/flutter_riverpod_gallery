import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery/features/features.dart';

class GalleryList extends StatelessWidget {
  const GalleryList({
    required this.photos,
    super.key,
  });

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 110),
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      itemCount: photos.length,
      itemBuilder: (context, index) {
        final photo = photos[index];

        return CachedImage(
          url: photo.url,
          height: 120,
        );
      },
    );
  }
}
