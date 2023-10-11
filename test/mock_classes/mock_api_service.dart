import 'dart:io';

import 'package:themoviedb/src/data/datasource/remote/api_service.dart';
import 'package:themoviedb/src/data/model/genre_page_model.dart';
import 'package:themoviedb/src/data/model/movie_page_model.dart';

class MockMovieApiProviderSuccess implements APIService {
  final Map<String, dynamic> movieMap = {
    'page': 1,
    'total_results': 2,
    'total_pages': 2,
    'results': [
      {
        "adult": false,
        "backdrop_path": "/oqP1qEZccq5AD9TVTIaO6IGUj7o.jpg",
        "genre_ids": [
          14,
          28,
          12,
        ],
        "id": 455476,
        "original_language": "en",
        "original_title": "Knights of the Zodiac",
        "overview":
            "When a headstrong street orphan, Seiya, in search of his abducted sister unwittingly taps into hidden powers, he discovers he might be the only person alive who can protect a reincarnated goddess, sent to watch over humanity. Can he let his past go and embrace his destiny to become a Knight of the Zodiac?",
        "popularity": 3963.447,
        "poster_path": "/qW4crfED8mpNDadSmMdi7ZDzhXF.jpg",
        "release_date": "2023-04-27",
        "title": "Knights of the Zodiac",
        "video": false,
        "vote_average": 6.5,
        "vote_count": 367,
      },
      {
        "adult": false,
        "backdrop_path": "/4XM8DUTQb3lhLemJC51Jx4a2EuA.jpg",
        "genre_ids": [
          28,
          80,
          53,
        ],
        "id": 385687,
        "original_language": "en",
        "original_title": "Fast X",
        "overview":
            "Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they've ever faced: A terrifying threat emerging from the shadows of the past who's fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.",
        "popularity": 3705.176,
        "poster_path": "/fiVW06jE7z9YnO4trhaMEdclSiC.jpg",
        "release_date": "2023-05-17",
        "title": "Fast X",
        "video": false,
        "vote_average": 7.4,
        "vote_count": 2508,
      },
    ],
  };
  final Map<String, dynamic> genreMap = {
    'genres': {
      {
        "id": 28,
        "name": "Action",
      },
      {
        "id": 12,
        "name": "Adventure",
      },
    }
  };

  @override
  Future<GenrePageModel> getGenres(String urlEndpoint) async {
    return GenrePageModel.fromJson(genreMap);
  }

  @override
  Future<MoviePageModel> getMovies(String urlEndpoint) async {
    return MoviePageModel.fromJson(movieMap);
  }
}

class MockMovieApiProviderEmpty implements APIService {
  final Map<String, dynamic> movieMap = {
    'page': 1,
    'total_results': 2,
    'total_pages': 2,
    'results': [],
  };
  final Map<String, dynamic> genreMap = {'genres': []};

  @override
  Future<GenrePageModel> getGenres(String urlEndpoint) async {
    return GenrePageModel.fromJson(genreMap);
  }

  @override
  Future<MoviePageModel> getMovies(String urlEndpoint) async {
    return MoviePageModel.fromJson(movieMap);
  }
}

class MockMovieApiProviderFailure implements APIService {
  @override
  Future<GenrePageModel> getGenres(String urlEndpoint) async {
    throw const SocketException('Mock Exception Failure');
  }

  @override
  Future<MoviePageModel> getMovies(String urlEndpoint) async {
    throw const SocketException('Mock Exception Failure');
  }
}
