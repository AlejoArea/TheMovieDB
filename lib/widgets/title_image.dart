import 'package:flutter/material.dart';

class TitleImage extends StatelessWidget {
  const TitleImage({
    super.key,
    required this.posterPath,
  });

  final String posterPath;
  static const double imagePosterWidth = 600;
  static const double imagePosterHeigth = 240;
  static const double imageAlignment = -1.0;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      posterPath,
      width: imagePosterWidth,
      height: imagePosterHeigth,
      alignment: const Alignment(
        imageAlignment,
        imageAlignment,
      ),
    );
  }
}
