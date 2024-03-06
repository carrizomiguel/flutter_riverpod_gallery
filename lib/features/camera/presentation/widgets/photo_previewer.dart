import 'dart:io';

import 'package:flutter/material.dart';

class PhotoPreviewer extends StatelessWidget {
  const PhotoPreviewer({
    required this.path,
    super.key,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: InteractiveViewer(
        minScale: 1,
        maxScale: 5,
        child: Image(
          image: FileImage(File(path)),
          frameBuilder: (
            context,
            child,
            frame,
            wasSynchronouslyLoaded,
          ) {
            if (wasSynchronouslyLoaded) {
              return child;
            }
            return AnimatedOpacity(
              opacity: frame == null ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
