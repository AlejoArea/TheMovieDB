import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/src/core/state/state.dart';
import 'package:themoviedb/src/domain/entity/movie.dart';
import 'package:themoviedb/src/domain/usecase/usecase_interface.dart';
import 'package:themoviedb/src/presentation/bloc/bloc_top_rated.dart';

import '../../mock_classes/mock_usecase.dart';

void main() {
  IUseCase mockUseCaseSuccess = MockMovieUseCaseSuccess();
  IUseCase mockUseCaseEmpty = MockMovieUseCaseEmpty();
  IUseCase mockUseCaseFailure = MockMovieUseCaseFailure();

  DataState<List<Movie>> dataStateLoading =
      DataState(state: DataEvents.loading);
  DataState<List<Movie>> dataStateSuccess = DataState(
    data: [Movie.mockMovie(), Movie.mockMovie()],
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
      BlocTopRated blocTopRated = BlocTopRated(useCase: mockUseCaseSuccess);
      Stream topRatedStream = blocTopRated.movies;
      expectLater(
        topRatedStream,
        emitsInOrder([
          dataStateLoading,
          dataStateSuccess,
        ]),
      );
      blocTopRated.getTopRated();
    });
    test('testing stream in the bloc when is the result is empty', () async {
      BlocTopRated blocTopRated = BlocTopRated(useCase: mockUseCaseEmpty);
      Stream topRatedStream = blocTopRated.movies;
      expectLater(
        topRatedStream,
        emitsInOrder([
          dataStateLoading,
          dataStateEmpty,
        ]),
      );
      blocTopRated.getTopRated();
    });
    test('testing stream in the bloc when it has an error', () async {
      BlocTopRated blocTopRated = BlocTopRated(useCase: mockUseCaseFailure);
      Stream topRatedStream = blocTopRated.movies;
      expectLater(
        topRatedStream,
        emitsInOrder([
          dataStateLoading,
          dataStateError,
        ]),
      );
      blocTopRated.getTopRated();
    });
  });
}
