import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/src/core/state/state.dart';
import 'package:themoviedb/src/data/datasource/remote/api_service.dart';
import 'package:themoviedb/src/data/repository/genre_repository.dart';

import '../../mock_classes/mock_api_service.dart';


void main() {
  APIService mockAPISuccess = MockMovieApiProviderSuccess();
  APIService mockAPIEmpty = MockMovieApiProviderEmpty();
  APIService mockAPIFailure = MockMovieApiProviderFailure();

  group('testing of all possibilities in the movie repository', () {
    test(
        'getData() from APIService when the response is successful and has data',
        () async {
      GenreRepository genreRepository = GenreRepository(apiService: mockAPISuccess);
      DataState dataState = await genreRepository.getData();
      expect(dataState.state, equals(DataEvents.success));
    });
    test(
        'getData() from APIService when the response is successful and has no data',
        () async {
      GenreRepository genreRepository = GenreRepository(apiService: mockAPIEmpty);
      DataState dataState = await genreRepository.getData();
      expect(dataState.state, equals(DataEvents.empty));
    });
    test('getData() from APIService when the response fails', () async {
      GenreRepository genreRepository = GenreRepository(apiService: mockAPIFailure);
      DataState dataState = await genreRepository.getData();
      expect(dataState.state, equals(DataEvents.error));
    });
  });
}
