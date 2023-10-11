import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/src/core/state/state.dart';
import 'package:themoviedb/src/domain/entity/genre.dart';
import 'package:themoviedb/src/domain/usecase/usecase_interface.dart';
import 'package:themoviedb/src/presentation/bloc/bloc_genres.dart';

import '../../mock_classes/mock_usecase.dart';

void main() {
  IUseCase mockUseCaseSuccess = MockGenreUseCaseSuccess();
  IUseCase mockUseCaseEmpty = MockGenreUseCaseEmpty();
  IUseCase mockUseCaseFailure = MockGenreUseCaseFailure();

  DataState<List<Genre>> dataStateLoading =
      DataState(state: DataEvents.loading);
  DataState<List<Genre>> dataStateSuccess = DataState(
    data: [
      Genre(
        id: 1,
        genre: 'test genre 1',
      ),
      Genre(
        id: 2,
        genre: 'test genre 2',
      ),
      Genre(
        id: 3,
        genre: 'test genre 3',
      ),
    ],
    state: DataEvents.success,
  );
  DataState<List<Genre>> dataStateEmpty = DataState(
    data: [],
    state: DataEvents.empty,
  );
  DataState<List<Genre>> dataStateError = DataState(state: DataEvents.error);

  group('testing of all possibilities in the bloc get', () {
    test('testing stream in the bloc when is successful and has data',
        () async {
      BlocGenres blocGenres = BlocGenres(useCase: mockUseCaseSuccess);
      Stream genreStream = blocGenres.genres;
      expectLater(
        genreStream,
        emitsInOrder([
          dataStateLoading,
          dataStateSuccess,
        ]),
      );
      blocGenres.getAllGenres();
    });
    test('testing stream in the bloc when the data is empty', () async {
      BlocGenres blocGenres = BlocGenres(useCase: mockUseCaseEmpty);
      Stream genreStream = blocGenres.genres;
      expectLater(
        genreStream,
        emitsInOrder([
          dataStateLoading,
          dataStateEmpty,
        ]),
      );
      blocGenres.getAllGenres();
    });
  });
  test('testing stream in the bloc when it has an error', () async {
    BlocGenres blocGenres = BlocGenres(useCase: mockUseCaseFailure);
    Stream genreStream = blocGenres.genres;
    expectLater(
      genreStream,
      emitsInOrder([
        dataStateLoading,
        dataStateError,
      ]),
    );
    blocGenres.getAllGenres();
  });
}
