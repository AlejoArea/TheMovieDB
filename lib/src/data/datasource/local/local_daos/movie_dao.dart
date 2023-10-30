import 'package:floor/floor.dart';

import '../../../../domain/entity/movie.dart';

@dao
abstract class MovieDao {
  @Query("SELECT * FROM Movie where categories LIKE '%' || :category || '%'")
  Future<List<Movie>> getMovies(String category);

  @Query('SELECT * FROM Movie where id = :id')
  Future<Movie?> existsById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovie(Movie movie);
}

