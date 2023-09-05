import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.backdropPath,
  });

  final String backdropPath;
  static const double posterRadius = 20.0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        posterRadius,
      ),
      child: Image.network(
        backdropPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
