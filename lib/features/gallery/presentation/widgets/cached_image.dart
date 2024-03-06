import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    required this.url,
    required this.height,
    this.width = double.infinity,
    super.key,
  });

  final String url;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 4),
                blurRadius: 32,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image(
              fit: BoxFit.cover,
              image: imageProvider,
            ),
          ),
        );
      },
      placeholder: (context, url) {
        return SizedBox(
          width: width,
          height: height,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.grey.shade300.withOpacity(.8),
            child: Container(
              width: double.infinity,
              height: height,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: const Center(
            child: Icon(
              Icons.error,
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
