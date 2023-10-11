import '../../../core/state/state.dart';
import '../../entity/movie.dart';
import '../../repository/i_repository.dart';
import '../usecase_interface.dart';

const String topRatedUrl = 'movie/top_rated';

class TopRatedUseCase implements IUseCase {
  TopRatedUseCase({
    required this.repository,
  });

  IMovieRepository repository;

  @override
  Future<DataState<List<Movie>>> repositoryCall() async {
    DataState<List<Movie>> topRatedResults =
        await repository.getMoviesByUrl(topRatedUrl);
    return topRatedResults;
  }
}
