import 'dart:convert';

import 'package:flutter/services.dart';

import '../../domain/entity/genre.dart';
import '../../domain/repository/i_repository.dart';

class GenreRepository implements IRepository {
  static const String jsonPath = 'assets/data/genres.json';

  @override
  Future<List<Genre>> getData() async {
    final String response = await rootBundle.loadString(jsonPath);
    List<dynamic> jsonData = List.from(jsonDecode(response)['genres']);
    return jsonData
        .map(
          (genre) => Genre.fromJson(genre),
        )
        .toList();
  }

  List<Genre> getGenresFromId(List<int> ids, List<Genre> genres) {
    return ids.map((id) => genres.firstWhere((g) => g.id == id)).toList();
  }
}
