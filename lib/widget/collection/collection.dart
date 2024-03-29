import 'package:flutter/material.dart';
import 'package:grace/utility/theme.dart';
import 'package:grace/widget/material/material_preview.dart';

class Collection extends StatelessWidget {
  final double minimumWidgetWidth = 392.0;

  final String headline;
  final List<Object> materials;

  const Collection({
    super.key,
    required this.headline,
    required this.materials,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).canvasColor,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(ThemeUtility.calculateSpacing(3.0)),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(bottom: ThemeUtility.calculateSpacing(3.0)),
              child: Text(
                headline,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            GridView.count(
              crossAxisCount: ThemeUtility.valueOrOne(
                MediaQuery.of(context).size.width ~/ minimumWidgetWidth,
              ),
              shrinkWrap: true,
              mainAxisSpacing: ThemeUtility.calculateSpacing(2.0),
              crossAxisSpacing: ThemeUtility.calculateSpacing(2.0),
              childAspectRatio: 1.5,
              children: List<Widget>.generate(materials.length, (index) {
                return MaterialPreview(mat: materials[index]);
              }),
            )
          ],
        ),
      ),
    );
  }
}
