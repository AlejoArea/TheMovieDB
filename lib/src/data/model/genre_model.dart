class GenreModel {
  final int id;
  final String genre;

  GenreModel({
    required this.id,
    required this.genre,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      genre: json['name'],
    );
  }

  static List<GenreModel> genreList(List<dynamic> data) {
    return data.map((genre) => GenreModel.fromJson(genre)).toList();
  }
}
