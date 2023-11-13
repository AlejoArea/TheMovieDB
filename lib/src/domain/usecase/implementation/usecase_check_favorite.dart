import '../../repository/i_database_repository.dart';
import '../usecase_interface.dart';

class FavoriteCheckUseCase implements IUseCase<Future<bool?>, int> {
  FavoriteCheckUseCase({required this.movieDatabaseRepository});

  IMovieDatabaseRepository movieDatabaseRepository;

  @override
  Future<bool?> call([int? arguments]) async {
    final bool? result = await movieDatabaseRepository.isFavorite(arguments!);
    return result ?? false;
  }
}
