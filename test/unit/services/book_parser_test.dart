import 'package:grace/services/parsers/impl/book_parser.dart';
import 'package:test/test.dart';

void main() {
  test('parse should parse many-to-one maps with valid data', () {
    const edition = {
      "identifiers": {
        "goodreads": ["1507552"],
        "librarything": ["6446"]
      },
      "title": "Fantastic Mr. Fox",
      "authors": [
        {"key": "/authors/OL34184A"}
      ],
      "publish_date": "October 1, 1988",
      "publishers": ["Puffin"],
      "covers": [8739161],
      "contributions": ["Tony Ross (Illustrator)"],
      "languages": [
        {"key": "/languages/eng"}
      ],
      "source_records": [
        "promise:bwb_daily_pallets_2021-05-13:KP-140-654",
        "ia:fantasticmrfox00dahl_834",
        "marc:marc_openlibraries_sanfranciscopubliclibrary/sfpl_chq_2018_12_24_run02.mrc:85081404:4525",
        "amazon:0140328726",
        "bwb:9780140328721",
        "promise:bwb_daily_pallets_2021-04-19:KP-128-107",
        "promise:bwb_daily_pallets_2020-04-30:O6-BTK-941"
      ],
      "local_id": [
        "urn:bwbsku:KP-140-654",
        "urn:sfpl:31223064402481",
        "urn:sfpl:31223117624784",
        "urn:sfpl:31223113969183",
        "urn:sfpl:31223117624800",
        "urn:sfpl:31223113969225",
        "urn:sfpl:31223106484539",
        "urn:sfpl:31223117624792",
        "urn:sfpl:31223117624818",
        "urn:sfpl:31223117624768",
        "urn:sfpl:31223117624743",
        "urn:sfpl:31223113969209",
        "urn:sfpl:31223117624750",
        "urn:sfpl:31223117624727",
        "urn:sfpl:31223117624776",
        "urn:sfpl:31223117624719",
        "urn:sfpl:31223117624735",
        "urn:sfpl:31223113969241",
        "urn:bwbsku:KP-128-107",
        "urn:bwbsku:O6-BTK-941"
      ],
      "type": {"key": "/type/edition"},
      "first_sentence": {
        "type": "/type/text",
        "value": "Down in the valley there were three farms."
      },
      "key": "/books/OL7353617M",
      "number_of_pages": 96,
      "works": [
        {"key": "/works/OL45804W"}
      ],
      "classifications": {},
      "ocaid": "fantasticmrfoxpu00roal",
      "isbn_10": ["0140328726"],
      "isbn_13": ["9780140328721"],
      "latest_revision": 26,
      "revision": 26,
      "created": {
        "type": "/type/datetime",
        "value": "2008-04-29T13:35:46.876380"
      },
      "last_modified": {
        "type": "/type/datetime",
        "value": "2023-09-05T03:42:15.650938"
      }
    };
    const work = {
      "title": "Fantastic Mr Fox",
      "key": "/works/OL45804W",
      "authors": [
        {
          "author": {"key": "/authors/OL34184A"},
          "type": {"key": "/type/author_role"}
        }
      ],
      "type": {"key": "/type/work"},
      "description":
          "The main character of Fantastic Mr. Fox is an extremely clever anthropomorphized fox named Mr. Fox. He lives with his wife and four little foxes. In order to feed his family, he steals food from the cruel, brutish farmers named Boggis, Bunce, and Bean every night.\r\n\r\nFinally tired of being constantly outwitted by Mr. Fox, the farmers attempt to capture and kill him. The foxes escape in time by burrowing deep into the ground. The farmers decide to wait outside the hole for the foxes to emerge. Unable to leave the hole and steal food, Mr. Fox and his family begin to starve. Mr. Fox devises a plan to steal food from the farmers by tunneling into the ground and borrowing into the farmer's houses.\r\n\r\nAided by a friendly Badger, the animals bring the stolen food back and Mrs. Fox prepares a great celebratory banquet attended by the other starving animals and their families. Mr. Fox invites all the animals to live with him underground and says that he will provide food for them daily thanks to his underground passages. All the animals live happily and safely, while the farmers remain waiting outside in vain for Mr. Fox to show up.",
      "covers": [
        6498519,
        8904777,
        108274,
        233884,
        1119236,
        -1,
        10222599,
        10482837,
        3216657,
        10519563,
        10835922,
        10835924,
        10861366,
        10883671,
        8760472,
        12583098,
        10482548,
        10831929,
        10835926,
        12333895,
        12498647,
        7682784,
        12143357,
        12781739,
        3077458,
        13200133,
        13215770,
        13269612
      ],
      "subject_places": ["English countryside"],
      "subjects": [
        "Animals",
        "Hunger",
        "Open Library Staff Picks",
        "Juvenile fiction",
        "Children's stories, English",
        "Foxes",
        "Fiction",
        "Zorros",
        "Ficci\u00f3n juvenil",
        "Tunnels",
        "Interviews",
        "Farmers",
        "Children's stories",
        "Rats",
        "Welsh Authors",
        "English Authors",
        "Thieves",
        "Tricksters",
        "Badgers",
        "Children's fiction",
        "Foxes, fiction",
        "Underground",
        "Renards",
        "Romans, nouvelles, etc. pour la jeunesse",
        "Children's literature",
        "Plays",
        "Children's plays",
        "Children's stories, Welsh",
        "Agriculteurs",
        "Large type books",
        "Fantasy fiction",
        "Children's plays, English"
      ],
      "subject_people": ["Bean", "Boggis", "Bunce", "Mr Fox"],
      "subject_times": ["20th Century"],
      "location": "/works/OL45883W",
      "latest_revision": 18,
      "revision": 18,
      "created": {
        "type": "/type/datetime",
        "value": "2009-10-15T11:34:21.437031"
      },
      "last_modified": {
        "type": "/type/datetime",
        "value": "2023-10-20T13:54:24.645862"
      }
    };
    const authors = [
      {
        "bio":
            "Roald Dahl was a British novelist, short story writer, and screenwriter.\r\n\r\nBorn in north Cardiff, Wales, to Norwegian parents, Dahl served in the Royal Air Force during the Second World War, in which he became a flying ace and intelligence agent. He rose to prominence in the 1940s with works for both children and adults, and became one of the world's bestselling authors. His short stories are known for their unexpected endings, and his children's books for their unsentimental, often very dark humour. ([Source][1].)\r\n\r\n\r\n  [1]: http://en.wikipedia.org/wiki/Roald_Dahl",
        "remote_ids": {
          "viaf": "108159131",
          "wikidata": "Q25161",
          "isni": "0000000121468188"
        },
        "photos": [9395323, 9395316, 9395314, 9395313, 6287214],
        "key": "/authors/OL34184A",
        "alternate_names": ["ROALD. DAHL", "roald dahl"],
        "personal_name": "Dahl, Roald.",
        "links": [
          {
            "title": "roalddahl.com",
            "url": "http://www.roalddahl.com/",
            "type": {"key": "/type/link"}
          },
          {
            "title": "Wikipedia entry",
            "url": "http://en.wikipedia.org/wiki/Roald_Dahl",
            "type": {"key": "/type/link"}
          }
        ],
        "source_records": [
          "amazon:8420440248",
          "amazon:8420401307",
          "amazon:0670852503",
          "amazon:0140386068",
          "amazon:0140382518",
          "amazon:7533299299",
          "amazon:9026104618",
          "amazon:0141326182",
          "amazon:0141371439",
          "amazon:0141348364",
          "amazon:0670882976",
          "amazon:0141348348",
          "amazon:1760978302",
          "amazon:0141321954",
          "amazon:9877381915",
          "amazon:1849673241",
          "amazon:7533299272",
          "amazon:9877384167",
          "amazon:1844227251",
          "bwb:9780593528655",
          "amazon:8877820047",
          "amazon:1435255267",
          "amazon:7533299264",
          "amazon:0375814248",
          "amazon:0141352590",
          "amazon:0857551205",
          "promise:bwb_daily_pallets_2022-03-17",
          "amazon:8420466832",
          "amazon:9124079278",
          "promise:bwb_daily_pallets_2021-05-05",
          "amazon:2070501949",
          "amazon:207507559X",
          "promise:bwb_daily_pallets_2022-10-17:O8-AVA-886",
          "marc:marc_nuls/NULS_PHC_180925.mrc:121895425:782",
          "amazon:9026130554",
          "amazon:0141342315",
          "amazon:8419320404",
          "promise:bwb_daily_pallets_2023-05-01:W8-BMI-848",
          "promise:bwb_daily_pallets_2023-06-08:KS-566-239",
          "promise:bwb_daily_pallets_2023-07-11:W8-API-583"
        ],
        "type": {"key": "/type/author"},
        "name": "Roald Dahl",
        "latest_revision": 54,
        "revision": 54,
        "created": {
          "type": "/type/datetime",
          "value": "2008-04-01T03:28:50.625462"
        },
        "last_modified": {
          "type": "/type/datetime",
          "value": "2023-08-26T17:34:19.541672"
        }
      }
    ];

    BookParser parser = BookParser();

    var preparedData =
        parser.prepare(edition: edition, work: work, authors: authors);
    var parsedData = parser.parse(preparedData);

    expect(parsedData, isNotNull);
    expect(parsedData?['title'], equals('Fantastic Mr. Fox'));
    expect(parsedData?['authors'], contains('Roald Dahl'));
  });
}
