import '../../core/state/state.dart';
import '../../core/util/ui_constants.dart';
import '../../domain/entity/movie.dart';
import '../../domain/repository/i_repository.dart';
import '../datasource/remote/api_service.dart';
import '../mappers/mappers.dart';
import '../model/movie_page_model.dart';

class MovieRepository implements IMovieRepository {
  MovieRepository({
    required this.apiService,
  });

  MovieMapper movieMapper = MovieMapper();
  APIService apiService;

  @override
  Future<DataState<List<Movie>>> getMoviesByUrl(String moviesUrl) async {
    try {
      final MoviePageModel response = await apiService.getMovies(moviesUrl);
      if (response.results.isEmpty) {
        return DataState(state: DataEvents.empty);
      } else {
        return DataState(
          data: response.results
              .map((movieModel) => movieMapper.call(movieModel))
              .toList(),
          state: DataEvents.success,
        );
      }
    } catch (e) {
      return DataState(
        state: DataEvents.error,
        error: Constants.somethingWentWrong,
      );
    }
  }
}
