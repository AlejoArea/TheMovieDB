import '../../core/bloc/i_bloc.dart';
import '../../core/state/state.dart';
import '../../domain/entity/movie.dart';

abstract class IBlocUpcoming extends IBloc {
  Stream<DataState<List<Movie>>> get movies;

  void getUpcoming();
}
