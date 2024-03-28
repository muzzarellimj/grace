import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grace/model/material/book/book.dart';
import 'package:grace/model/material/game/game.dart';
import 'package:grace/model/material/movie/movie.dart';
import 'package:grace/widget/material/material_preview.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../material_app_container.dart';

Book mockBook = Book.fromJson({
  "id": 1,
  "title": "Fantastic Mr. Fox",
  "subtitle": "",
  "description":
      "The main character of Fantastic Mr. Fox is an extremely clever anthropomorphized fox named Mr. Fox. He lives with his wife and four little foxes. In order to feed his family, he steals food from the cruel, brutish farmers named Boggis, Bunce, and Bean every night. Finally tired of being constantly outwitted by Mr. Fox, the farmers attempt to capture and kill him. The foxes escape in time by burrowing deep into the ground. The farmers decide to wait outside the hole for the foxes to emerge. Unable to leave the hole and steal food, Mr. Fox and his family begin to starve. Mr. Fox devises a plan to steal food from the farmers by tunneling into the ground and borrowing into the farmer's houses. Aided by a friendly Badger, the animals bring the stolen food back and Mrs. Fox prepares a great celebratory banquet attended by the other starving animals and their families. Mr. Fox invites all the animals to live with him underground and says that he will provide food for them daily thanks to his underground passages. All the animals live happily and safely, while the farmers remain waiting outside in vain for Mr. Fox to show up.",
  "authors": [
    {
      "id": 1,
      "first_name": "Roald",
      "middle_name": "",
      "last_name": "Dahl",
      "biography":
          "Roald Dahl was a British novelist, short story writer, and screenwriter. Born in north Cardiff, Wales, to Norwegian parents, Dahl served in the Royal Air Force during the Second World War, in which he became a flying ace and intelligence agent. He rose to prominence in the 1940s with works for both children and adults, and became one of the world's bestselling authors. His short stories are known for their unexpected endings, and his children's books for their unsentimental, often very dark humour.",
      "image": "https://covers.openlibrary.org/a/olid/OL34184A-L.jpg",
      "reference": "OL34184A"
    }
  ],
  "publishers": [
    {"id": 1, "name": "Puffin"}
  ],
  "topics": [
    {"id": 1, "name": "Juvenile fiction"},
  ],
  "publish_date": 591667200,
  "pages": 96,
  "isbn10": "0140328726",
  "isbn13": "9780140328721",
  "image": "https://covers.openlibrary.org/b/olid/OL7353617M-L.jpg",
  "edition_reference": "OL7353617M",
  "work_reference": "OL45804W"
});

Game mockGame = Game.fromJson({
  "id": 1,
  "title": "Super Smash Bros.",
  "summary":
      "Super Smash Bros. is a crossover fighting video game between several different Nintendo franchises, and the first installment in the Super Smash Bros. series. Players must defeat their opponents multiple times in a fighting frenzy of items and power-ups. Super Smash Bros. is a departure from the general genre of fighting games: instead of depleting an opponent's life bar, the players seek to knock opposing characters off a stage. Each player has a damage total, represented by a percentage, which rises as the damage is taken.",
  "storyline": "",
  "franchises": [
    {"id": 1, "name": "Super Smash Bros.", "reference": 1787},
  ],
  "genres": [
    {"id": 1, "name": "Fighting", "reference": 4},
  ],
  "platforms": [
    {"id": 1, "name": "Nintendo 64", "reference": 4},
  ],
  "studios": [
    {
      "id": 1,
      "name": "HAL Laboratory",
      "description":
          "HAL Laboratory is a Japanese game developer partnered with Nintendo. It was founded by a small group of friends who shared the desire to create games, and among said group was Satoru Iwata. The group developed games for numerous platforms at first before developing exclusively for Nintendo. The name HAL originates from the fictional computer HAL 9000 from 2001: A Space Odyssey, as well as each letter being one letter before IBM. HAL Laboratory is most notable for developing the Kirby series created by ex-employee Masahiro Sakurai, they are also responsible for the Super Smash Bros. and the EarthBound series.",
      "reference": 762
    }
  ],
  "release_date": 916876800,
  "image": "https://images.igdb.com/igdb/image/upload/t_cover_big/co2tso.jpg",
  "reference": 1626
});

