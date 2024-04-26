import 'package:flutter/material.dart';
import 'package:grace/model/material/game/game.dart';
import 'package:grace/model/material/material_descriptor.dart';
import 'package:grace/service/authentication_service.dart';
import 'package:grace/service/library_service.dart';
import 'package:grace/theme/breakpoint.dart';
import 'package:grace/theme/measurement.dart';
import 'package:grace/widget/button/primary_icon.dart';
import 'package:grace/widget/toast/toast.dart';

class GameOverview extends StatelessWidget {
  String? _message;

  final AuthenticationService authenticationService;
  final LibraryService libraryService;
  final Game mat;

  GameOverview({
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

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(Measurement.getSpacing(
          breakpoint.isMobile(breakpoint) ? 2.0 : 4.0,
        )),
        child: Column(
          children: [
            Text(
              mat.title,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Measurement.getSpacing(2.0)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Image.network(mat.image),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: Measurement.getSpacing(2.0),
                        ),
                      ),
                      PrimaryIconButton(
                        icon: Icons.library_add,
                        label: 'Add to library',
                        onPressed: () async {
                          await libraryService.store(
                            authenticationService.id,
                            MaterialDescriptor.game,
                            mat.id,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(Toast.success(
                                  context,
                                  '${mat.title} has been added to your collection! You may need to refresh your collection to see it.')
                              .asSnackbar());
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: Measurement.getSpacing(2.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Summary',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: Measurement.getSpacing(2.0),
                        ),
                      ),
                      Text(
                        mat.summary,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: Measurement.getSpacing(4.0),
                        ),
                      ),

                      //

                      Text(
                        'Storyline',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: Measurement.getSpacing(2.0),
                        ),
                      ),
                      Text(
                        mat.storyline,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: Measurement.getSpacing(4.0),
                        ),
                      ),

                      //

                      Text(
                        'Franchises',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: Measurement.getSpacing(2.0),
                        ),
                      ),
                      Text(
                        mat.franchises
                            .map((franchise) => franchise.name)
                            .join(', '),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: Measurement.getSpacing(4.0),
                        ),
                      ),

                      //

                      Text(
                        'Genres',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: Measurement.getSpacing(2.0),
                        ),
                      ),
                      Text(
                        mat.genres.map((genre) => genre.name).join(', '),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: Measurement.getSpacing(4.0),
                        ),
                      ),

                      //

                      Text(
                        'Platforms',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: Measurement.getSpacing(2.0),
                        ),
                      ),
                      Text(
                        mat.platforms
                            .map((platform) => platform.name)
                            .join(', '),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: Measurement.getSpacing(4.0),
                        ),
                      ),

                      //

                      Text(
                        'Studios',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: Measurement.getSpacing(2.0),
                        ),
                      ),
                      Text(
                        mat.studios.map((studio) => studio.name).join(', '),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: Measurement.getSpacing(4.0),
                        ),
                      ),

                      //

                      Text(
                        'Release Date',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: Measurement.getSpacing(2.0),
                        ),
                      ),
                      Text(
                        DateTime.fromMillisecondsSinceEpoch(mat.releaseDate)
                            .toLocal()
                            .toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
