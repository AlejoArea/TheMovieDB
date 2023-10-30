import 'package:connectivity_plus/connectivity_plus.dart';

import '../../data/datasource/local/movie_database.dart';
import '../../data/datasource/remote/api_service.dart';
import '../../data/repository/genre_database_repository.dart';
import '../../data/repository/genre_repository.dart';
import '../../data/repository/movie_database_repository.dart';
import '../../data/repository/movie_repository.dart';
import '../../domain/repository/i_database_repository.dart';
import '../../domain/repository/i_repository.dart';
import '../../domain/usecase/implementation/usecase_genres.dart';
import '../../domain/usecase/implementation/usecase_movie.dart';
import '../../domain/usecase/usecase_interface.dart';
import '../../presentation/bloc/bloc_genres.dart';
import '../../presentation/bloc/bloc_popular.dart';
import '../../presentation/bloc/bloc_top_rated.dart';
import '../../presentation/bloc/bloc_upcoming.dart';
import '../../presentation/bloc/i_bloc_genres.dart';
import '../../presentation/bloc/i_bloc_popular.dart';
import '../../presentation/bloc/i_bloc_top_rated.dart';
import '../../presentation/bloc/i_bloc_upcoming.dart';


class InitCore {
  InitCore();

  late IBlocPopular _blocPopular;
  late IBlocTopRated _blocTopRated;
  late IBlocUpcoming _blocUpcoming;
  late IBlocGenres _blocGenres;
  late IUseCase _movieUseCase;
  late IUseCase _genresUseCase;
  late APIService _movieService;
  late IMovieRepository _movieRepository;
  late IRepository _genreRepository;
  late MovieDatabase _dataBase;
  late IMovieDatabaseRepository _movieDatabaseRepository;
  late IGenreDatabaseRepository _genreDatabaseRepository;

  final Connectivity _connectivity = Connectivity();

  IBlocGenres get blocGenres => _blocGenres;

  IBlocPopular get blocPopular => _blocPopular;

  IBlocTopRated get blocTopRated => _blocTopRated;

  IBlocUpcoming get blocUpcoming => _blocUpcoming;

  Future<bool> initialize() async {
    _dataBase =
        await $FloorMovieDatabase.databaseBuilder('movie_database_v1').build();
    _movieService = APIService();

    _movieDatabaseRepository =
        MovieDatabaseRepository(movieDatabase: _dataBase);
    _genreDatabaseRepository =
        GenreDatabaseRepository(movieDatabase: _dataBase);
    _movieRepository = MovieRepository(apiService: _movieService);
    _genreRepository = GenreRepository(apiService: _movieService);

    _movieUseCase = MovieUseCase(
      repository: _movieRepository,
      connectivity: _connectivity,
      movieDatabaseRepository: _movieDatabaseRepository,
    );
    _genresUseCase = GenresUseCase(
      repository: _genreRepository,
      connectivity: _connectivity,
      genreDatabaseRepository: _genreDatabaseRepository,
    );

    _blocPopular = BlocPopular(useCase: _movieUseCase);

    _blocTopRated = BlocTopRated(useCase: _movieUseCase);

    _blocUpcoming = BlocUpcoming(useCase: _movieUseCase);

    _blocGenres = BlocGenres(useCase: _genresUseCase);

    return true;
  }
}
