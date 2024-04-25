import 'package:flutter/material.dart';
import 'package:grace/model/material/book/book.dart';
import 'package:grace/model/material/game/game.dart';
import 'package:grace/model/material/material_descriptor.dart';
import 'package:grace/model/material/movie/movie.dart';
import 'package:grace/model/response/get_material.dart';
import 'package:grace/model/response/response_status.dart';
import 'package:grace/service/authentication_service.dart';
import 'package:grace/service/material_service.dart';
import 'package:grace/theme/measurement.dart';
import 'package:grace/widget/collection/collection.dart';

class HomeScreen extends StatefulWidget {
  final List<int> recentIdSet =
      List.generate(1000, (index) => index + 1).reversed.toList();

  final AuthenticationService authenticationService;

  HomeScreen({
    super.key,
    required this.authenticationService,
  });

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Book> books = [];
  List<Game> games = [];
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();

    init().then(
      (value) {},
    );
  }

  Future<void> init() async {
    List<Book> recentBookSet =
        await getRecentMaterialSet<Book>(MaterialDescriptor.book);

    List<Game> recentGameSet =
        await getRecentMaterialSet<Game>(MaterialDescriptor.game);

    List<Movie> recentMovieSet =
        await getRecentMaterialSet<Movie>(MaterialDescriptor.movie);

    setState(() {
      books = recentBookSet;
      games = recentGameSet;
      movies = recentMovieSet;
    });
  }

  Future<List<M>> getRecentMaterialSet<M>(MaterialDescriptor descriptor) async {
    GetMaterialResponse response =
        await MaterialService(descriptor: descriptor).fetchRecent();

    if (response.status != ResponseStatus.success ||
        response.materials == null) {
      return [];
    }

    return response.materials!.cast<M>();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(Measurement.getSpacing(4.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back to Grace, ${widget.authenticationService.firstName} ${widget.authenticationService.lastName}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Measurement.getSpacing(3.0)),
            ),
            Collection(
              headline: 'Recently added books',
              materials: books,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Measurement.getSpacing(3.0)),
            ),
            Collection(
              headline: 'Recently added games',
              materials: games,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Measurement.getSpacing(3.0)),
            ),
            Collection(
              headline: 'Recently added movies',
              materials: movies,
            ),
          ],
        ),
      ),
    );
  }
}
