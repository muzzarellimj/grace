import 'package:flutter/material.dart';
import 'package:grace/model/material/material_descriptor.dart';
import 'package:grace/model/material/movie/movie.dart';
import 'package:grace/service/authentication_service.dart';
import 'package:grace/service/library_service.dart';
import 'package:grace/theme/breakpoint.dart';
import 'package:grace/theme/measurement.dart';
import 'package:grace/widget/button/primary_icon.dart';
import 'package:grace/widget/toast/toast.dart';

class MovieOverview extends StatelessWidget {
  final AuthenticationService authenticationService;
  final LibraryService libraryService;
  final Movie mat;

  const MovieOverview({
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
            Text(
              mat.tagline,
              style: Theme.of(context).textTheme.headlineSmall,
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
                        'Description',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: Measurement.getSpacing(2.0),
                        ),
                      ),
                      Text(
                        mat.description,
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
                        'Production Companies',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: Measurement.getSpacing(2.0),
                        ),
                      ),
                      Text(
                        mat.productionCompanies
                            .map((productionCompany) => productionCompany.name)
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
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: Measurement.getSpacing(4.0),
                        ),
                      ),

                      //

                      Text(
                        'Runtime',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: Measurement.getSpacing(2.0),
                        ),
                      ),
                      Text(
                        '${mat.runtime} minutes',
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
