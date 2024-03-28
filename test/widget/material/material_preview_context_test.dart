import 'package:flutter_test/flutter_test.dart';
import 'package:grace/model/material/book/author.dart';
import 'package:grace/model/material/book/book.dart';
import 'package:grace/model/material/book/publisher.dart';
import 'package:grace/model/material/book/topic.dart';
import 'package:grace/widget/material/material_preview_context.dart';

import '../material_app_container.dart';

Book mockBook = Book(
  id: 1,
  title: 'Fantastic Mr. Fox',
  subtitle: '',
  description:
      'The main character of Fantastic Mr. Fox is an extremely clever anthropomorphized fox named Mr. Fox. He lives with his wife and four little foxes. In order to feed his family, he steals food from the cruel, brutish farmers named Boggis, Bunce, and Bean every night. Finally tired of being constantly outwitted by Mr. Fox, the farmers attempt to capture and kill him. The foxes escape in time by burrowing deep into the ground. The farmers decide to wait outside the hole for the foxes to emerge. Unable to leave the hole and steal food, Mr. Fox and his family begin to starve. Mr. Fox devises a plan to steal food from the farmers by tunneling into the ground and borrowing into the farmer\'s houses. Aided by a friendly Badger, the animals bring the stolen food back and Mrs. Fox prepares a great celebratory banquet attended by the other starving animals and their families. Mr. Fox invites all the animals to live with him underground and says that he will provide food for them daily thanks to his underground passages. All the animals live happily and safely, while the farmers remain waiting outside in vain for Mr. Fox to show up.',
  authors: List.from([
    BookAuthor(
        id: 1,
        firstName: 'Roald',
        middleName: '',
        lastName: 'Dahl',
        biography:
            'The main character of Fantastic Mr. Fox is an extremely clever anthropomorphized fox named Mr. Fox. He lives with his wife and four little foxes. In order to feed his family, he steals food from the cruel, brutish farmers named Boggis, Bunce, and Bean every night. Finally tired of being constantly outwitted by Mr. Fox, the farmers attempt to capture and kill him. The foxes escape in time by burrowing deep into the ground. The farmers decide to wait outside the hole for the foxes to emerge. Unable to leave the hole and steal food, Mr. Fox and his family begin to starve. Mr. Fox devises a plan to steal food from the farmers by tunneling into the ground and borrowing into the farmer\'s houses. Aided by a friendly Badger, the animals bring the stolen food back and Mrs. Fox prepares a great celebratory banquet attended by the other starving animals and their families. Mr. Fox invites all the animals to live with him underground and says that he will provide food for them daily thanks to his underground passages. All the animals live happily and safely, while the farmers remain waiting outside in vain for Mr. Fox to show up.',
        image: 'https://covers.openlibrary.org/a/olid/OL34184A-L.jpg',
        reference: 'OL34184A')
  ]),
  publishers: List.from([
    BookPublisher(id: 1, name: 'Puffin'),
  ]),
  topics: List.from([
    BookTopic(id: 1, name: 'Juvenille Fiction'),
  ]),
  publishDate: 591667200,
  pages: 96,
  isbn10: '0140328726',
  isbn13: '9780140328721',
  image: 'https://covers.openlibrary.org/b/olid/OL7353617M-L.jpg',
  editionReference: 'OL7353617M',
  workReference: 'OL45804W',
);

void main() {
  testWidgets('MaterialProviderContext should render with three Text widgets',
      (tester) async {
    await tester.pumpWidget(
      MaterialAppContainer(
        child: MaterialPreviewContext(
          headline: mockBook.title,
          attribution: mockBook.authors
              .map((author) => '${author.firstName} ${author.lastName}')
              .join(', '),
          description: mockBook.description,
        ),
      ),
    );

    final headlineFinder = find.text('Fantastic Mr. Fox');
    final attributionFinder = find.text('Roald Dahl');
    final descriptionFinder = find.text(
        'The main character of Fantastic Mr. Fox is an extremely clever anthropomorphized fox named Mr. Fox. He lives with his wife and four little foxes. In order to feed his family, he steals food from the cruel, brutish farmers named Boggis, Bunce, and Bean every night. Finally tired of being constantly outwitted by Mr. Fox, the farmers attempt to capture and kill him. The foxes escape in time by burrowing deep into the ground. The farmers decide to wait outside the hole for the foxes to emerge. Unable to leave the hole and steal food, Mr. Fox and his family begin to starve. Mr. Fox devises a plan to steal food from the farmers by tunneling into the ground and borrowing into the farmer\'s houses. Aided by a friendly Badger, the animals bring the stolen food back and Mrs. Fox prepares a great celebratory banquet attended by the other starving animals and their families. Mr. Fox invites all the animals to live with him underground and says that he will provide food for them daily thanks to his underground passages. All the animals live happily and safely, while the farmers remain waiting outside in vain for Mr. Fox to show up.');

    expect(headlineFinder, findsOneWidget);
    expect(attributionFinder, findsOneWidget);
    expect(descriptionFinder, findsOneWidget);
  });
}
