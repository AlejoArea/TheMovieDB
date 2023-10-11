import 'package:flutter/material.dart';

import '../../domain/entity/movie.dart';
import '../bloc/i_bloc_genres.dart';
import '../custom_widgets.dart';
import 'cached_image.dart';

class GridListUpcoming extends StatelessWidget {
  const GridListUpcoming({
    super.key,
    required this.movieList,
    required this.blocGenres,
  });

  static const sliverGridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 5,
    mainAxisExtent: 310,
  );
  static const double gridViewPadding = 4;
  final List<Movie> movieList;
  final IBlocGenres blocGenres;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(gridViewPadding),
      itemCount: movieList.length,
      gridDelegate: sliverGridDelegate,
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetails(
                  movie: movieList[index],
                  blocGenres: blocGenres,
                ),
              ),
            );
          },
          child: CachedImageCustom(url: movieList[index].posterUrl),
        );
      },
    );
  }
}
