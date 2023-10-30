import '../../core/util/enum_category.dart';

abstract class IUseCase<T> {
  Future<T> repositoryCall([CategoryEnum? category]);
}
