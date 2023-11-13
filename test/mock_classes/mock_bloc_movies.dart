import 'package:themoviedb/src/core/state/state.dart';
import 'package:themoviedb/src/core/util/enum_category.dart';
import 'package:themoviedb/src/domain/entity/movie.dart';
import 'package:themoviedb/src/presentation/bloc/i_bloc_movies.dart';

class MockBlocMoviesSuccess implements IBlocMovies {
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
  void getMovies(CategoryEnum category) {}
}

class MockBlocMoviesFailed implements IBlocMovies {
  @override
  void dispose() {}

  @override
  void initialize() {}

  @override
  Stream<DataState<List<Movie>>> get movies => Stream.fromFuture(
      Future.value(DataState(state: DataEvents.error, error: 'mock error')));

  @override
  void getMovies(CategoryEnum category) {}
}

class MockBlocMoviesEmpty implements IBlocMovies {
  @override
  void dispose() {}

  @override
  void initialize() {}

  @override
  Stream<DataState<List<Movie>>> get movies => Stream.fromFuture(
      Future.value(DataState(data: [], state: DataEvents.empty)));

  @override
  void getMovies(CategoryEnum category) {}
}

class MockBlocMoviesLoading implements IBlocMovies {
  @override
  void dispose() {}

  @override
  void initialize() {}

  @override
  Stream<DataState<List<Movie>>> get movies =>
      Stream.fromFuture(Future.value(DataState(state: DataEvents.loading)));

  @override
  void getMovies(CategoryEnum category) {}
}
