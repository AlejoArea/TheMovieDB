import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  static const double iconSize = 30;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pop(context);
      },
      backgroundColor: Colors.redAccent,
      child: const Icon(
        Icons.arrow_back,
        size: iconSize,
        color: Colors.white,
      ),
    );
  }
}
