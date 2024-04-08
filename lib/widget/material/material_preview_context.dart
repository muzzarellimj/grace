import 'package:flutter/material.dart';
import 'package:grace/theme/measurement.dart';
import 'package:grace/widget/button/primary_icon.dart';

class MaterialPreviewContext extends StatelessWidget {
  final String headline;
  final String attribution;
  final String description;

  const MaterialPreviewContext({
    super.key,
    required this.headline,
    required this.attribution,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Measurement.getSpacing(2.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: Measurement.getSpacing(1.5)),
            child: Text(
              headline,
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Measurement.getSpacing(1.5)),
            child: Text(
              attribution,
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: Measurement.defaultSpacing),
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: PrimaryIconButton(
                icon: Icons.arrow_outward,
                label: 'See more',
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
