import 'package:grace/model/material/book/book.dart';
import 'package:grace/model/material/book/search_result.dart';
import 'package:grace/model/material/game/game.dart';
import 'package:grace/model/material/game/search_result.dart';
import 'package:grace/model/material/movie/movie.dart';
import 'package:grace/model/material/movie/search_result.dart';

enum Material {
  book(
    endpoint: '/api/book',
    matFactory: Book.fromJson,
    setFactory: BookSearchResult.fromJson,
  ),
  game(
    endpoint: '/api/game',
    matFactory: Game.fromJson,
    setFactory: GameSearchResult.fromJson,
  ),
  movie(
    endpoint: '/api/movie',
    matFactory: Movie.fromJson,
    setFactory: MovieSearchResult.fromJson,
  );

  final String endpoint;
  final Function matFactory;
  final Function setFactory;

  const Material({
    required this.endpoint,
    required this.matFactory,
    required this.setFactory,
  });
}
