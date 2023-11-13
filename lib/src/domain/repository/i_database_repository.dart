import '../entity/genre.dart';
import '../entity/movie.dart';

abstract class IGenreDatabaseRepository<T> {
  Future<T> getAllGenres();
  Future<void> addGenre(Genre genre);
}

abstract class IMovieDatabaseRepository<T> {
  Future<T> getMovies(String moviesUrl);
  Future<void> addMovie(Movie movie);
  Future<Movie?> existById({required int id});
  Future<void> updateFavorite(int id, bool favorite);
  Future<bool?> isFavorite(int id);
  Future<T> getFavorites();
}
