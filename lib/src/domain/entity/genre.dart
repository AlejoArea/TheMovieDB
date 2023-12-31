import 'package:floor/floor.dart';

@entity
class Genre {
  @primaryKey
  final int id;
  final String genre;

  Genre({
    required this.id,
    required this.genre,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      genre: json['name'],
    );
  }
}
