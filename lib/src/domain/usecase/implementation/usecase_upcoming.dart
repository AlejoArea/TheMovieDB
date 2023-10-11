import '../../../core/state/state.dart';
import '../../entity/movie.dart';
import '../../repository/i_repository.dart';
import '../usecase_interface.dart';

class UpcomingUseCase implements IUseCase {
  UpcomingUseCase({
    required this.repository,
  });

  static const String upcomingUrl = 'movie/upcoming';
  IMovieRepository repository;

  @override
  Future<DataState<List<Movie>>> repositoryCall() async {
    DataState<List<Movie>> upcomingMoviesResult =
        await repository.getMoviesByUrl(upcomingUrl);
    return upcomingMoviesResult;
  }
}
