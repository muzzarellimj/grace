import 'package:grace/model/movie/movie.dart';
import 'package:test/test.dart';

const Map<String, dynamic> mockResponse = {
  "data": {
    "id": 2,
    "title": "Lilo & Stitch",
    "tagline": "There's one in every family.",
    "description":
        "As Stitch, a runaway genetic experiment from a faraway planet, wreaks havoc on the Hawaiian Islands, he becomes the mischievous adopted alien \"puppy\" of an independent little girl named Lilo and learns about loyalty, friendship, and ʻohana, the Hawaiian tradition of family.",
    "genres": [
      {"id": 1, "name": "Animation", "reference": 16},
      {"id": 3, "name": "Family", "reference": 10751}
    ],
    "production_companies": [
      {"id": 2, "name": "Walt Disney Pictures", "image": "", "reference": 2},
      {
        "id": 3,
        "name": "Walt Disney Feature Animation",
        "image": "/4UBohOtIr9DtxylH48Qsg6aDow6.png",
        "reference": 171656
      }
    ],
    "release_date": "2002-06-21",
    "runtime": 85,
    "image": "/m13Vbzv7R2GMAl3GXFrkmMEgCFQ.jpg",
    "reference": 11544
  },
  "status": 200
};

void main() {
  test('Movie.fromJson should construct Movie object with mock response', () {
    Movie movie = Movie.fromJson(mockResponse['data']);

    expect(movie, isNotNull);
    expect(movie.title, equals('Lilo & Stitch'));
  });
}
