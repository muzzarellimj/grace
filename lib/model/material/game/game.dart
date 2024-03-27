import 'package:grace/model/material/game/franchise.dart';
import 'package:grace/model/material/game/genre.dart';
import 'package:grace/model/material/game/platform.dart';
import 'package:grace/model/material/game/studio.dart';

class Game {
  int id;
  String title;
  String summary;
  String storyline;
  List<GameFranchise> franchises;
  List<GameGenre> genres;
  List<GamePlatform> platforms;
  List<GameStudio> studios;
  int releaseDate;
  String image;
  int reference;

  Game({
    required this.id,
    required this.title,
    required this.summary,
    required this.storyline,
    required this.franchises,
    required this.genres,
    required this.platforms,
    required this.studios,
    required this.releaseDate,
    required this.image,
    required this.reference,
  });

  factory Game.fromJson(Map<String, dynamic> input) {
    List<GameFranchise> franchises = (input['franchises'] as List)
        .map((franchise) => GameFranchise.fromJson(franchise))
        .toList();

    List<GameGenre> genres = (input['genres'] as List)
        .map((genre) => GameGenre.fromJson(genre))
        .toList();

    List<GamePlatform> platforms = (input['platforms'] as List)
        .map((plaform) => GamePlatform.fromJson(plaform))
        .toList();

    List<GameStudio> studios = (input['studios'] as List)
        .map((studio) => GameStudio.fromJson(studio))
        .toList();

    return Game(
      id: input['id'],
      title: input['title'],
      summary: input['summary'],
      storyline: input['storyline'],
      franchises: franchises,
      genres: genres,
      platforms: platforms,
      studios: studios,
      releaseDate: input['release_date'],
      image: input['image'],
      reference: input['reference'],
    );
  }
}
