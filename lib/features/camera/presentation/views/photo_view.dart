import 'package:flutter/material.dart';
import 'package:gallery/features/features.dart';

class PhotoView extends StatelessWidget {
  const PhotoView({
    required this.path,
    super.key,
  });

  final String path;

  static Route<void> route(String path) {
    return MaterialPageRoute<void>(
      builder: (_) => PhotoView(
        path: path,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _PhotoBody(path: path);
  }
}

class _PhotoBody extends StatelessWidget {
  const _PhotoBody({
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Preview(
        path: path,
      ),
    );
  }
}