Movie mockMovie = Movie.fromJson({
  "id": 1,
  "title": "Lilo & Stitch",
  "tagline": "There's one in every family.",
  "description":
      "As Stitch, a runaway genetic experiment from a faraway planet, wreaks havoc on the Hawaiian Islands, he becomes the mischievous adopted alien \"puppy\" of an independent little girl named Lilo and learns about loyalty, friendship, and ʻohana, the Hawaiian tradition of family.",
  "genres": [
    {"id": 1, "name": "Animation", "reference": 16},
  ],
  "production_companies": [
    {"id": 1, "name": "Walt Disney Pictures", "image": "", "reference": 2},
  ],
  "release_date": 1024617600,
  "runtime": 85,
  "image":
      "https://image.tmdb.org/t/p/original/m13Vbzv7R2GMAl3GXFrkmMEgCFQ.jpg",
  "reference": 11544
});

Object mockObject = Object;

void main() {
  testWidgets('MaterialPreview should process Book by .withBook()',
      (tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialAppContainer(
          child: MaterialPreview(mat: mockBook),
        ),
      );

      final headlineFinder = find.text('Fantastic Mr. Fox');
      final attributionFinder = find.text('Roald Dahl');
      final descriptionFinder = find.text(
          'The main character of Fantastic Mr. Fox is an extremely clever anthropomorphized fox named Mr. Fox. He lives with his wife and four little foxes. In order to feed his family, he steals food from the cruel, brutish farmers named Boggis, Bunce, and Bean every night. Finally tired of being constantly outwitted by Mr. Fox, the farmers attempt to capture and kill him. The foxes escape in time by burrowing deep into the ground. The farmers decide to wait outside the hole for the foxes to emerge. Unable to leave the hole and steal food, Mr. Fox and his family begin to starve. Mr. Fox devises a plan to steal food from the farmers by tunneling into the ground and borrowing into the farmer\'s houses. Aided by a friendly Badger, the animals bring the stolen food back and Mrs. Fox prepares a great celebratory banquet attended by the other starving animals and their families. Mr. Fox invites all the animals to live with him underground and says that he will provide food for them daily thanks to his underground passages. All the animals live happily and safely, while the farmers remain waiting outside in vain for Mr. Fox to show up.');

      expect(
          find.image(const NetworkImage(
              'https://covers.openlibrary.org/b/olid/OL7353617M-L.jpg')),
          findsOneWidget);
      expect(headlineFinder, findsOneWidget);
      expect(attributionFinder, findsOneWidget);
      expect(descriptionFinder, findsOneWidget);
    });
  });

  testWidgets('MaterialPreview should process Game by .withGame()',
      (tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialAppContainer(
          child: MaterialPreview(mat: mockGame),
        ),
      );

      final headlineFinder = find.text('Super Smash Bros.');
      final attributionFinder = find.text('HAL Laboratory');
      final descriptionFinder = find.text(
          'Super Smash Bros. is a crossover fighting video game between several different Nintendo franchises, and the first installment in the Super Smash Bros. series. Players must defeat their opponents multiple times in a fighting frenzy of items and power-ups. Super Smash Bros. is a departure from the general genre of fighting games: instead of depleting an opponent\'s life bar, the players seek to knock opposing characters off a stage. Each player has a damage total, represented by a percentage, which rises as the damage is taken.');

      expect(
          find.image(const NetworkImage(
              'https://images.igdb.com/igdb/image/upload/t_cover_big/co2tso.jpg')),
          findsOneWidget);
      expect(headlineFinder, findsOneWidget);
      expect(attributionFinder, findsOneWidget);
      expect(descriptionFinder, findsOneWidget);
    });
  });

  testWidgets('MaterialPreview should process Movie by .withMovie()',
      (tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialAppContainer(
          child: MaterialPreview(mat: mockMovie),
        ),
      );

      final headlineFinder = find.text('Lilo & Stitch');
      final attributionFinder = find.text('Walt Disney Pictures');
      final descriptionFinder = find.text(
          'As Stitch, a runaway genetic experiment from a faraway planet, wreaks havoc on the Hawaiian Islands, he becomes the mischievous adopted alien \"puppy\" of an independent little girl named Lilo and learns about loyalty, friendship, and ʻohana, the Hawaiian tradition of family.');

      expect(
          find.image(const NetworkImage(
              'https://image.tmdb.org/t/p/original/m13Vbzv7R2GMAl3GXFrkmMEgCFQ.jpg')),
          findsOneWidget);
      expect(headlineFinder, findsOneWidget);
      expect(attributionFinder, findsOneWidget);
      expect(descriptionFinder, findsOneWidget);
    });
  });

  testWidgets(
      'MaterialPreview should throw UnimplementedError with unsupported Object',
      (tester) async {
    await tester.pumpWidget(
      MaterialAppContainer(
        child: MaterialPreview(mat: mockObject),
      ),
    );

    expect(tester.takeException(), isInstanceOf<UnimplementedError>());
  });
}
