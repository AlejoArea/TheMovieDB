import 'package:flutter/material.dart';
import 'package:themoviedb/src/core/util/widget_keys.dart';

import '../../core/util/ui_constants.dart';
import '../../domain/entity/movie.dart';
import '../bloc/i_bloc_genres.dart';
import '../custom_widgets.dart';
import '../widget/custom_app_bar.dart';
import '../widget/title_text.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({
    super.key,
    required this.movie,
    required this.blocGenres,
  });

  final Movie movie;
  final IBlocGenres blocGenres;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late int _counter = widget.movie.voteCount;
  static const double subHeaderPosition = 160.0;
  static const String originalTitle = 'Original title:';
  static const String overviewTitle = 'Overview';
  static const String genreTitle = "Genres";
  static const String genreTitleKey = 'genre title';
  static const double finalSizedHeight = 40.0;

  void incrementLikeCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Constants.popularMovieText),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Header(backdropPath: widget.movie.backdropUrl),
                  const SizedBox(height: Constants.sizedBoxHeight),
                  CustomTitleText(
                    titleText: '$originalTitle ${widget.movie.originalTitle}',
                    fontSize: Constants.movieTitleSize,
                  ),
                  Rate(rate: widget.movie.voteAverage),
                  GeneralText(
                    generalText: widget.movie.voteAverage.toString(),
                    fontSize: Constants.smallTextFont,
                  ),
                  const GeneralText(
                    key: Key(genreTitleKey),
                    generalText: genreTitle,
                    fontSize: Constants.subtitleTextFont,
                  ),
                  Genres(
                    genresId: widget.movie.genres,
                    blocGenres: widget.blocGenres,
                  ),
                  const GeneralText(
                    generalText: overviewTitle,
                    fontSize: Constants.subtitleTextFont,
                  ),
                  GeneralText(generalText: widget.movie.overview),
                  const SizedBox(height: finalSizedHeight),
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
        key: const Key(ConstantsKeys.floatingActionButtonKey),
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
