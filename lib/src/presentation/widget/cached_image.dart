import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageCustom extends StatelessWidget {
  const CachedImageCustom({
    super.key,
    required this.url,
  });

  final String url;
  static const localImage = 'assets/images/generic_error_shot.png';

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: url,
        errorWidget: (
          BuildContext context,
          String value,
          Object error,
        ) {
          return Image.asset(localImage);
        },
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
