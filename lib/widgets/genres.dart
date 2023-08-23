import 'package:flutter/material.dart';
import 'package:themoviedb/constants.dart';
import 'package:themoviedb/custom_widgets.dart';

class Genres extends StatelessWidget {
  const Genres({
    super.key,
    required this.genres,
  });

  final List<String> genres;
  static const double genrePaddingHeight = 50.0;
  static const double genrePaddingWidth = 100.0;
  static const double genresContainerHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: genresContainerHeight,
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: genres.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(Constants.generalPadding),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                border: Border.all(
                  color: Colors.blueGrey,
                  width: Constants.boxDecorationWidth,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(Constants.borderRadius),
                ),
              ),
              padding: const EdgeInsets.all(Constants.generalPadding),
              height: genrePaddingHeight,
              width: genrePaddingWidth,
              child: Center(
                child: GeneralText(
                  generalText: genres[index],
                  fontSize: Constants.smallTextFont,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
