import '../../../core/state/state.dart';
import '../../entity/genre.dart';
import '../../repository/i_repository.dart';
import '../usecase_interface.dart';

class GenresUseCase implements IUseCase {
  GenresUseCase({
    required this.repository,
  });

  IRepository repository;

  @override
  Future<DataState<List<Genre>>> repositoryCall() async {
    DataState<List<Genre>> allGenres = await repository.getData();
    return allGenres;
  }
}
