import 'package:flutter/material.dart';
import 'package:gallery/features/features.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AppBody();
  }
}

class _AppBody extends StatelessWidget {
  const _AppBody();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Gallery',
      home: GalleryView(),
    );
  }
}
