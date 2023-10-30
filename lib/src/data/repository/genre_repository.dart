import '../../core/state/state.dart';
import '../../core/util/ui_constants.dart';
import '../../domain/entity/genre.dart';
import '../../domain/repository/i_repository.dart';
import '../datasource/remote/api_service.dart';
import '../mappers/mappers.dart';
import '../model/genre_page_model.dart';

class GenreRepository implements IRepository {
  static const String genresUrl = 'genre/movie/list';

  GenreRepository({
    required this.apiService,
  });

  final GenreMapper genreMapper = GenreMapper();
  APIService apiService;

  List<Genre> _genreList = [];

  @override
  Future<DataState<List<Genre>>> getData() async {
    if (_genreList.isEmpty) {
      try {
        final GenrePageModel response = await apiService.getGenres(genresUrl);
        if (response.results.isEmpty) {
          return DataState(state: DataEvents.empty);
        } else {
          _genreList = response.results
              .map((genreModel) => genreMapper.call(genreModel))
              .toList();
          return DataState(
            data: _genreList,
            state: DataEvents.success,
          );
        }
      } catch (e) {
        return DataState(
          state: DataEvents.error,
          error: Constants.somethingWentWrong,
        );
      }
    } else {
      return DataState(
        data: _genreList,
        state: DataEvents.success,
      );
    }
  }
}
