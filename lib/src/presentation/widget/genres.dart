import 'package:flutter/material.dart';

import '../custom_widgets.dart';
import '../../core/util/ui_constants.dart';
import '../../data/repository/genre_repository.dart';
import '../../domain/entity/genre.dart';

class Genres extends StatefulWidget {
  const Genres({
    super.key,
    required this.genresId,
    required this.repository,
  });

  final List<int> genresId;
  static const double genrePaddingHeight = 70.0;
  static const double genrePaddingWidth = 120.0;
  static const double genresContainerHeight = 50.0;
  final GenreRepository repository;

  @override
  State<Genres> createState() => _GenresState();
}

class _GenresState extends State<Genres> {
  late Future<List<Genre>> _allGenres;
  late List<Genre> movieGenres;

  @override
  void initState() {
    super.initState();
    _allGenres = widget.repository.getData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _allGenres,
      builder: (
        context,
        snapshot,
      ) {
        if (snapshot.hasData) {
          List<Genre> snapshotList = snapshot.data ?? [];
          movieGenres = widget.repository.getGenresFromId(
            widget.genresId,
            snapshotList,
          );
          return Container(
            height: Genres.genresContainerHeight,
            alignment: Alignment.center,
            child: ListView.builder(
              itemCount: widget.genresId.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return Padding(
                  padding: const EdgeInsets.all(
                    Constants.generalPadding,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      border: Border.all(
                        color: Colors.blueGrey,
                        width: Constants.boxDecorationWidth,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          Constants.borderRadius,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.all(
                      Constants.generalPadding,
                    ),
                    height: Genres.genrePaddingHeight,
                    width: Genres.genrePaddingWidth,
                    child: Center(
                      child: GeneralText(
                        generalText: movieGenres[index].genre,
                        fontSize: Constants.smallTextFont,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
