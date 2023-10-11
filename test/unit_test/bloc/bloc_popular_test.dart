import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/src/core/state/state.dart';
import 'package:themoviedb/src/domain/entity/movie.dart';
import 'package:themoviedb/src/domain/usecase/usecase_interface.dart';
import 'package:themoviedb/src/presentation/bloc/bloc_popular.dart';

import '../../mock_classes/mock_usecase.dart';

void main() {
  IUseCase mockUseCaseSuccess = MockMovieUseCaseSuccess();
  IUseCase mockUseCaseEmpty = MockMovieUseCaseEmpty();
  IUseCase mockUseCaseFailure = MockMovieUseCaseFailure();

  DataState<List<Movie>> dataStateLoading = DataState(
    state: DataEvents.loading
  );
  DataState<List<Movie>> dataStateSuccess = DataState(
    data: [Movie.mockMovie(), Movie.mockMovie(),],
    state: DataEvents.success,
  );
  DataState<List<Movie>> dataStateEmpty = DataState(
    data: [],
    state: DataEvents.empty,
  );
  DataState<List<Movie>> dataStateError = DataState(
    state: DataEvents.error
  );

  group('testing of all possibilities in the bloc get', () {
    test('testing stream in the bloc when is successful and has data',
        () async {
      BlocPopular blocPopular = BlocPopular(useCase: mockUseCaseSuccess);
      Stream popularStream = blocPopular.movies;
      expectLater(
        popularStream,
        emitsInOrder([
          dataStateLoading,
          dataStateSuccess,
        ]),
      );
      blocPopular.getPopularMovies();
    });
    test('testing stream in the bloc when the data is empty', () async {
      BlocPopular blocPopular = BlocPopular(useCase: mockUseCaseEmpty);
      Stream popularStream = blocPopular.movies;
      expectLater(
        popularStream,
        emitsInOrder([
          dataStateLoading,
          dataStateEmpty,
        ]),
      );
      blocPopular.getPopularMovies();
    });
    test('testing stream in the bloc when it has an error', () async {
      BlocPopular blocPopular = BlocPopular(useCase: mockUseCaseFailure);
      Stream popularStream = blocPopular.movies;
      expectLater(
        popularStream,
        emitsInOrder([
          dataStateLoading,
          dataStateError,
        ]),
      );
      blocPopular.getPopularMovies();
    });
  });
}
