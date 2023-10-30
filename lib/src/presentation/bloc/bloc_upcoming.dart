import 'dart:async';

import '../../core/state/state.dart';
import '../../core/util/enum_category.dart';
import '../../domain/entity/movie.dart';
import '../../domain/usecase/usecase_interface.dart';
import 'i_bloc_upcoming.dart';

class BlocUpcoming implements IBlocUpcoming {
  BlocUpcoming({
    required this.useCase,
  });

  static const CategoryEnum upcomingCategory = CategoryEnum.upcoming;

  IUseCase useCase;
  final _upcomingMovies = StreamController<DataState<List<Movie>>>.broadcast();

  @override
  Stream<DataState<List<Movie>>> get movies => _upcomingMovies.stream;

  @override
  void dispose() {
    _upcomingMovies.close();
  }

  @override
  void initialize() async {
    // Do nothing
  }

  @override
  void getUpcoming() async {
    _upcomingMovies.sink.add(DataState(state: DataEvents.loading));
    DataState<List<Movie>> upcomingMoviesResults =
        await useCase.repositoryCall(upcomingCategory);
    _upcomingMovies.sink.add(upcomingMoviesResults);
  }
}
