import 'package:themoviedb/src/core/state/state.dart';
import 'package:themoviedb/src/domain/entity/movie.dart';
import 'package:themoviedb/src/presentation/bloc/i_bloc_top_rated.dart';

class MockBlocTopRatedSuccess implements IBlocTopRated {
  final List<Movie> mockMovieList = [Movie.mockMovie(), Movie.mockMovie()];

  @override
  void dispose() {}

  @override
  void getTopRated() {}

  @override
  void initialize() {}

  @override
  Stream<DataState<List<Movie>>> get movies => Stream.fromFuture(
      Future.value(DataState(data: mockMovieList, state: DataEvents.success)));
}

class MockBlocTopRatedFailed implements IBlocTopRated {
  @override
  void dispose() {}

  @override
  void getTopRated() {}

  @override
  void initialize() {}

  @override
  Stream<DataState<List<Movie>>> get movies => Stream.fromFuture(
      Future.value(DataState(state: DataEvents.error, error: 'mock error')));
}

class MockBlocTopRatedEmpty implements IBlocTopRated {
  @override
  void dispose() {}

  @override
  void getTopRated() {}

  @override
  void initialize() {}

  @override
  Stream<DataState<List<Movie>>> get movies => Stream.fromFuture(
      Future.value(DataState(data: [], state: DataEvents.empty)));
}

class MockBlocTopRatedLoading implements IBlocTopRated {
  @override
  void dispose() {}

  @override
  void getTopRated() {}

  @override
  void initialize() {}

  @override
  Stream<DataState<List<Movie>>> get movies => Stream.fromFuture(
      Future.value(DataState(state: DataEvents.loading)));
}
