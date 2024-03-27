import 'package:grace/model/book/book.dart';
import 'package:grace/model/game/game.dart';
import 'package:grace/model/movie/movie.dart';

enum Material {
  book(endpoint: '/api/book', parser: Book.fromJson),
  game(endpoint: '/api/game', parser: Game.fromJson),
  movie(endpoint: '/api/movie', parser: Movie.fromJson);

  final String endpoint;
  final Function parser;

  const Material({
    required this.endpoint,
    required this.parser,
  });
}
