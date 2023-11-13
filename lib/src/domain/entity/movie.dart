import 'package:floor/floor.dart';

@entity
class Movie {
  final String title;
  final String originalTitle;
  final String originalLanguage;
  @primaryKey
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

  String get posterUrl => 'https://image.tmdb.org/t/p/w500$posterPath';

  String get backdropUrl => 'https://image.tmdb.org/t/p/w500$backdropPath';

  set setFavorite(bool value) => favorite;


  Movie({
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
    required this.favorite,
    required this.categories,
  });

  factory Movie.mockMovie() {
    return Movie(
      title: 'The Super Mario Bros. Movie',
      originalTitle: 'The Super Mario Bros. Movie',
      originalLanguage: 'en',
      id: 1,
      adult: false,
      releaseDate: '2023-04-05',
      overview: 'While working underground to fix a water main, '
          'Brooklyn plumbers—and brothers—Mario and Luigi are transported down '
          'a mysterious pipe and wander into a magical new world. But when the '
          'brothers are separated, Mario embarks on an epic quest to find Luigi.',
      voteAverage: 7.8,
      genres: [16, 35, 12, 10751, 14],
      posterPath: 'assets/images/mario_movie_poster.jpg',
      backdropPath: 'assets/images/mario_movie_backdrop.jpg',
      popularity: 200.7,
      video: false,
      voteCount: 400,
      categories: [],
      favorite: false,
    );
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      originalTitle: json['original_title'],
      originalLanguage: json['original_language'],
      id: json['id'] as int,
      adult: json['adult'] as bool,
      releaseDate: json['release_date'],
      overview: json['overview'] as String,
      voteAverage: json['vote_average'].toDouble(),
      genres: List<int>.from(json['genre_ids']),
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      popularity: json['popularity'].toDouble(),
      video: json['video'] as bool,
      voteCount: json['vote_count'] as int,
      categories: [],
      favorite: false,
    );
  }
}
