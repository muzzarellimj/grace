import 'package:grace/model/material/movie/movie.dart';

class MovieUpdate {
  int id;
  String title;
  String tagline;
  String description;
  int releaseDate;
  int runtime;
  String image;
  int reference;

  MovieUpdate({
    required this.id,
    required this.title,
    required this.tagline,
    required this.description,
    required this.releaseDate,
    required this.runtime,
    required this.image,
    required this.reference,
  });

  factory MovieUpdate.fromMovie(Movie movie) {
    return MovieUpdate(
      id: movie.id,
      title: movie.title,
      tagline: movie.tagline,
      description: movie.description,
      releaseDate: movie.releaseDate,
      runtime: movie.runtime,
      image: movie.image,
      reference: movie.reference,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'tagline': tagline,
        'description': description,
        'release_date': releaseDate,
        'runtime': runtime,
        'image': image,
        'reference': reference,
      };
}
