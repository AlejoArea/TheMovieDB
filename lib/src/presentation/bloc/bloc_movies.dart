import 'dart:async';

import '../../core/state/state.dart';
import '../../core/util/enum_category.dart';
import '../../domain/entity/movie.dart';
import '../../domain/usecase/parameters/favorite_parameters.dart';
import '../../domain/usecase/usecase_interface.dart';
import 'i_bloc_movies.dart';

class BlocMovies implements IBlocMovies {
  BlocMovies({
    required this.useCaseMovie,
    required this.useCaseFavoriteUpdate,
    required this.useCaseFavoriteCheck,
    required this.useCaseFavoriteGet,
  });

  IUseCase useCaseFavoriteUpdate;
  IUseCase useCaseMovie;
  IUseCase useCaseFavoriteCheck;
  IUseCase useCaseFavoriteGet;

  final _streamMovies = StreamController<DataState<List<Movie>>>.broadcast();

  @override
  Stream<DataState<List<Movie>>> get movies => _streamMovies.stream;

  @override
  void dispose() {
    _streamMovies.close();
  }

  @override
  void getMovies(CategoryEnum category) async {
    _streamMovies.sink.add(DataState(state: DataEvents.loading));
    DataState<List<Movie>> moviesResult = await useCaseMovie.call(category);
    _streamMovies.sink.add(moviesResult);
  }

  @override
  void initialize() {
    // Do nothing
  }

  @override
  void changeFavoriteValue(int id, bool favoriteValue) {
    useCaseFavoriteUpdate.call(FavoriteParameters(
      id: id,
      favoriteValue: favoriteValue,
    ));
  }

  @override
  Future<bool?> isFavorite(int id) {
    return useCaseFavoriteCheck.call(id);
  }

  @override
  void getFavorite() async {
    _streamMovies.sink.add(DataState(state: DataEvents.loading));
    DataState<List<Movie>> moviesResult = await useCaseFavoriteGet.call();
    _streamMovies.sink.add(moviesResult);
  }

}
