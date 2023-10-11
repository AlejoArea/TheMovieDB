import 'package:flutter/material.dart';
import 'package:themoviedb/src/core/state/state.dart';
import 'package:themoviedb/src/presentation/bloc/i_bloc_genres.dart';

import '../../core/util/genre_by_id_list.dart';
import '../../core/util/ui_constants.dart';
import '../../domain/entity/genre.dart';
import '../custom_widgets.dart';

class Genres extends StatefulWidget {
  const Genres({
    super.key,
    required this.genresId,
    required this.blocGenres,
  });

  final List<int> genresId;
  final IBlocGenres blocGenres;

  @override
  State<Genres> createState() => _GenresState();
}

class _GenresState extends State<Genres> {
  static const double genrePaddingHeight = 70.0;
  static const double genrePaddingWidth = 120.0;
  static const double genresContainerHeight = 50.0;
  static const String genreKey = 'genre_text_key';
  late List<Genre> movieGenres;

  @override
  void initState() {
    super.initState();
    widget.blocGenres.getAllGenres();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: DataState(state: DataEvents.loading),
      stream: widget.blocGenres.genres,
      builder: (
        context,
        snapshot,
      ) {
        switch (snapshot.data?.state) {
          case DataEvents.success:
            List<Genre> snapshotList = snapshot.data?.data ?? [];
            movieGenres =
                widget.genresId.parseGenres(currentGenres: snapshotList);
            return SizedBox(
              height: genresContainerHeight,
              child: Center(
                child: ListView.builder(
                  itemCount: widget.genresId.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
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
                              Radius.circular(Constants.borderRadius)),
                        ),
                        padding: const EdgeInsets.all(Constants.generalPadding),
                        height: genrePaddingHeight,
                        width: genrePaddingWidth,
                        child: Center(
                          child: GeneralText(
                            key: Key('$genreKey$index'),
                            generalText: movieGenres[index].genre,
                            fontSize: Constants.smallTextFont,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case DataEvents.error:
            return Text('${Constants.dataStateError}${snapshot.data?.error}');
          case DataEvents.empty:
            return const Text(Constants.noResultsFound);
          case DataEvents.loading:
            return const Center(child: CircularProgressIndicator());
          default:
            return const Text(Constants.somethingWentWrong);
        }
      },
    );
  }
}
