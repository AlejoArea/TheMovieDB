import 'package:flutter/material.dart';
import 'package:themoviedb/constants.dart';

class GeneralText extends StatelessWidget {
  const GeneralText({
    super.key,
    required this.generalText,
    this.fontSize = Constants.generalTextFont,
    this.fontWeight,
    this.color,
  });

  final String generalText;
  final FontWeight? fontWeight;
  final double fontSize;
  final MaterialColor? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      generalText,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
