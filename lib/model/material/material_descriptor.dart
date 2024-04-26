import 'package:grace/model/material/book/book.dart';
import 'package:grace/model/material/book/search_result.dart';
import 'package:grace/model/material/game/game.dart';
import 'package:grace/model/material/game/search_result.dart';
import 'package:grace/model/material/movie/movie.dart';
import 'package:grace/model/material/movie/search_result.dart';

enum MaterialDescriptor {
  book(
    endpoint: '/api/book',
    table: 'books',
    matFetchFactory: Book.fromJson,
    matSearchFactory: BookSearchResult.fromJson,
  ),
  game(
    endpoint: '/api/game',
    table: 'games',
    matFetchFactory: Game.fromJson,
    matSearchFactory: GameSearchResult.fromJson,
  ),
  movie(
    endpoint: '/api/movie',
    table: 'movies',
    matFetchFactory: Movie.fromJson,
    matSearchFactory: MovieSearchResult.fromJson,
  );

  final String endpoint;
  final String table;
  final Function matFetchFactory;
  final Function matSearchFactory;

  const MaterialDescriptor({
    required this.endpoint,
    required this.table,
    required this.matFetchFactory,
    required this.matSearchFactory,
  });
}
