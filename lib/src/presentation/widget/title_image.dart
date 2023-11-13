import 'package:flutter/material.dart';
import 'cached_image.dart';

class TitleImage extends StatelessWidget {
  const TitleImage({
    super.key,
    required this.posterPath,
  });

  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return CachedImageCustom(url: posterPath);
  }
}
