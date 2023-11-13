import '../../core/bloc/i_bloc.dart';
import '../../core/state/state.dart';
import '../../core/util/enum_category.dart';
import '../../domain/entity/movie.dart';

abstract class IBlocMovies extends IBloc {
  Stream<DataState<List<Movie>>> get movies;

  void getMovies(CategoryEnum category);
  void changeFavoriteValue(int id, bool favoriteValue);
  Future<bool?> isFavorite(int id);
  void getFavorite();
}
