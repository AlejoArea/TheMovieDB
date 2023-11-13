class MovieModel {
  final String title;
  final String originalTitle;
  final String originalLanguage;
  final int id;
  final bool adult;
  final String releaseDate;
  final String overview;
  final double voteAverage;
  final List<int> genres;
  final String posterPath;
  final String backdropPath;
  final double popularity;
  final bool video;
  final int voteCount;
  final bool favorite;
  List<String> categories;

  MovieModel({
    required this.title,
    required this.originalTitle,
    required this.originalLanguage,
    required this.id,
    required this.adult,
    required this.releaseDate,
    required this.overview,
    required this.voteAverage,
    required this.genres,
    required this.posterPath,
    required this.backdropPath,
    required this.popularity,
    required this.video,
    required this.voteCount,
    required this.categories,
    required this.favorite,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'] ?? '',
      originalTitle: json['original_title'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      id: json['id'] as int,
      adult: json['adult'] as bool,
      releaseDate: json['release_date'] ?? '',
      overview: json['overview'] as String,
      voteAverage: json['vote_average'].toDouble(),
      genres: List<int>.from(json['genre_ids']),
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      popularity: json['popularity'].toDouble() ?? 0.0,
      video: json['video'] as bool,
      voteCount: json['vote_count'] as int,
      categories: [],
      favorite: false,
    );
  }

  static List<MovieModel> movieList(List<dynamic> data) {
    return data.map((movie) => MovieModel.fromJson(movie)).toList();
  }
}
