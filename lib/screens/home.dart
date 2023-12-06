import 'package:flutter/material.dart';
import 'package:grace/widgets/buttons/primary_button.dart';
import 'package:grace/widgets/collections/collection_overview.dart';
import 'package:grace/widgets/modals/resource_addition_modal.dart';

const padding = 28.0;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: padding,
            bottom: padding,
            left: padding * 2,
            right: padding * 2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back to Grace, Michael.',
                style: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.headlineLarge?.fontSize),
              ),
              Padding(
                padding: const EdgeInsets.only(top: padding),
                child: PrimaryIconButton(
                  icon: Icons.add,
                  label: 'Add a book',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          const ResourceAdditionModal(),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: padding),
                child: CollectionSnapshot(
                  collection: 'books',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
