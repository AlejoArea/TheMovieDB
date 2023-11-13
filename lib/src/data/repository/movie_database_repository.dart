import '../../domain/entity/movie.dart';
import '../../domain/repository/i_database_repository.dart';
import '../datasource/local/movie_database.dart';

class MovieDatabaseRepository implements IMovieDatabaseRepository {
  MovieDatabaseRepository({required this.movieDatabase});

  MovieDatabase movieDatabase;

  @override
  Future<void> addMovie(Movie movie) {
    return movieDatabase.movieDao.insertMovie(movie);
  }

  @override
  Future<Movie?> existById({required int id}) {
    return movieDatabase.movieDao.existsById(id);
  }

  @override
  Future<List<Movie>> getMovies(String moviesUrl) {
    return movieDatabase.movieDao.getMovies(moviesUrl);
  }

  @override
  Future<void> updateFavorite(
    int id,
    bool favorite,
  ) async {
    movieDatabase.movieDao.updateMovie(
      id,
      favorite,
    );
  }

  @override
  Future<bool?> isFavorite(int id) async {
    return movieDatabase.movieDao.isFavorite(id);
  }

  @override
  Future<List<Movie>> getFavorites() {
    return movieDatabase.movieDao.getFavorite();
  }
}
