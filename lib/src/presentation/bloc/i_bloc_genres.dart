import '../../core/bloc/i_bloc.dart';
import '../../core/state/state.dart';
import '../../domain/entity/genre.dart';

abstract class IBlocGenres extends IBloc {
  Stream<DataState<List<Genre>>> get genres;

  void getAllGenres();
}
