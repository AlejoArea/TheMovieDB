import 'dart:async';

import '../../core/state/state.dart';
import '../../domain/entity/genre.dart';
import '../../domain/usecase/usecase_interface.dart';
import 'i_bloc_genres.dart';

class BlocGenres implements IBlocGenres {
  IUseCase useCase;

  BlocGenres({
    required this.useCase,
  });

  final _genres = StreamController<DataState<List<Genre>>>.broadcast();

  @override
  Stream<DataState<List<Genre>>> get genres => _genres.stream;

  @override
  void dispose() {
    _genres.close();
  }

  @override
  void getAllGenres() async {
    _genres.sink.add(
      DataState(state: DataEvents.loading),
    );
    DataState<List<Genre>> allGenres = await useCase.repositoryCall();
    _genres.sink.add(allGenres);
  }

  @override
  void initialize() {
    // Do nothing
  }
}
