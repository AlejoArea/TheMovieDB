import 'package:themoviedb/src/core/state/state.dart';
import 'package:themoviedb/src/domain/entity/movie.dart';
import 'package:themoviedb/src/presentation/bloc/i_bloc_upcoming.dart';

class MockBlocUpcomingSuccess implements IBlocUpcoming {
  final List<Movie> mockMovieList = [Movie.mockMovie(), Movie.mockMovie()];

  @override
  void dispose() {}

  @override
  void initialize() {}

  @override
  Stream<DataState<List<Movie>>> get movies => Stream.fromFuture(
      Future.value(DataState(data: mockMovieList, state: DataEvents.success)));

  @override
  void getUpcoming() {}
}

class MockBlocUpcomingFailed implements IBlocUpcoming {
  @override
  void dispose() {}

  @override
  void initialize() {}

  @override
  Stream<DataState<List<Movie>>> get movies => Stream.fromFuture(
      Future.value(DataState(state: DataEvents.error, error: 'mock error')));

  @override
  void getUpcoming() {}
}

class MockBlocUpcomingEmpty implements IBlocUpcoming {
  @override
  void dispose() {}

  @override
  void initialize() {}

  @override
  Stream<DataState<List<Movie>>> get movies => Stream.fromFuture(
      Future.value(DataState(data: [], state: DataEvents.empty)));

  @override
  void getUpcoming() {}
}

class MockBlocUpcomingLoading implements IBlocUpcoming {
  @override
  void dispose() {}

  @override
  void initialize() {}

  @override
  Stream<DataState<List<Movie>>> get movies =>
      Stream.fromFuture(Future.value(DataState(state: DataEvents.loading)));

  @override
  void getUpcoming() {}
}
