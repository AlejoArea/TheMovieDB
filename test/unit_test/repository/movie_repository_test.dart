import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/src/core/state/state.dart';
import 'package:themoviedb/src/data/datasource/remote/api_service.dart';
import 'package:themoviedb/src/data/repository/movie_repository.dart';

import '../../mock_classes/mock_api_service.dart';

void main() {
  APIService mockAPISuccess = MockMovieApiProviderSuccess();
  APIService mockAPIEmpty = MockMovieApiProviderEmpty();
  APIService mockAPIFailure = MockMovieApiProviderFailure();

  group('testing of all possibilities in the movie repository', () {
    test(
        'getMoviesByUrl() from APIService when the response is successful and has data',
        () async {
      MovieRepository movieRepository = MovieRepository(apiService: mockAPISuccess);
      DataState dataState =
          await movieRepository.getMoviesByUrl('mock_success');
      expect(dataState.state, equals(DataEvents.success));
    });
    test(
        'getMoviesByUrl() from APIService when the response is successful and has no data',
        () async {
      MovieRepository movieRepository = MovieRepository(apiService: mockAPIEmpty);
      DataState dataState =
          await movieRepository.getMoviesByUrl('mock_success_empty');
      expect(dataState.state, equals(DataEvents.empty));
    });
    test('getMoviesByUrl() from APIService when the response fails', () async {
      MovieRepository movieRepository = MovieRepository(apiService: mockAPIFailure);
      DataState dataState =
          await movieRepository.getMoviesByUrl('mock_failure');
      expect(dataState.state, equals(DataEvents.error));
    });
  });
}
