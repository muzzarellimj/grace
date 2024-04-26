import 'package:flutter/material.dart';
import 'package:grace/model/material/book/book.dart';
import 'package:grace/model/material/game/game.dart';
import 'package:grace/model/material/movie/movie.dart';
import 'package:grace/service/authentication_service.dart';
import 'package:grace/service/library_service.dart';
import 'package:grace/widget/material/impl/book_overview.dart';
import 'package:grace/widget/material/impl/game_overview.dart';
import 'package:grace/widget/material/impl/movie_overview.dart';

class MaterialOverview extends StatefulWidget {
  final AuthenticationService authenticationService;
  final LibraryService libraryService;
  final Object mat;

  const MaterialOverview({
    super.key,
    required this.authenticationService,
    required this.libraryService,
    required this.mat,
  });

  @override
  State<MaterialOverview> createState() => MaterialOverviewState();
}

class MaterialOverviewState extends State<MaterialOverview> {
  @override
  Widget build(BuildContext context) {
    switch (widget.mat) {
      case Book():
        return BookOverview(
          authenticationService: widget.authenticationService,
          libraryService: widget.libraryService,
          mat: widget.mat as Book,
        );

      case Game():
        return GameOverview(
          authenticationService: widget.authenticationService,
          libraryService: widget.libraryService,
          mat: widget.mat as Game,
        );

      case Movie():
        return MovieOverview(
          authenticationService: widget.authenticationService,
          libraryService: widget.libraryService,
          mat: widget.mat as Movie,
        );

      default:
        throw UnsupportedError(
          'Unsupported material overview "${widget.mat.runtimeType}".',
        );
    }
  }
}
