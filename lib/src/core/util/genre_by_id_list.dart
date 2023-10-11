import '../../domain/entity/genre.dart';

extension GenresParsing on List<int>{
  List<Genre> parseGenres({required List<Genre> currentGenres}){
    return map((id) => currentGenres.firstWhere((g) => g.id == id)).toList();
  }
}
