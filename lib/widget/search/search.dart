import 'package:flutter/material.dart';
import 'package:grace/model/material/material_descriptor.dart';
import 'package:grace/model/response/get_material.dart';
import 'package:grace/model/response/response_status.dart';
import 'package:grace/service/authentication_service.dart';
import 'package:grace/service/library_service.dart';
import 'package:grace/service/material_service.dart';
import 'package:grace/widget/search/search_result.dart';

class Search extends StatefulWidget {
  final AuthenticationService authenticationService;
  final LibraryService libraryService;

  const Search({
    super.key,
    required this.authenticationService,
    required this.libraryService,
  });

  @override
  State<StatefulWidget> createState() => SearchState();
}

class SearchState extends State<Search> {
  late Future<List<Object>> results;

  @override
  void initState() {
    super.initState();

    results = Future(() => []);
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      viewBackgroundColor: Theme.of(context).canvasColor,
      viewElevation: 0,
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          hintText: 'Search...',
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => Theme.of(context).canvasColor),
          elevation: MaterialStateProperty.resolveWith((states) => 0),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          onSubmitted: (_) {
            controller.openView();
          },
          leading: const Icon(Icons.search),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return [
          FutureBuilder(
            future: execute(controller.text),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.connectionState == ConnectionState.done) {
                List<Object> results = snapshot.data;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: results.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SearchResult(
                      authenticationService: widget.authenticationService,
                      libraryService: widget.libraryService,
                      mat: results[index],
                    );
                  },
                );
              }
              return const LinearProgressIndicator();
            },
          ),
        ];
      },
    );
  }

  Future<List<Object>> execute(String value) async {
    List<Object> results = List.empty(growable: true);

    GetMaterialResponse bookResponse =
        await MaterialService(descriptor: MaterialDescriptor.book)
            .search(value);

    GetMaterialResponse gameResponse =
        await MaterialService(descriptor: MaterialDescriptor.game)
            .search(value);

    GetMaterialResponse movieResponse =
        await MaterialService(descriptor: MaterialDescriptor.movie)
            .search(value);

    if (bookResponse.status == ResponseStatus.success &&
        bookResponse.materials != null) {
      if (bookResponse.materials!.length > 3) {
        bookResponse.materials = bookResponse.materials!.sublist(0, 3);
      }

      results = [...results, ...bookResponse.materials!];
    }

    if (gameResponse.status == ResponseStatus.success &&
        gameResponse.materials != null) {
      if (gameResponse.materials!.length > 3) {
        gameResponse.materials = gameResponse.materials!.sublist(0, 3);
      }

      results = [...results, ...gameResponse.materials!];
    }

    if (movieResponse.status == ResponseStatus.success &&
        movieResponse.materials != null) {
      if (movieResponse.materials!.length > 3) {
        movieResponse.materials = movieResponse.materials!.sublist(0, 3);
      }

      results = [...results, ...movieResponse.materials!];
    }

    return results;
  }
}
