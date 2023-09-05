import 'package:flutter/material.dart';

import '../constants.dart';
import '../custom_widgets.dart';
import '../models/movie.dart';
import '../repositories/genre_repository.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late int _counter = widget.movie.voteCount;
  static const double subHeaderPosition = 160.0;
  static const String originalTitle = 'Original title:';
  static const String overviewTitle = 'Overview';
  static const String genreTitle = "Genres";

  void incrementLikeCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.movie.backdropUrl);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Constants.titleApp,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Header(
                    backdropPath: widget.movie.backdropUrl,
                  ),
                  const SizedBox(
                    height: Constants.sizedBoxHeight,
                  ),
                  GeneralText(
                    generalText: '$originalTitle ${widget.movie.originalTitle}',
                  ),
                  Rate(
                    rate: widget.movie.voteAverage,
                  ),
                  GeneralText(
                    generalText: widget.movie.voteAverage.toString(),
                    fontSize: Constants.smallTextFont,
                  ),
                  const GeneralText(
                    generalText: genreTitle,
                    fontSize: Constants.subtitleTextFont,
                  ),
                  Genres(
                    genresId: widget.movie.genres,
                    repository: GenreRepository(),
                  ),
                  const GeneralText(
                    generalText: overviewTitle,
                    fontSize: Constants.subtitleTextFont,
                  ),
                  GeneralText(
                    generalText: widget.movie.overview,
                  ),
                ],
              ),
              Positioned(
                top: subHeaderPosition,
                child: SubHeader(
                  releaseDate: widget.movie.releaseDate,
                  title: widget.movie.title,
                  originalTitle: widget.movie.originalTitle,
                  posterPath: widget.movie.posterUrl,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementLikeCounter,
        backgroundColor: Colors.red,
        child: Stack(
          children: [
            const Center(
              child: Icon(
                Icons.favorite_rounded,
                size: Constants.favButtonSize,
              ),
            ),
            Center(
              child: Text(
                _counter.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
