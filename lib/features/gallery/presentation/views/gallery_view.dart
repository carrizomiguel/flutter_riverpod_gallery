import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gallery/core/core.dart';
import 'package:gallery/features/features.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const _GalleryBody();
  }
}

class _GalleryBody extends ConsumerWidget {
  const _GalleryBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(galleryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          final status = state.galleryStatus;

          switch (status) {
            case GalleryStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case GalleryStatus.success:
              final photos = state.photos;

              return GalleryList(
                photos: photos,
              );
            case GalleryStatus.error:
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    final provider = ref.read(
                      galleryProvider.notifier,
                    );
                    provider.getPhotos();
                  },
                  child: const Text('Retry'),
                ),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(CameraView.route()),
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
