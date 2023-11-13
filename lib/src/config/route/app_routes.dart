import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/src/presentation/view/favorite_page.dart';

import '../../core/parameter/init_values.dart';
import '../../core/util/ui_constants.dart';
import '../../domain/entity/movie.dart';
import '../../presentation/custom_widgets.dart';
import '../../presentation/view/popular_movies.dart';
import '../../presentation/view/upcoming_movies.dart';

class Routes {
  Routes();

  Map<String, Widget Function(BuildContext)> getRoutes(
      {required InitCore initCore}) {
    return <String, Widget Function(BuildContext)>{
      Constants.navigationRouteHome: (context) => const HomePage(),
      Constants.navigationRoutePopular: (context) => Provider(
            create: (_) => initCore.blocMovies,
            child: const PopularMovies(),
          ),
      Constants.navigationRouteTopRated: (context) => Provider(
            create: (_) => initCore.blocMovies,
            child: const MovieList(),
          ),
      Constants.navigationRouteUpcoming: (context) => Provider(
            create: (_) => initCore.blocMovies,
            child: const UpcomingMovies(),
          ),
      Constants.navigationRouteFavorites: (context) => Provider(
            create: (_) => initCore.blocMovies,
            child: const Favorites(),
          ),
      Constants.navigationRouteDetails: (context) {
        final movie = ModalRoute.of(context)!.settings.arguments as Movie;
        return MultiProvider(
          providers: [
            Provider(create: (_) => initCore.blocGenres),
            Provider(create: (_) => initCore.blocMovies),
          ],
          child: MovieDetails(movie: movie),
        );
      }
    };
  }
}
