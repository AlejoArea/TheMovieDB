import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/src/core/state/state.dart';
import 'package:themoviedb/src/domain/entity/movie.dart';
import 'package:themoviedb/src/domain/usecase/usecase_interface.dart';
import 'package:themoviedb/src/presentation/bloc/bloc_upcoming.dart';

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
      BlocUpcoming blocUpcoming = BlocUpcoming(useCase: mockUseCaseSuccess);
      Stream upcomingStream = blocUpcoming.movies;
      expectLater(
        upcomingStream,
        emitsInOrder([
          dataStateLoading,
          dataStateSuccess,
        ]),
      );
      blocUpcoming.getUpcoming();
    });
    test('testing stream in the bloc when the data is empty', () async {
      BlocUpcoming blocUpcoming = BlocUpcoming(useCase: mockUseCaseEmpty);
      Stream upcomingStream = blocUpcoming.movies;
      expectLater(
        upcomingStream,
        emitsInOrder([
          dataStateLoading,
          dataStateEmpty,
        ]),
      );
      blocUpcoming.getUpcoming();
    });
    test('testing stream in the bloc when it has an error', () async {
      BlocUpcoming blocUpcoming = BlocUpcoming(useCase: mockUseCaseFailure);
      Stream upcomingStream = blocUpcoming.movies;
      expectLater(
        upcomingStream,
        emitsInOrder([
          dataStateLoading,
          dataStateError,
        ]),
      );
      blocUpcoming.getUpcoming();
    });
  });
}
