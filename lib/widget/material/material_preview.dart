import 'package:flutter/material.dart';
import 'package:grace/model/material/book/book.dart';
import 'package:grace/model/material/game/game.dart';
import 'package:grace/model/material/movie/movie.dart';
import 'package:grace/widget/material/material_preview_context.dart';

class MaterialPreview extends StatelessWidget {
  final Object mat;

  const MaterialPreview({super.key, required this.mat});

  @override
  Widget build(BuildContext context) {
    String imageSrc = getImageSrc();
    Widget previewContext = getMaterialPreviewContext(context);

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: Theme.of(context).canvasColor),
      ),
      elevation: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      semanticContainer: true,
      child: Row(
        children: [
          Expanded(
            flex: MediaQuery.of(context).size.width > 450 ? 2 : 1,
            child: FractionallySizedBox(
              heightFactor: 1.0,
              child: Image.network(
                imageSrc,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: MediaQuery.of(context).size.width > 450 ? 3 : 2,
            child: previewContext,
          )
        ],
      ),
    );
  }

  String getImageSrc() {
    switch (mat) {
      case Book():
        return (mat as Book).image;
      case Game():
        return (mat as Game).image;
      case Movie():
        return (mat as Movie).image;
      default:
        throw UnimplementedError();
    }
  }

  Widget getMaterialPreviewContext(BuildContext context) {
    switch (mat) {
      case Book():
        return withBook(context);
      case Game():
        return withGame(context);
      case Movie():
        return withMovie(context);
      default:
        throw UnimplementedError();
    }
  }

  Widget withBook(BuildContext context) {
    Book book = mat as Book;

    return MaterialPreviewContext(
      headline: book.title,
      attribution: book.authors
          .map((author) => '${author.firstName} ${author.lastName}')
          .join(', '),
      description: book.description,
    );
  }

  Widget withGame(BuildContext context) {
    Game game = mat as Game;

    return MaterialPreviewContext(
      headline: game.title,
      attribution: game.studios.map((studio) => studio.name).join(', '),
      description: game.summary,
    );
  }

  Widget withMovie(BuildContext context) {
    Movie movie = mat as Movie;

    return MaterialPreviewContext(
      headline: movie.title,
      attribution: movie.productionCompanies
          .map((productionCompany) => productionCompany.name)
          .join(', '),
      description: movie.description,
    );
  }
}
