import 'dart:convert';

import 'package:flutter/services.dart';

import '../../domain/entity/movie.dart';
import '../../domain/repository/i_repository.dart';

class MovieRepository implements IRepository {
  static const String jsonPath = 'assets/data/movies.json';

  @override
  Future<List<Movie>> getData() async {
    final String response = await rootBundle.loadString(jsonPath);
    List<dynamic> jsonData = List.from(json.decode(response));
    return jsonData
        .map(
          (movie) => Movie.fromJson(movie),
        )
        .toList();
  }
}
