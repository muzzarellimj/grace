import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace/models/book.dart';

const double baseSpace = 28.0;
const double breakpoint = 450.0;

TextStyle labelStyle = GoogleFonts.nunitoSans(
  color: const Color.fromRGBO(4, 64, 20, 1.0),
  fontSize: 14.0,
  fontWeight: FontWeight.w800,
);

TextStyle valueStyle = GoogleFonts.nunitoSans(
  color: Colors.black,
  fontSize: 16.0,
  fontWeight: FontWeight.normal,
);

class ResourceDetail extends StatelessWidget {
  final Book book;

  const ResourceDetail({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(baseSpace),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: baseSpace),
              child: Text(
                book.title,
                style: GoogleFonts.nunitoSans(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width <= breakpoint
                    ? MediaQuery.of(context).size.width * 0.025
                    : MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width <= breakpoint
                    ? MediaQuery.of(context).size.width * 0.025
                    : MediaQuery.of(context).size.width * 0.05,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(baseSpace / 2),
                      child: Image.network(
                        'https://covers.openlibrary.org/b/isbn/${book.isbn13}-L.jpg',
                        height: MediaQuery.of(context).size.width <= breakpoint
                            ? MediaQuery.of(context).size.height / 2.5
                            : MediaQuery.of(context).size.height / 3,
                        fit: BoxFit.contain,
                        alignment: Alignment.topLeft,
                      ),
                    ),
                  ),
                  Expanded(
                    flex:
                        MediaQuery.of(context).size.width <= breakpoint ? 2 : 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: baseSpace,
                        right: baseSpace,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          label('Authors'),
                          value(book.authors?.join(', ') ?? 'Unknown'),
                          book.contributors != null
                              ? label('Contrubutors')
                              : const SizedBox(),
                          book.contributors != null
                              ? value(book.contributors?.join(', ') ?? 'N/A')
                              : const SizedBox(),
                          book.publishers != null
                              ? label('Publishers')
                              : const SizedBox(),
                          book.publishers != null
                              ? value(book.publishers?.join(', ') ?? 'N/A')
                              : const SizedBox(),
                          book.publicationDate != null
                              ? label('Publication Date')
                              : const SizedBox(),
                          book.publicationDate != null
                              ? value(book.publicationDate ?? 'N/A')
                              : const SizedBox(),
                          book.description != null
                              ? label('Description')
                              : const SizedBox(),
                          book.description != null
                              ? value(book.description ?? '...')
                              : const SizedBox(),
                          book.excerpt != null
                              ? label('Excerpt')
                              : const SizedBox(),
                          book.excerpt != null
                              ? value(book.excerpt ?? '...')
                              : const SizedBox(),
                          Wrap(
                            spacing: baseSpace * 2,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  label('Pages'),
                                  value(book.pageCount?.toString() ?? 'N/A'),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  label('ISBN-10'),
                                  value(book.isbn10 ?? 'N/A'),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  label('ISBN-13'),
                                  value(book.isbn13 ?? 'N/A'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget label(String label) {
    return Text(label, style: labelStyle);
  }

  Widget value(String value) {
    return Padding(
      padding: const EdgeInsets.only(top: baseSpace / 4, bottom: baseSpace),
      child: Text(value, style: valueStyle),
    );
  }
}
