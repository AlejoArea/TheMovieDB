import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            create: (_) => initCore.blocPopular,
            child: const PopularMovies(),
          ),
      Constants.navigationRouteTopRated: (context) => Provider(
            create: (_) => initCore.blocTopRated,
            child: const MovieList(),
          ),
      Constants.navigationRouteUpcoming: (context) => Provider(
            create: (_) => initCore.blocUpcoming,
            child: const UpcomingMovies(),
          ),
      Constants.navigationRouteDetails: (context) {
        final movie = ModalRoute.of(context)!.settings.arguments as Movie;
        return Provider(
          create: (_) => initCore.blocGenres,
          child: MovieDetails(movie: movie),
        );
      }
    };
  }
}
