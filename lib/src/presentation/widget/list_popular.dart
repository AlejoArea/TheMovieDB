import 'package:flutter/material.dart';

import '../../domain/entity/movie.dart';
import '../bloc/i_bloc_genres.dart';
import '../custom_widgets.dart';
import 'cached_image.dart';

class ListPopular extends StatelessWidget {
  const ListPopular({
    super.key,
    required this.movieList,
    required this.blocGenres,
  });

  final List<Movie> movieList;
  final IBlocGenres blocGenres;
  static const double containerPadding = 10;

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
            padding: const EdgeInsets.all(containerPadding),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetails(
                        movie: item,
                        blocGenres: blocGenres,
                      ),
                    ));
              },
              child: CachedImageCustom(url: item.posterUrl),
            ),
          ));
        });
  }
}
