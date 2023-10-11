import 'package:themoviedb/src/core/state/state.dart';
import 'package:themoviedb/src/domain/entity/genre.dart';
import 'package:themoviedb/src/presentation/bloc/i_bloc_genres.dart';

class MockBlocGenres implements IBlocGenres {
  List<Genre> mockGenreList = [
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
  ];

  @override
  void dispose() {}

  @override
  void getAllGenres() {}

  @override
  void initialize() {}

  @override
  get genres => Stream.fromFuture(
        Future.value(
          DataState(
            data: mockGenreList,
            state: DataEvents.success,
          ),
        ),
      );
}
