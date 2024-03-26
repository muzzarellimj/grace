import 'package:grace/model/book/book.dart';
import 'package:test/test.dart';

const Map<String, dynamic> mockResponse = {
  "data": {
    "id": 2,
    "title": "Fantastic Mr. Fox",
    "subtitle": "",
    "description":
        "The main character of Fantastic Mr. Fox is an extremely clever anthropomorphized fox named Mr. Fox. He lives with his wife and four little foxes. In order to feed his family, he steals food from the cruel, brutish farmers named Boggis, Bunce, and Bean every night.\r\n\r\nFinally tired of being constantly outwitted by Mr. Fox, the farmers attempt to capture and kill him. The foxes escape in time by burrowing deep into the ground. The farmers decide to wait outside the hole for the foxes to emerge. Unable to leave the hole and steal food, Mr. Fox and his family begin to starve. Mr. Fox devises a plan to steal food from the farmers by tunneling into the ground and borrowing into the farmer's houses.\r\n\r\nAided by a friendly Badger, the animals bring the stolen food back and Mrs. Fox prepares a great celebratory banquet attended by the other starving animals and their families. Mr. Fox invites all the animals to live with him underground and says that he will provide food for them daily thanks to his underground passages. All the animals live happily and safely, while the farmers remain waiting outside in vain for Mr. Fox to show up.",
    "authors": [
      {
        "id": 2,
        "first_name": "Roald",
        "middle_name": "",
        "last_name": "Dahl",
        "biography":
            "Roald Dahl was a British novelist, short story writer, and screenwriter.\r\n\r\nBorn in north Cardiff, Wales, to Norwegian parents, Dahl served in the Royal Air Force during the Second World War, in which he became a flying ace and intelligence agent. He rose to prominence in the 1940s with works for both children and adults, and became one of the world's bestselling authors. His short stories are known for their unexpected endings, and his children's books for their unsentimental, often very dark humour. ([Source][1].)\r\n\r\n\r\n  [1]: http://en.wikipedia.org/wiki/Roald_Dahl",
        "image": "9395323",
        "reference": "/authors/OL34184A"
      }
    ],
    "publishers": [
      {"id": 2, "name": "Puffin"}
    ],
    "topics": [
      {"id": 3, "name": "Animals"},
      {"id": 4, "name": "Hunger"},
      {"id": 5, "name": "Open Library Staff Picks"},
      {"id": 6, "name": "Juvenile fiction"},
      {"id": 7, "name": "Children's stories, English"},
      {"id": 8, "name": "Foxes"},
      {"id": 1, "name": "Fiction"},
      {"id": 9, "name": "Zorros"},
      {"id": 10, "name": "Ficción juvenil"},
      {"id": 11, "name": "Tunnels"},
      {"id": 12, "name": "Interviews"},
      {"id": 13, "name": "Farmers"},
      {"id": 14, "name": "Children's stories"},
      {"id": 15, "name": "Rats"},
      {"id": 16, "name": "Welsh Authors"},
      {"id": 17, "name": "English Authors"},
      {"id": 18, "name": "Thieves"},
      {"id": 19, "name": "Tricksters"},
      {"id": 20, "name": "Badgers"},
      {"id": 21, "name": "Children's fiction"},
      {"id": 22, "name": "Foxes, fiction"},
      {"id": 23, "name": "Underground"},
      {"id": 24, "name": "Renards"},
      {"id": 25, "name": "Romans, nouvelles, etc. pour la jeunesse"},
      {"id": 26, "name": "Children's literature"},
      {"id": 27, "name": "Plays"},
      {"id": 28, "name": "Children's plays"},
      {"id": 29, "name": "Children's stories, Welsh"},
      {"id": 30, "name": "Agriculteurs"},
      {"id": 31, "name": "Fantasy fiction"},
      {"id": 32, "name": "Children's plays, English"}
    ],
    "publish_date": "October 1, 1988",
    "pages": 96,
    "isbn10": "0140328726",
    "isbn13": "9780140328721",
    "image": "https://covers.openlibrary.org/b/olid/OL7353617M-L.jpg",
    "edition_reference": "OL7353617M",
    "work_reference": "OL45804W"
  },
  "status": 200
};

void main() {
  test('Book.fromJson should construct Book object with mock response', () {
    Book book = Book.fromJson(mockResponse['data']);

    expect(book, isNotNull);
    expect(book.title, equals('Fantastic Mr. Fox'));
    expect(book.isbn13, equals('9780140328721'));
  });
}
