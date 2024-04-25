import 'package:flutter/material.dart';
import 'package:grace/theme/measurement.dart';
import 'package:grace/widget/material/material_preview.dart';

class Collection extends StatelessWidget {
  final double minimumWidgetWidth = 392.0;

  final ScrollController _scrollController = ScrollController();

  final String headline;
  final List<Object> materials;

  Collection({
    super.key,
    required this.headline,
    required this.materials,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 456.0,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Theme.of(context).canvasColor,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(Measurement.getSpacing(3.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: Measurement.getSpacing(3.0)),
                child: Text(
                  headline,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Expanded(
                child: Scrollbar(
                  controller: _scrollController,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: Measurement.getSpacing(3.0),
                    ),
                    child: ListView(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children:
                          List<Widget>.generate(materials.length, (index) {
                        return MaterialPreview(mat: materials[index]);
                      }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
