import '../../domain/entity/genre.dart';
import '../../domain/entity/movie.dart';
import '../model/genre_model.dart';
import '../model/movies_model.dart';
import 'i_mapper.dart';

class MovieMapper implements IMapper<MovieModel, Movie> {
  @override
  Movie call(MovieModel movieModel) {
    return Movie(
      title: movieModel.title,
      originalTitle: movieModel.originalTitle,
      originalLanguage: movieModel.originalLanguage,
      id: movieModel.id,
      adult: movieModel.adult,
      releaseDate: movieModel.releaseDate,
      overview: movieModel.overview,
      voteAverage: movieModel.voteAverage,
      genres: movieModel.genres,
      posterPath: movieModel.posterPath,
      backdropPath: movieModel.backdropPath,
      popularity: movieModel.popularity,
      video: movieModel.video,
      voteCount: movieModel.voteCount,
      categories: movieModel.categories,
    );
  }
}

class GenreMapper implements IMapper<GenreModel, Genre> {
  @override
  Genre call(GenreModel genreModel) {
    return Genre(
      id: genreModel.id,
      genre: genreModel.genre,
    );
  }
}
