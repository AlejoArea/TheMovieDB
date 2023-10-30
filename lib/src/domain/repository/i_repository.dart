abstract class IRepository<T> {
  Future<T> getData();
}

abstract class IMovieRepository<T> {
  Future<T> getMovies(String moviesUrl);
}
