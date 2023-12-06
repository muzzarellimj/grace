import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace/models/book.dart';
import 'package:grace/widgets/buttons/primary_button.dart';
import 'package:grace/widgets/collections/resource_detail.dart';

const double breakpoint = 450;
const double baseSpacing = 14.0;
const double borderRadius = 12.0;
const Color backgroundColor = Colors.white;
const Color borderColor = Color.fromRGBO(217, 216, 213, 1);

class Resource extends StatelessWidget {
  final Book book;

  const Resource({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: const BorderSide(color: borderColor),
        ),
        elevation: 0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        semanticContainer: true,
        child: Row(
          children: [
            Expanded(
              flex: MediaQuery.of(context).size.width > breakpoint ? 2 : 1,
              child: FractionallySizedBox(
                heightFactor: 1.0,
                child: Image.network(
                  'https://covers.openlibrary.org/b/isbn/${book.isbn13}-L.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: MediaQuery.of(context).size.width > breakpoint ? 3 : 2,
              child: Container(
                padding: const EdgeInsets.all(baseSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: GoogleFonts.nunitoSans(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        height: 1.15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: baseSpacing / 2),
                      child: Text(
                        'by ${book.authors?.join(", ")}',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: baseSpacing / 2),
                      child: Text(
                        book.description ?? book.excerpt ?? '',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: PrimaryIconButton(
                          icon: Icons.arrow_outward,
                          label: 'See more',
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.white,
                              elevation: 0,
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width <=
                                        breakpoint
                                    ? MediaQuery.of(context).size.width
                                    : MediaQuery.of(context).size.width * 0.75,
                              ),
                              context: context,
                              builder: (BuildContext context) =>
                                  ResourceDetail(book: book),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
