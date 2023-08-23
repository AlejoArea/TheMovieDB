import 'package:flutter/material.dart';
import 'package:themoviedb/constants.dart';
import 'package:themoviedb/custom_widgets.dart';

class SubHeader extends StatelessWidget {
  const SubHeader({
    super.key,
    required this.releaseDate,
    required this.title,
    required this.originalTitle,
    required this.posterPath,
  });

  final String releaseDate;
  final String title;
  final String originalTitle;
  final String posterPath;
  static const String releaseDateText = 'Release date:';
  static const double subHeaderPadding = 30.0;

  @override
  Widget build(BuildContext context) {
    String date = releaseDate;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(subHeaderPadding),
      child: Row(
        children: [
          Expanded(
            flex: Constants.flexConst,
            child: _TitleImage(
              posterPath: posterPath,
            ),
          ),
          Expanded(
            flex: Constants.flexConst,
            child: Column(
              children: [
                _Title(
                  movieTitle: title,
                ),
                GeneralText(
                    generalText: '$releaseDateText $date',
                    fontSize: Constants.smallTextFont),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    super.key,
    required this.movieTitle,
  });

  final String movieTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: Constants.generalPadding),
      child: Center(
        child: GeneralText(
          generalText: movieTitle,
          fontSize: Constants.movieTitleSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _TitleImage extends StatelessWidget {
  const _TitleImage({
    super.key,
    required this.posterPath,
  });

  final String posterPath;
  static const double imagePosterWidth = 600;
  static const double imagePosterHeigth = 240;
  static const double imageAlignment = -1.0;


  @override
  Widget build(BuildContext context) {
    return Image.asset(
      posterPath,
      width: imagePosterWidth,
      height: imagePosterHeigth,
      alignment: const Alignment(
        imageAlignment,
        imageAlignment,
      ),
    );
  }
}
