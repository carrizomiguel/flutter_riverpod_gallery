import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gallery/core/core.dart';
import 'package:gallery/features/features.dart';

class SaveModal extends ConsumerWidget {
  const SaveModal({
    required this.path,
    super.key,
  });

  final String path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(galleryProvider);

    ref.listen(
      galleryProvider,
      (previous, next) {
        final status = next.uploadStatus;
        final isSuccess = status == UploadStatus.success;
        if (isSuccess) context.pop();
      },
    );

    final image = File(path);
    final now = DateTime.now();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 40,
      ),
      child: Row(
        children: [
          Container(
            width: context.width(.3),
            height: context.height(.2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 4),
                  blurRadius: 16,
                ),
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: FileImage(
                  image,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                path.split('/').last,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 5),
              Text(now.descriptive()),
              const SizedBox(height: 5),
              _Buttons(
                status: state.uploadStatus,
                onOkay: () {
                  final provider = ref.read(
                    galleryProvider.notifier,
                  );
                  provider.onUploadPhoto(
                    image: image,
                    date: now,
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    required this.status,
    required this.onOkay,
  });

  final UploadStatus status;
  final VoidCallback onOkay;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final isLoading = status == UploadStatus.loading;

      return Row(
        children: [
          ElevatedButton(
            onPressed: isLoading ? null : () => context.pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              disabledBackgroundColor: Colors.white,
              foregroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: isLoading ? Colors.grey : Colors.red,
                ),
              ),
            ),
            child: const Text('Cancel'),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: isLoading ? null : () => onOkay.call(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              children: [
                if (isLoading) ...[
                  const SizedBox(
                    width: 10,
                    height: 10,
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 5),
                ],
                const Text('Save'),
              ],
            ),
          ),
        ],
      );
    });
  }
}
