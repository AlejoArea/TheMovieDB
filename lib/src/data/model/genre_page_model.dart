import 'genre_model.dart';

class GenrePageModel {
  final List<GenreModel> results;

  GenrePageModel({
    required this.results,
  });

  factory GenrePageModel.fromJson(Map<String, dynamic> json) {
    return GenrePageModel(
        results: GenreModel.genreList(List.from(json['genres'])));
  }
}
