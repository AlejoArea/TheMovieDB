import '../../../core/state/state.dart';
import '../../entity/movie.dart';
import '../../repository/i_repository.dart';
import '../usecase_interface.dart';

const String popularUrl = 'movie/popular';

class PopularUseCase implements IUseCase {
  PopularUseCase({
    required this.repository,
  });

  IMovieRepository repository;

  @override
  Future<DataState<List<Movie>>> repositoryCall() async {
    DataState<List<Movie>> dataStatePopular =
        await repository.getMoviesByUrl(popularUrl);
    return dataStatePopular;
  }
}
