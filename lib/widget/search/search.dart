import 'package:flutter/material.dart';
import 'package:grace/model/material/material.dart';
import 'package:grace/model/response/get_material_set.dart';
import 'package:grace/model/response/response_status.dart';
import 'package:grace/service/material_service.dart';
import 'package:grace/widget/search/search_result.dart';

class Search extends StatelessWidget {
  const Search({super.key});

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
              if (snapshot.connectionState == ConnectionState.done) {
                List<Object> results = snapshot.data;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: results.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SearchResult(mat: results[index]);
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

    GetMaterialSetResponse bookResponse =
        await MaterialService(material: MaterialDescriptor.book).search(value);

    GetMaterialSetResponse gameResponse =
        await MaterialService(material: MaterialDescriptor.game).search(value);

    GetMaterialSetResponse movieResponse =
        await MaterialService(material: MaterialDescriptor.movie).search(value);

    // when a matching book has been found, return it and only it
    if (bookResponse.status == ResponseStatus.success) {
      results.add(bookResponse.materials?.first);

      // otherwise show game and movie results, three each maximum
    } else {
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
    }

    return results;
  }
}
