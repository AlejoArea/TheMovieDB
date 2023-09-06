import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';
import 'star_icon.dart';

class Rate extends StatelessWidget {
  const Rate({
    super.key,
    required this.rate,
  });

  final double rate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constants.generalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < 5; i++) createStar(rate, i),
        ],
      ),
    );
  }
}

createStar(double rate, int i) {
  double stars = rate / 2;
  if (i < stars.floor()) {
    return const StarIcon(
      icon: Icons.star,
    );
  } else if (i >= stars.floor() - 1) {
    if (stars > i) {
      return const StarIcon(
        icon: Icons.star_half,
      );
    } else {
      return const StarIcon(
        icon: Icons.star_border,
      );
    }
  }
}
