import 'package:flutter/material.dart';
import 'package:themoviedb/constants.dart';
import 'package:themoviedb/custom_widgets.dart';
import 'package:themoviedb/models/movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.movie,
  });

  final Movie movie;


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  static const double subHeaderPosition = 160.0;
  static const String originalTitle = 'Original title:';
  static const String overviewTitle = 'Overview';
  static const String genreTitle = "Genres";
  @override
  Widget build(BuildContext context) {
    void incrementLikeCounter() {
      setState(() {
        _counter++;
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Constants.titleApp,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Header(
                      backdropPath: widget.movie.backdropPath,
                    ),
                    const SizedBox(
                      height: Constants.sizedBoxHeight,
                    ),
                    GeneralText(
                      generalText:
                          '${originalTitle} ${widget.movie.originalTitle.toString()}',
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
                      genres: widget.movie.genres,
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
                    posterPath: widget.movie.posterPath,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementLikeCounter,
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
