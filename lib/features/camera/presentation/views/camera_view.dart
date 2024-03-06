import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:gallery/core/core.dart';
import 'package:gallery/features/features.dart';
import 'package:path_provider/path_provider.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const CameraView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const _CameraBody();
  }
}

class _CameraBody extends StatelessWidget {
  const _CameraBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraAwesomeBuilder.awesome(
        saveConfig: SaveConfig.photo(
          pathBuilder: () async {
            final tempDir = await getTemporaryDirectory();
            final photosDir = await Directory(
              '${tempDir.path}/photos',
            ).create(recursive: true);
            final today = DateTime.now().millisecondsSinceEpoch;
            return '${photosDir.path}/IMG$today.jpg';
          },
        ),
        onMediaTap: (media) => context.push(
          PhotoView.route(media.filePath),
        ),
      ),
    );
  }
}
