import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:themoviedb/src/core/util/enum_category.dart';

import '../../../core/state/state.dart';
import '../../entity/genre.dart';
import '../../repository/i_database_repository.dart';
import '../../repository/i_repository.dart';
import '../usecase_interface.dart';

class GenresUseCase implements IUseCase<Future<DataState<List<Genre>>>, dynamic> {
  GenresUseCase({
    required this.repository,
    required this.connectivity,
    required this.genreDatabaseRepository,
  });

  Connectivity connectivity;
  IRepository repository;
  IGenreDatabaseRepository genreDatabaseRepository;

  @override
  Future<DataState<List<Genre>>> call([arguments]) async {
    final ConnectivityResult connectivityResult =
        await (connectivity.checkConnectivity());
    late DataState<List<Genre>> allGenres;
    late List<Genre>? genres;
    if (connectivityResult == ConnectivityResult.none) {
      genres = await genreDatabaseRepository.getAllGenres();
      return DataState(
        data: genres!.isEmpty ? [] : genres,
        state: genres.isEmpty ? DataEvents.empty : DataEvents.success,
      );
    } else {
      allGenres = await repository.getData();
      genres = allGenres.data;
      _saveGenresData(genres ?? []);
      return allGenres;
    }
  }

  Future<void> _saveGenresData(List<Genre> genres) async {
    for (var genre in genres) {
      genreDatabaseRepository.addGenre(genre);
    }
  }
}
