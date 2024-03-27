import 'package:grace/model/material/movie/genre.dart';
import 'package:grace/model/material/movie/production_company.dart';

class Movie {
  int id;
  String title;
  String tagline;
  String description;
  List<MovieGenre> genres;
  List<MovieProductionCompany> productionCompanies;
  int releaseDate;
  int runtime;
  String image;
  int reference;

  Movie({
    required this.id,
    required this.title,
    required this.tagline,
    required this.description,
    required this.genres,
    required this.productionCompanies,
    required this.releaseDate,
    required this.runtime,
    required this.image,
    required this.reference,
  });

  factory Movie.fromJson(Map<String, dynamic> input) {
    List<MovieGenre> genres = (input['genres'] as List)
        .map((genre) => MovieGenre.fromJson(genre))
        .toList();

    List<MovieProductionCompany> productionCompanies =
        (input['production_companies'] as List)
            .map((company) => MovieProductionCompany.fromJson(company))
            .toList();

    return Movie(
      id: input['id'],
      title: input['title'],
      tagline: input['tagline'],
      description: input['description'],
      genres: genres,
      productionCompanies: productionCompanies,
      releaseDate: input['release_date'],
      runtime: input['runtime'],
      image: input['image'],
      reference: input['reference'],
    );
  }
}
