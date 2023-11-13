import '../../../core/state/state.dart';

import '../../entity/movie.dart';
import '../../repository/i_database_repository.dart';
import '../usecase_interface.dart';

class GetFavoritesUseCase
    implements IUseCase<Future<DataState<List<Movie>>>, void> {
  GetFavoritesUseCase({required this.movieDatabaseRepository});

  IMovieDatabaseRepository movieDatabaseRepository;

  @override
  Future<DataState<List<Movie>>> call([params]) async {
    List<Movie> movies = await movieDatabaseRepository.getFavorites();
    return DataState(
      data: movies.isEmpty ? [] : movies,
      state: movies.isEmpty ? DataEvents.empty : DataEvents.success,
    );
  }
}
