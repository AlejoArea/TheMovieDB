import 'package:flutter/material.dart';

import '../custom_widgets.dart';

class CustomButtonHomepage extends StatelessWidget {
  const CustomButtonHomepage({
    super.key,
    required this.navigationRoute,
    required this.buttonText,
  });

  final String navigationRoute;
  final String buttonText;
  static const double fontSize = 30;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          navigationRoute,
        );
      },
      child: GeneralText(
        generalText: buttonText,
        fontSize: fontSize,
      ),
    );
  }
}
