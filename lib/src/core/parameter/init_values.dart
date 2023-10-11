import '../../data/datasource/remote/api_service.dart';
import '../../data/repository/genre_repository.dart';
import '../../data/repository/movie_repository.dart';
import '../../domain/usecase/implementation/usecase_genres.dart';
import '../../domain/usecase/implementation/usecase_popular.dart';
import '../../domain/usecase/implementation/usecase_top_rated.dart';
import '../../domain/usecase/implementation/usecase_upcoming.dart';
import '../../presentation/bloc/bloc_genres.dart';
import '../../presentation/bloc/bloc_popular.dart';
import '../../presentation/bloc/bloc_top_rated.dart';
import '../../presentation/bloc/bloc_upcoming.dart';

class InitCore {
  InitCore();

  late BlocPopular _blocPopular;
  late BlocTopRated _blocTopRated;
  late BlocUpcoming _blocUpcoming;
  late BlocGenres _blocGenres;
  late UpcomingUseCase _upcomingUseCase;
  late PopularUseCase _popularUseCase;
  late TopRatedUseCase _topRatedUseCase;
  late GenresUseCase _genresUseCase;
  late APIService _movieService;
  late MovieRepository _movieRepository;
  late GenreRepository _genreRepository;

  BlocGenres get blocGenres => _blocGenres;

  BlocPopular get blocPopular => _blocPopular;

  BlocTopRated get blocTopRated => _blocTopRated;

  BlocUpcoming get blocUpcoming => _blocUpcoming;

  Future<bool> initialize() async {
    _movieService = APIService();

    _movieRepository = MovieRepository(apiService: _movieService);
    _genreRepository = GenreRepository(apiService: _movieService);

    _upcomingUseCase = UpcomingUseCase(repository: _movieRepository);
    _topRatedUseCase = TopRatedUseCase(repository: _movieRepository);
    _popularUseCase = PopularUseCase(repository: _movieRepository);
    _genresUseCase = GenresUseCase(repository: _genreRepository);

    _blocPopular = BlocPopular(useCase: _popularUseCase);

    _blocTopRated = BlocTopRated(useCase: _topRatedUseCase);

    _blocUpcoming = BlocUpcoming(useCase: _upcomingUseCase);

    _blocGenres = BlocGenres(useCase: _genresUseCase);

    return true;
  }
}
