class Movie {
  final String title;
  final String originalTitle;
  final String releaseDate;
  final String overview;
  final double voteAverage;
  final List<String> genres;
  final String posterPath;
  final String backdropPath;

  const Movie(
      {required this.title,
      required this.originalTitle,
      required this.releaseDate,
      required this.overview,
      required this.voteAverage,
      required this.genres,
      required this.posterPath,
      required this.backdropPath});

  factory Movie.mockMovie() {
    return const Movie(
      title: 'The Super Mario Bros. Movie',
      originalTitle: 'The Super Mario Bros. Movie',
      releaseDate: '2023-04-05',
      overview: 'While working underground to fix a water main, '
          'Brooklyn plumbers—and brothers—Mario and Luigi are transported down '
          'a mysterious pipe and wander into a magical new world. But when the '
          'brothers are separated, Mario embarks on an epic quest to find Luigi.',
      voteAverage: 7.8,
      genres: ['Animation', 'Family', 'Adventure', 'Fantasy', 'Comedy'],
      posterPath: 'assets/images/mario_movie_poster.jpg',
      backdropPath: 'assets/images/mario_movie_backdrop.jpg',
    );
  }
}
