import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageCustom extends StatelessWidget {
  const CachedImageCustom({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: url,
        progressIndicatorBuilder: (
          BuildContext context,
          String url,
          DownloadProgress progress,
        ) {
          return Center(
            child: CircularProgressIndicator(
              value: progress.progress,
              color: Colors.blue,
            ),
          );
        });
  }
}
