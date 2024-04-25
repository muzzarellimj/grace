import 'package:grace/model/material/game/game.dart';

class GameUpdate {
  int id;
  String title;
  String summary;
  String storyline;
  int releaseDate;
  String image;
  int reference;

  GameUpdate({
    required this.id,
    required this.title,
    required this.summary,
    required this.storyline,
    required this.releaseDate,
    required this.image,
    required this.reference,
  });

  factory GameUpdate.fromGame(Game game) {
    return GameUpdate(
      id: game.id,
      title: game.title,
      summary: game.summary,
      storyline: game.storyline,
      releaseDate: game.releaseDate,
      image: game.image,
      reference: game.reference,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'summary': summary,
        'storyline': storyline,
        'release_date': releaseDate,
        'image': image,
        'reference': reference,
      };
}
