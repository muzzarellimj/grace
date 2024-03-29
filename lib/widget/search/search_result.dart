import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grace/model/material/book/search_result.dart';
import 'package:grace/model/material/game/search_result.dart';
import 'package:grace/model/material/material.dart';
import 'package:grace/model/material/movie/search_result.dart';
import 'package:grace/model/response/store_material.dart';
import 'package:grace/service/material_service.dart';

class SearchResult extends StatelessWidget {
  final Object mat;

  const SearchResult({super.key, required this.mat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(getContextualTitle()),
      subtitle: Text(getContextualSubtitle()),
      leading: Image.network(getContextualImageSrc()),
      onTap: () {
        storeMaterial().then((StoreMaterialResponse response) {
          GoRouter.of(context).pushNamed('/');
        });
      },
    );
  }

  String getContextualImageSrc() {
    switch (mat) {
      case BookSearchResult():
        return '';
      case GameSearchResult():
        return (mat as GameSearchResult).image;
      case MovieSearchResult():
        return (mat as MovieSearchResult).image;
      default:
        throw UnimplementedError();
    }
  }

  String getContextualTitle() {
    switch (mat) {
      case BookSearchResult():
        return (mat as BookSearchResult).title;
      case GameSearchResult():
        return (mat as GameSearchResult).title;
      case MovieSearchResult():
        return (mat as MovieSearchResult).title;
      default:
        throw UnimplementedError();
    }
  }

  String getContextualSubtitle() {
    switch (mat) {
      case BookSearchResult():
        return 'Book';
      case GameSearchResult():
        return 'Game';
      case MovieSearchResult():
        return 'Movie';
      default:
        throw UnimplementedError();
    }
  }

  Future<StoreMaterialResponse> storeMaterial() async {
    switch (mat) {
      case BookSearchResult():
        return await storeBook();
      case GameSearchResult():
        return await storeGame();
      case MovieSearchResult():
        return await storeMovie();
      default:
        throw UnimplementedError();
    }
  }

  Future<StoreMaterialResponse> storeBook() async {
    BookSearchResult book = mat as BookSearchResult;
    MaterialService service =
        MaterialService(material: MaterialDescriptor.book);

    StoreMaterialResponse response = await service.store(book.isbn13);

    return response;
  }

  Future<StoreMaterialResponse> storeGame() async {
    GameSearchResult game = mat as GameSearchResult;
    MaterialService service =
        MaterialService(material: MaterialDescriptor.game);

    StoreMaterialResponse response = await service.store(game.id.toString());

    return response;
  }

  Future<StoreMaterialResponse> storeMovie() async {
    MovieSearchResult movie = mat as MovieSearchResult;
    MaterialService service =
        MaterialService(material: MaterialDescriptor.movie);

    StoreMaterialResponse response = await service.store(movie.id.toString());

    return response;
  }
}
