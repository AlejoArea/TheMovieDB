import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';
import 'special_text.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.movieTitle,
  });

  final String movieTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: Constants.generalPadding),
      child: Center(
        child: GeneralText(
          generalText: movieTitle,
          fontSize: Constants.movieTitleSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
