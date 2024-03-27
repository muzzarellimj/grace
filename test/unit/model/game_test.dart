import 'package:grace/model/game/game.dart';
import 'package:test/test.dart';

const Map<String, dynamic> mockResponse = {
  "data": {
    "id": 3,
    "title": "Super Smash Bros.",
    "summary":
        "Super Smash Bros. is a crossover fighting video game between several different Nintendo franchises, and the first installment in the Super Smash Bros. series. Players must defeat their opponents multiple times in a fighting frenzy of items and power-ups. Super Smash Bros. is a departure from the general genre of fighting games: instead of depleting an opponent's life bar, the players seek to knock opposing characters off a stage. Each player has a damage total, represented by a percentage, which rises as the damage is taken.",
    "storyline": "",
    "franchises": [
      {"id": 2, "name": "Mario Bros.", "reference": 24},
      {"id": 3, "name": "Pokémon", "reference": 60},
      {"id": 4, "name": "Earthbound", "reference": 123},
      {"id": 5, "name": "The Legend of Zelda", "reference": 596},
      {"id": 6, "name": "Metroid", "reference": 756},
      {"id": 7, "name": "Donkey Kong", "reference": 763},
      {"id": 8, "name": "Star Fox", "reference": 771},
      {"id": 9, "name": "Kirby", "reference": 789},
      {"id": 10, "name": "Mario", "reference": 845},
      {"id": 11, "name": "Yoshi", "reference": 1567},
      {"id": 12, "name": "F-Zero", "reference": 1764},
      {"id": 13, "name": "Super Smash Bros.", "reference": 1787}
    ],
    "genres": [
      {"id": 5, "name": "Fighting", "reference": 4},
      {"id": 6, "name": "Platform", "reference": 8}
    ],
    "platforms": [
      {"id": 7, "name": "Nintendo 64", "reference": 4},
      {"id": 8, "name": "Wii", "reference": 5}
    ],
    "studios": [
      {
        "id": 3,
        "name": "HAL Laboratory",
        "description":
            "HAL Laboratory is a Japanese game developer partnered with Nintendo. It was founded by a small group of friends who shared the desire to create games, and among said group was Satoru Iwata. The group developed games for numerous platforms at first before developing exclusively for Nintendo. The name HAL originates from the fictional computer HAL 9000 from 2001: A Space Odyssey, as well as each letter being one letter before IBM. HAL Laboratory is most notable for developing the Kirby series created by ex-employee Masahiro Sakurai, they are also responsible for the Super Smash Bros. and the EarthBound series.",
        "reference": 762
      }
    ],
    "release_date": 916876800,
    "image": "https://images.igdb.com/igdb/image/upload/t_cover_big/co2tso.jpg",
    "reference": 1626
  },
  "status": 200
};

void main() {
  test('Game.fromJson should construct Game object with mock response', () {
    Game game = Game.fromJson(mockResponse['data']);

    expect(game, isNotNull);
    expect(game.title, equals('Super Smash Bros.'));
  });
}
