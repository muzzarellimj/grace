import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace/widgets/buttons/primary_button.dart';
import 'package:grace/widgets/collections/collection_overview.dart';
import 'package:grace/widgets/modals/resource_addition_modal.dart';

const double padding = 28.0;
const double breakpoint = 450;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: padding,
            bottom: padding,
            left: MediaQuery.of(context).size.width <= breakpoint
                ? padding
                : padding * 2,
            right: MediaQuery.of(context).size.width <= breakpoint
                ? padding
                : padding * 2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back to Grace.',
                style: GoogleFonts.nunitoSans(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: padding / 2),
                child: Text(
                  'Grace is an open-source, cross-platform collection management application built with Flutter in Dart and leverages Firebase Firestore among other utilities.',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 16.0,
                  ),
                ),
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
