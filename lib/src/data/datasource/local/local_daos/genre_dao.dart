import 'package:floor/floor.dart';

import '../../../../domain/entity/genre.dart';

@dao
abstract class GenreDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addGenre(Genre genre);

  @Query("SELECT * from Genre")
  Future<List<Genre>> getAllGenres();
}
