import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';
import '../../domain/entity/movie.dart';
import '../bloc/i_bloc_genres.dart';
import '../custom_widgets.dart';

class ListTopRated extends StatelessWidget {
  const ListTopRated({
    super.key,
    required this.movieList,
    required this.blocGenres,
  });

  static const String releaseDateText = 'Release date:';
  static const double sizedBoxHeight = 20;
  static const double widthButton = 4;
  static const double buttonElevation = 20;
  static const double iconSize = 40;
  static const String movieDetailsText = 'Movie details';
  static const double paddingMovieCard = 20;
  static const int flex = 1;

  final List<Movie> movieList;
  final IBlocGenres blocGenres;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (_, int position) {
          final item = movieList[position];
          return Card(
            child: Container(
              color: Theme.of(context).colorScheme.background,
              height: (MediaQuery.of(context).size.height) / 2,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(paddingMovieCard),
              child: Row(
                children: [
                  Expanded(
                    flex: flex,
                    child: TitleImage(posterPath: item.posterUrl),
                  ),
                  Expanded(
                    flex: flex,
                    child: Column(
                      children: [
                        const SizedBox(height: sizedBoxHeight),
                        CustomTitle(movieTitle: item.title),
                        const SizedBox(height: sizedBoxHeight),
                        GeneralText(
                          generalText: '$releaseDateText ${item.releaseDate}',
                          fontSize: Constants.smallTextFont,
                        ),
                        const SizedBox(height: sizedBoxHeight),
                        OutlinedButton.icon(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetails(
                                movie: item,
                                blocGenres: blocGenres,
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
        });
  }
}
