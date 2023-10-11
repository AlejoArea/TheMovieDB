import 'package:flutter/material.dart';
import 'package:themoviedb/src/presentation/widget/cached_image.dart';

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
