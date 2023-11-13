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

  @Query('UPDATE Movie SET favorite = :favoriteValue WHERE id = :id')
  Future<void> updateMovie(
    int id,
    bool favoriteValue,
  );

  @Query('SELECT favorite FROM Movie WHERE id = :id')
  Future<bool?> isFavorite(int id);

  @Query("SELECT * FROM Movie WHERE favorite = true")
  Future<List<Movie>> getFavorite();
}
