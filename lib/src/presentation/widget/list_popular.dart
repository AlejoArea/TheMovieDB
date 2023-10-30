import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';
import '../../domain/entity/movie.dart';
import 'cached_image.dart';

class ListPopular extends StatelessWidget {
  const ListPopular({
    super.key,
    required this.movieList,
  });

  final List<Movie> movieList;
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
                Navigator.pushNamed(
                  context,
                  Constants.navigationRouteDetails,
                  arguments: movieList[position],
                );
              },
              child: CachedImageCustom(url: item.posterUrl),
            ),
          ));
        });
  }
}
