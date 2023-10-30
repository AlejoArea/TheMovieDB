import 'dart:async';

import '../../core/state/state.dart';
import '../../core/util/enum_category.dart';
import '../../domain/entity/movie.dart';
import '../../domain/usecase/usecase_interface.dart';
import 'i_bloc_popular.dart';

class BlocPopular implements IBlocPopular {
  BlocPopular({
    required this.useCase,
  });

  static const CategoryEnum popularCategory = CategoryEnum.popular;
  IUseCase useCase;

  final _popularMovies = StreamController<DataState<List<Movie>>>.broadcast();

  @override
  Stream<DataState<List<Movie>>> get movies => _popularMovies.stream;

  @override
  void dispose() {
    _popularMovies.close();
  }

  @override
  void getPopularMovies() async {
    _popularMovies.sink.add(
      DataState(state: DataEvents.loading),
    );
    DataState<List<Movie>> popularMoviesResult =
        await useCase.repositoryCall(popularCategory);
    _popularMovies.sink.add(popularMoviesResult);
  }

  @override
  void initialize() {
    // Do nothing
  }
}
