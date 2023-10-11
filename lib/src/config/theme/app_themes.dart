import 'package:flutter/material.dart';
import '../../core/util/constants_text_styles.dart';
import '../../core/util/custom_colors_constants.dart';

import '../../core/util/ui_constants.dart';

class CustomTheme {
  static final ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorConstants.customBlueColor,
      background: ColorConstants.customPurpleColor,
    ),
    scaffoldBackgroundColor: ColorConstants.customBlueColor,
    textTheme: const TextTheme(
      bodyLarge: ConstantTextStyles.style,
      bodyMedium: ConstantTextStyles.style,
      bodySmall: ConstantTextStyles.style,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      elevation: Constants.appBarElevation,
    ),
  );
}
