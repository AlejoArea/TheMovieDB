import 'package:flutter/material.dart';
import 'package:themoviedb/models/movie.dart';

import 'constants.dart';
import 'custom_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Movie movie = Movie.mockMovie();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
          secondary: Colors.red,
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.deepPurple,
          elevation: Constants.appBarElevation,
        ),
        scaffoldBackgroundColor: Colors.black26,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.grey),
        ),
      ),
      home: HomePage(movie: movie),
    );
  }
}
