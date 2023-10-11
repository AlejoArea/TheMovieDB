import 'package:themoviedb/src/core/state/state.dart';
import 'package:themoviedb/src/domain/entity/genre.dart';
import 'package:themoviedb/src/domain/entity/movie.dart';
import 'package:themoviedb/src/domain/usecase/usecase_interface.dart';

class MockMovieUseCaseSuccess implements IUseCase {
  @override
  Future<DataState<List<Movie>>> repositoryCall() async {
    return DataState(
      data: [Movie.mockMovie(), Movie.mockMovie()],
      state: DataEvents.success,
    );
  }
}

class MockMovieUseCaseEmpty implements IUseCase {
  @override
  Future<DataState<List<Movie>>> repositoryCall() async {
    return DataState(
      data: [],
      state: DataEvents.empty,
    );
  }
}

class MockMovieUseCaseFailure implements IUseCase {
  @override
  Future<DataState<List<Movie>>> repositoryCall() async {
    return DataState(
      state: DataEvents.error,
      error: 'mock error',
    );
  }
}

class MockGenreUseCaseSuccess implements IUseCase {
  @override
  Future<DataState<List<Genre>>> repositoryCall() async {
    return DataState(
      data: [
        Genre(
          id: 1,
          genre: 'mock genre 1',
        ),
        Genre(
          id: 2,
          genre: 'mock genre 2',
        ),
      ],
      state: DataEvents.success,
    );
  }
}

class MockGenreUseCaseEmpty implements IUseCase {
  @override
  Future<DataState<List<Genre>>> repositoryCall() async {
    return DataState(
      data: [],
      state: DataEvents.empty,
    );
  }
}

class MockGenreUseCaseFailure implements IUseCase {
  @override
  Future<DataState<List<Genre>>> repositoryCall() async {
    return DataState(
      state: DataEvents.error,
      error: 'mock error',
    );
  }
}
