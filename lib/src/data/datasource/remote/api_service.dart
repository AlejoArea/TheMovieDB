import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../model/genre_page_model.dart';
import '../../model/movie_page_model.dart';

class APIService {
  static const String apiKey = 'api_key=5146d420bf5332f854683baae4a58078';
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String failedToLoad = 'Failed to load the data';

  Future<MoviePageModel> getMovies(String urlEndpoint) async {
    final response = await http.get(
      Uri.parse('$baseUrl$urlEndpoint?$apiKey'),
    );
    if (response.statusCode == HttpStatus.ok) {
      return MoviePageModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(failedToLoad);
    }
  }

  Future<GenrePageModel> getGenres(String urlEndpoint) async {
    final response = await http.get(
      Uri.parse('$baseUrl$urlEndpoint?$apiKey'),
    );
    if (response.statusCode == HttpStatus.ok) {
      return GenrePageModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(failedToLoad);
    }
  }
}
