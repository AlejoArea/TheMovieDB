import 'package:flutter/material.dart';

import 'constants.dart';
import 'custom_widgets.dart';
import 'models/movie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Movie movie = Movie.mockMovie();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Constants.customBlueColor,
          background: Constants.customPurpleColor,
        ),
        scaffoldBackgroundColor: Constants.customBlueColor,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white70),
          bodyMedium: TextStyle(color: Colors.white70),
          bodySmall: TextStyle(color: Colors.white70),
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: Constants.appBarElevation,
        ),
      ),
      home: const HomePage(),
    );
  }
}
