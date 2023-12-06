import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace/api/firebase.dart';
import 'package:grace/api/grace.dart';
import 'package:grace/widgets/buttons/primary_button.dart';
import 'package:grace/widgets/notifications/notification.dart';

const double basePadding = 24.0;
const double borderRadius = 12.0;
const double breakpoint = 450.0;
const Color backgroundColor = Colors.white;
const Color formForegroundColor = Color.fromRGBO(4, 64, 20, 1.0);

const Color formBackgroundColor = Color.fromRGBO(245, 243, 240, 1.0);
const Color formBorderColor = Color(0xFFD9D8D5);

InputBorder activeBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(borderRadius),
  borderSide: const BorderSide(
    color: formBorderColor,
  ),
);

class ResourceAdditionModal extends StatefulWidget {
  const ResourceAdditionModal({super.key});

  @override
  State<StatefulWidget> createState() => _ResourceAdditionModalState();
}

class _ResourceAdditionModalState extends State<ResourceAdditionModal> {
  final _formKey = GlobalKey<FormState>();
  final _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        padding: const EdgeInsets.all(basePadding),
        height: MediaQuery.of(context).size.width <= breakpoint
            ? MediaQuery.of(context).size.height / 1.75
            : MediaQuery.of(context).size.height / 2.5,
        width: MediaQuery.of(context).size.width <= breakpoint
            ? MediaQuery.of(context).size.width / 1.25
            : MediaQuery.of(context).size.width / 2.5,
        child: Column(
          children: [
            Text(
              'Add a book',
              style: GoogleFonts.nunitoSans(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: basePadding),
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text('ISBN-10 or ISBN-13'),
                        labelStyle: GoogleFonts.nunitoSans(color: Colors.black),
                        filled: true,
                        fillColor: formBackgroundColor,
                        focusedBorder: activeBorder,
                        enabledBorder: activeBorder,
                      ),
                      controller: _inputController,
                      validator: (input) => _validateIsbn(input),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(top: basePadding),
                    child: PrimaryIconButton(
                      icon: Icons.search,
                      label: 'Search',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _insertBook(_inputController.text).then(
                            (response) {
                              if (response) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  GraceNotification.success(
                                    context: context,
                                    content:
                                        'Success! A new book has been added to your collection.',
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  GraceNotification.failure(
                                      context: context,
                                      content:
                                          'Uh-oh, something went wrong. Please try again.'),
                                );
                              }

                              Navigator.of(context).pop();
                            },
                          );
                        }
                      },
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

  @override
  void dispose() {
    _inputController.dispose();

    super.dispose();
  }

  String? _validateIsbn(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter a valid ISBN';
    }

    input = input.replaceAll('-', '').trim();

    if (input.length != 10 && input.length != 13) {
      return 'Please enter a valid ISBN.';
    }

    return null;
  }

  Future<bool> _insertBook(String isbn) async {
    var bookResponse = await GraceApi.fetchBook(isbn);

    if (bookResponse == null) {
      return false;
    }

    await FirebaseApi.insertDocument('books', bookResponse);

    return true;
  }
}
