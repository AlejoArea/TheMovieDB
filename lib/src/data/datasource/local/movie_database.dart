import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../domain/entity/genre.dart';
import '../../../domain/entity/movie.dart';
import 'converters/list_int_converter.dart';
import 'converters/list_string_converter.dart';
import 'local_daos/genre_dao.dart';
import 'local_daos/movie_dao.dart';

part 'movie_database.g.dart'; // the generated code will be there

@TypeConverters([
  ListIntConverter,
  ListStringConverter,
])
@Database(
  version: 1,
  entities: [
    Movie,
    Genre,
  ],
)
abstract class MovieDatabase extends FloorDatabase {
  MovieDao get movieDao;

  GenreDao get genreDao;
}
