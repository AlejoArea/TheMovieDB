import 'dart:async';

import '../../core/state/state.dart';
import '../../core/util/enum_category.dart';
import '../../domain/entity/movie.dart';
import '../../domain/usecase/usecase_interface.dart';
import 'i_bloc_top_rated.dart';

class BlocTopRated implements IBlocTopRated {
  BlocTopRated({
    required this.useCase,
  });

  static const CategoryEnum topRatedCategory = CategoryEnum.topRated;

  IUseCase useCase;
  final _topRatedMovies = StreamController<DataState<List<Movie>>>.broadcast();

  @override
  Stream<DataState<List<Movie>>> get movies => _topRatedMovies.stream;

  @override
  void dispose() {
    _topRatedMovies.close();
  }

  @override
  initialize() {
    // Do nothing
  }

  @override
  void getTopRated() async {
    _topRatedMovies.sink.add(DataState(state: DataEvents.loading));
    DataState<List<Movie>> topRatedResults =
        await useCase.repositoryCall(topRatedCategory);
    _topRatedMovies.sink.add(topRatedResults);
  }
}
