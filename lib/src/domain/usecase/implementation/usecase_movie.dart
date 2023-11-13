import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../core/state/state.dart';
import '../../../core/util/enum_category.dart';
import '../../entity/movie.dart';
import '../../repository/i_database_repository.dart';
import '../../repository/i_repository.dart';
import '../usecase_interface.dart';

class MovieUseCase implements IUseCase<Future<DataState<List<Movie>>>, CategoryEnum> {
  MovieUseCase({
    required this.repository,
    required this.connectivity,
    required this.movieDatabaseRepository,
  });

  IMovieRepository repository;
  Connectivity connectivity;
  IMovieDatabaseRepository movieDatabaseRepository;

  @override
  Future<DataState<List<Movie>>> call([CategoryEnum? arguments]) async {
    CategoryEnum? categoryCall = arguments;
    final ConnectivityResult connectivityResult =
        await (connectivity.checkConnectivity());
    late DataState<List<Movie>> dataStateMovie;
    late List<Movie>? movies;

    if (connectivityResult == ConnectivityResult.none) {
      movies = await movieDatabaseRepository.getMovies(categoryCall!.category);
      return DataState(
        data: movies!.isEmpty ? [] : movies,
        state: movies.isEmpty ? DataEvents.empty : DataEvents.success,
      );
    } else {
      dataStateMovie = await repository.getMovies(categoryCall!.category);
      movies = dataStateMovie.data;
      for (var movie in movies!) {
        Movie? movieInDataBase =
            await movieDatabaseRepository.existById(id: movie.id);
        if (movieInDataBase != null) {
          if (!movieInDataBase.categories.contains(categoryCall.category)) {
            movieInDataBase.categories.add(categoryCall.category);
            movieDatabaseRepository.addMovie(movieInDataBase);
          }
        } else {
          movie.categories.add(categoryCall.category);
          movieDatabaseRepository.addMovie(movie);
        }
      }
      return dataStateMovie;
    }
  }
}
