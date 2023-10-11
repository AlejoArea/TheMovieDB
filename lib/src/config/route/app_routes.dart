import 'package:flutter/material.dart';

import '../../core/parameter/init_values.dart';
import '../../core/util/ui_constants.dart';
import '../../presentation/custom_widgets.dart';
import '../../presentation/view/popular_movies.dart';
import '../../presentation/view/upcoming_movies.dart';

class Routes {
  Routes();

  Map<String, Widget Function(BuildContext)> getRoutes(
      {required InitCore initCore}) {
    return <String, Widget Function(BuildContext)>{
      Constants.navigationRouteHome: (context) => const HomePage(),
      Constants.navigationRoutePopular: (context) => PopularMovies(
            popularBloc: initCore.blocPopular,
            genresBloc: initCore.blocGenres,
          ),
      Constants.navigationRouteTopRated: (context) => MovieList(
            topRatedBLoc: initCore.blocTopRated,
            genresBloc: initCore.blocGenres,
          ),
      Constants.navigationRouteUpcoming: (context) => UpcomingMovies(
            upcomingBloc: initCore.blocUpcoming,
            genresBloc: initCore.blocGenres,
          ),
    };
  }
}
