import '../../repository/i_database_repository.dart';
import '../parameters/favorite_parameters.dart';
import '../usecase_interface.dart';

class FavoriteUpdateUseCase implements IUseCase<void, FavoriteParameters> {
  FavoriteUpdateUseCase({required this.movieDatabaseRepository});

  IMovieDatabaseRepository movieDatabaseRepository;

  @override
  void call([FavoriteParameters? arguments]) {
    final int? id = arguments?.id;
    final bool? favoriteValue = arguments?.favoriteValue;
    movieDatabaseRepository.updateFavorite(id!, favoriteValue!);
  }
}
