import 'package:themoviedb/src/core/state/state.dart';
import 'package:themoviedb/src/domain/entity/movie.dart';
import 'package:themoviedb/src/presentation/bloc/i_bloc_popular.dart';

class MockBlocPopularSuccess implements IBlocPopular {
  final List<Movie> mockMovieList = [
    Movie.mockMovie(),
    Movie.mockMovie(),
  ];

  @override
  void dispose() {}

  @override
  void initialize() {}

  @override
  Stream<DataState<List<Movie>>> get movies => Stream.fromFuture(
      Future.value(DataState(data: mockMovieList, state: DataEvents.success)));

  @override
  void getPopularMovies() {}
}

class MockBlocPopularFailed implements IBlocPopular {
  @override
  void dispose() {}

  @override
  void initialize() {}

  @override
  Stream<DataState<List<Movie>>> get movies => Stream.fromFuture(
      Future.value(DataState(state: DataEvents.error, error: 'mock error')));

  @override
  void getPopularMovies() {}
}

class MockBlocPopularEmpty implements IBlocPopular {
  @override
  void dispose() {}

  @override
  void initialize() {}

  @override
  Stream<DataState<List<Movie>>> get movies => Stream.fromFuture(
      Future.value(DataState(data: [], state: DataEvents.empty)));

  @override
  void getPopularMovies() {}
}

class MockBlocPopularLoading implements IBlocPopular {
  @override
  void dispose() {}

  @override
  void initialize() {}

  @override
  Stream<DataState<List<Movie>>> get movies =>
      Stream.fromFuture(Future.value(DataState(state: DataEvents.loading)));

  @override
  void getPopularMovies() {}
}
