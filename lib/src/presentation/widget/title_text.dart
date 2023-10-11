import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';

class CustomTitleText extends StatelessWidget {
  const CustomTitleText({
    super.key,
    required this.titleText,
    this.fontSize = Constants.titleTextFont,
    this.fontWeight,
    this.color,
  });

  final FontWeight? fontWeight;
  final double fontSize;
  final Color? color;
  final String titleText;
  static const int maxLines = 3;

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
