import 'package:flutter/material.dart';

import '../custom_widgets.dart';
import '../../core/util/ui_constants.dart';
import '../../data/repository/movie_repository.dart';
import '../../domain/entity/movie.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late Future<List<Movie>> _movies;
  static const String releaseDateText = 'Release date:';
  static const double sizedBoxHeight = 20;
  static const double widthButton = 4;
  static const double buttonElevation = 20;
  static const double iconSize = 40;
  static const String movieDetailsText = 'Movie details';
  static const double paddingMovieCard = 20;

  @override
  void initState() {
    super.initState();
    _movies = MovieRepository().getData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: _movies,
      builder: (
        context,
        snapshot,
      ) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (_, int position) {
                  final item = snapshot.data?[position];
                  return Card(
                    child: Container(
                      color: Theme.of(context).colorScheme.background,
                      height: (MediaQuery.of(context).size.height) / 2,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(paddingMovieCard),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TitleImage(
                              posterPath: item!.posterUrl,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: sizedBoxHeight,
                                ),
                                CustomTitle(
                                  movieTitle: item.title,
                                ),
                                const SizedBox(
                                  height: sizedBoxHeight,
                                ),
                                GeneralText(
                                  generalText:
                                      '$releaseDateText ${item.releaseDate}',
                                  fontSize: Constants.smallTextFont,
                                ),
                                const SizedBox(
                                  height: sizedBoxHeight,
                                ),
                                OutlinedButton.icon(
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MovieDetails(
                                        movie: item,
                                      ),
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    elevation: buttonElevation,
                                    backgroundColor: Colors.blue,
                                    shape: const StadiumBorder(),
                                    side: const BorderSide(
                                      width: widthButton,
                                      color: Colors.black,
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.movie,
                                    size: iconSize,
                                  ),
                                  label: const GeneralText(
                                    generalText: movieDetailsText,
                                    fontSize: Constants.smallTextFont,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
