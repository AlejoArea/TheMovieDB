import 'package:flutter/material.dart';

class StarIcon extends StatelessWidget {
  const StarIcon({
    super.key,
    required this.icon,
    this.color = Colors.yellow,
    this.starSize = 45,
  });

  final IconData icon;
  final MaterialColor color;
  final double starSize;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Colors.yellow,
      size: starSize,
    );
  }
}
