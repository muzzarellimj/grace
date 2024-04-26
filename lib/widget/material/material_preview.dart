import 'package:flutter/material.dart';
import 'package:grace/model/material/book/book.dart';
import 'package:grace/model/material/game/game.dart';
import 'package:grace/model/material/movie/movie.dart';
import 'package:grace/service/authentication_service.dart';
import 'package:grace/service/library_service.dart';
import 'package:grace/theme/breakpoint.dart';
import 'package:grace/widget/material/material_preview_context.dart';

class MaterialPreview extends StatelessWidget {
  final AuthenticationService authenticationService;
  final LibraryService libraryService;
  final Object mat;

  const MaterialPreview({
    super.key,
    required this.authenticationService,
    required this.libraryService,
    required this.mat,
  });

  @override
  Widget build(BuildContext context) {
    Breakpoint breakpoint = Breakpoint.inRange(
      MediaQuery.of(context).size.width,
    );

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
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: Row(
          children: [
            Expanded(
              flex: breakpoint.isMobile(breakpoint) ? 1 : 2,
              child: FractionallySizedBox(
                heightFactor: 1.0,
                child: Image.network(
                  imageSrc,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: breakpoint.isMobile(breakpoint) ? 2 : 3,
              child: previewContext,
            )
          ],
        ),
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
      authenticationService: authenticationService,
      libraryService: libraryService,
      mat: book,
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
      authenticationService: authenticationService,
      libraryService: libraryService,
      mat: game,
      headline: game.title,
      attribution: game.studios.map((studio) => studio.name).join(', '),
      description: game.summary,
    );
  }

  Widget withMovie(BuildContext context) {
    Movie movie = mat as Movie;

    return MaterialPreviewContext(
      authenticationService: authenticationService,
      libraryService: libraryService,
      mat: movie,
      headline: movie.title,
      attribution: movie.productionCompanies
          .map((productionCompany) => productionCompany.name)
          .join(', '),
      description: movie.description,
    );
  }
}
