import '../../domain/entity/genre.dart';
import '../../domain/repository/i_database_repository.dart';
import '../datasource/local/movie_database.dart';

class GenreDatabaseRepository implements IGenreDatabaseRepository {
  GenreDatabaseRepository({required this.movieDatabase});

  final MovieDatabase movieDatabase;

  @override
  Future<void> addGenre(Genre genre) async {
    movieDatabase.genreDao.addGenre(genre);
  }

  @override
  Future<List<Genre>> getAllGenres() {
    return movieDatabase.genreDao.getAllGenres();
  }
}
