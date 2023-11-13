import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/src/core/state/state.dart';
import 'package:themoviedb/src/core/util/enum_category.dart';
import 'package:themoviedb/src/domain/entity/movie.dart';
import 'package:themoviedb/src/domain/usecase/usecase_interface.dart';
import 'package:themoviedb/src/presentation/bloc/bloc_movies.dart';
import 'package:themoviedb/src/presentation/bloc/i_bloc_movies.dart';

import '../../mock_classes/mock_usecase.dart';

void main() {
  const CategoryEnum genericCategory = CategoryEnum.popular;
  IUseCase mockUseCaseSuccess = MockMovieUseCaseSuccess();
  IUseCase mockUseCaseEmpty = MockMovieUseCaseEmpty();
  IUseCase mockUseCaseFailure = MockMovieUseCaseFailure();

  DataState<List<Movie>> dataStateLoading =
      DataState(state: DataEvents.loading);
  DataState<List<Movie>> dataStateSuccess = DataState(
    data: [
      Movie.mockMovie(),
      Movie.mockMovie(),
    ],
    state: DataEvents.success,
  );
  DataState<List<Movie>> dataStateEmpty = DataState(
    data: [],
    state: DataEvents.empty,
  );
  DataState<List<Movie>> dataStateError = DataState(state: DataEvents.error);

  group('testing of all possibilities in the bloc get', () {
    test('testing stream in the bloc when is successful and has data',
        () async {
      IBlocMovies blocPopular = BlocMovies(useCase: mockUseCaseSuccess);
      Stream popularStream = blocPopular.movies;
      expectLater(
        popularStream,
        emitsInOrder([
          dataStateLoading,
          dataStateSuccess,
        ]),
      );
      blocPopular.getMovies(genericCategory);
    });
    test('testing stream in the bloc when the data is empty', () async {
      IBlocMovies blocPopular = BlocMovies(useCase: mockUseCaseEmpty);
      Stream popularStream = blocPopular.movies;
      expectLater(
        popularStream,
        emitsInOrder([
          dataStateLoading,
          dataStateEmpty,
        ]),
      );
      blocPopular.getMovies(genericCategory);
    });
    test('testing stream in the bloc when it has an error', () async {
      IBlocMovies blocPopular = BlocMovies(useCase: mockUseCaseFailure);
      Stream popularStream = blocPopular.movies;
      expectLater(
        popularStream,
        emitsInOrder([
          dataStateLoading,
          dataStateError,
        ]),
      );
      blocPopular.getMovies(genericCategory);
    });
  });
}
