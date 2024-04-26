import 'package:flutter/material.dart';
import 'package:grace/model/material/book/search_result.dart';
import 'package:grace/model/material/game/search_result.dart';
import 'package:grace/model/material/material_descriptor.dart';
import 'package:grace/model/material/movie/search_result.dart';
import 'package:grace/model/response/response_status.dart';
import 'package:grace/model/response/store_material.dart';
import 'package:grace/service/authentication_service.dart';
import 'package:grace/service/library_service.dart';
import 'package:grace/service/material_service.dart';
import 'package:grace/widget/toast/toast.dart';

class SearchResult extends StatelessWidget {
  final AuthenticationService authenticationService;
  final LibraryService libraryService;
  final Object mat;

  const SearchResult({
    super.key,
    required this.authenticationService,
    required this.libraryService,
    required this.mat,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(getContextualTitle()),
      subtitle: Text(getContextualSubtitle()),
      leading: Image.network(getContextualImageSrc()),
      onTap: () async {
        StoreMaterialResponse response =
            await MaterialService(descriptor: getContextualMaterialDescriptor())
                .storeOne(getContextualMaterialId());

        if (response.status != ResponseStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
              Toast.failure(context, response.message!).asSnackbar());

          return;
        }

        await libraryService.store(authenticationService.id,
            getContextualMaterialDescriptor(), response.id!);

        ScaffoldMessenger.of(context).showSnackBar(Toast.success(context,
                '${getContextualTitle()} has been added to your collection! You may need to refresh your collection to see it.')
            .asSnackbar());
      },
    );
  }

  String getContextualMaterialId() {
    switch (mat) {
      case BookSearchResult():
        return (mat as BookSearchResult).id;
      case GameSearchResult():
        return (mat as GameSearchResult).id.toString();
      case MovieSearchResult():
        return (mat as MovieSearchResult).id.toString();
      default:
        throw UnimplementedError();
    }
  }

  String getContextualImageSrc() {
    switch (mat) {
      case BookSearchResult():
        return (mat as BookSearchResult).image;
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

  MaterialDescriptor getContextualMaterialDescriptor() {
    switch (mat) {
      case BookSearchResult():
        return MaterialDescriptor.book;
      case GameSearchResult():
        return MaterialDescriptor.game;
      case MovieSearchResult():
        return MaterialDescriptor.movie;
      default:
        throw UnimplementedError();
    }
  }
}
