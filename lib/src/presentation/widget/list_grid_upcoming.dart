import 'package:flutter/material.dart';
import 'package:themoviedb/src/core/util/ui_constants.dart';

import '../../domain/entity/movie.dart';
import 'cached_image.dart';

class GridListUpcoming extends StatelessWidget {
  const GridListUpcoming({
    super.key,
    required this.movieList,
  });

  static const sliverGridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 5,
    mainAxisExtent: 310,
  );
  static const double gridViewPadding = 4;
  final List<Movie> movieList;

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
            Navigator.pushNamed(
              context,
              Constants.navigationRouteDetails,
              arguments: movieList[index],
            );
          },
          child: CachedImageCustom(url: movieList[index].posterUrl),
        );
      },
    );
  }
}
