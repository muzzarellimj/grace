import 'package:flutter/material.dart';
import 'package:grace/model/material/book/book.dart';
import 'package:grace/model/material/game/game.dart';
import 'package:grace/model/material/material_descriptor.dart';
import 'package:grace/model/material/movie/movie.dart';
import 'package:grace/model/response/get_library.dart';
import 'package:grace/model/response/get_material.dart';
import 'package:grace/model/response/response_status.dart';
import 'package:grace/service/authentication_service.dart';
import 'package:grace/service/library_service.dart';
import 'package:grace/service/material_service.dart';
import 'package:grace/theme/breakpoint.dart';
import 'package:grace/theme/format.dart';
import 'package:grace/theme/measurement.dart';
import 'package:grace/widget/material/material_preview.dart';
import 'package:grace/widget/search/search.dart';

class LibraryScreen extends StatefulWidget {
  final AuthenticationService authenticationService;
  final LibraryService libraryService = LibraryService();

  LibraryScreen({
    super.key,
    required this.authenticationService,
  });

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final double minimumWidgetWidth = 392.0;

  String? message;
  List<Book> books = [];
  List<Game> games = [];
  List<Movie> movies = [];

  @override
  Widget build(BuildContext context) {
    Breakpoint breakpoint = Breakpoint.inRange(
      MediaQuery.of(context).size.width,
    );

    return Container(
      padding: EdgeInsets.all(Measurement.getSpacing(
        breakpoint.isMobile(breakpoint) ? 2.0 : 4.0,
      )),
      child: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (
            BuildContext context,
            bool innerBoxIsScrolled,
          ) {
            return [
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
                ),
                sliver: SliverAppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: Padding(
                    padding: EdgeInsets.only(
                      bottom: Measurement.getSpacing(2.0),
                    ),
                    child: Search(
                      authenticationService: widget.authenticationService,
                      libraryService: widget.libraryService,
                    ),
                  ),
                  leadingWidth: MediaQuery.of(context).size.width,
                  pinned: true,
                  bottom: TabBar(
                    indicatorColor: Theme.of(context).primaryColor,
                    labelColor: Theme.of(context).primaryColor,
                    overlayColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).primaryColorLight,
                    ),
                    unselectedLabelColor: Theme.of(context).primaryColor,
                    tabs: const [
                      Tab(icon: Icon(Icons.menu_book)),
                      Tab(icon: Icon(Icons.videogame_asset)),
                      Tab(icon: Icon(Icons.movie)),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              buildTabContent(breakpoint, 'books', books),
              buildTabContent(breakpoint, 'games', games),
              buildTabContent(breakpoint, 'movies', movies),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabContent(
    Breakpoint breakpoint,
    String title,
    List<Object> materials,
  ) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            key: PageStorageKey<String>(title),
            slivers: [
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: Measurement.getSpacing(2.0)),
              ),
              materials.isEmpty
                  ? SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'Awfully quiet here...',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    )
                  : SliverGrid.count(
                      crossAxisCount: Format.intOrOne(
                        MediaQuery.of(context).size.width ~/ minimumWidgetWidth,
                      ),
                      mainAxisSpacing: Measurement.getSpacing(2.0),
                      crossAxisSpacing: Measurement.getSpacing(2.0),
                      childAspectRatio: 1.5,
                      children: List<Widget>.generate(
                        materials.length,
                        (index) {
                          return MaterialPreview(
                            authenticationService: widget.authenticationService,
                            libraryService: widget.libraryService,
                            mat: materials[index],
                          );
                        },
                      ),
                    )
            ],
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    init().then((_) {});
  }

  Future<void> init() async {
    GetLibraryResponse response = await widget.libraryService.fetch(
      widget.authenticationService.id,
    );

    if (response.status != ResponseStatus.success) {
      message = response.message;

      return;
    }

    List<Book> bookSet =
        await fetchIdSet(MaterialDescriptor.book, response.books ?? []);
    List<Game> gameSet =
        await fetchIdSet(MaterialDescriptor.game, response.games ?? []);
    List<Movie> movieSet =
        await fetchIdSet(MaterialDescriptor.movie, response.movies ?? []);

    setState(() {
      books = bookSet;
      games = gameSet;
      movies = movieSet;
    });
  }

  Future<List<Object>> fetchIdSet<Object>(
    MaterialDescriptor descriptor,
    List<int> idSet,
  ) async {
    GetMaterialResponse response =
        await MaterialService(descriptor: descriptor).fetchMany(idSet);

    if (response.status != ResponseStatus.success ||
        response.materials == null) {
      return [];
    }

    return response.materials!.cast<Object>();
  }
}
