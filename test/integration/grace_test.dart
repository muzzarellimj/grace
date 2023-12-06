import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grace/main.dart';
import 'package:grace/widgets/collections/resource.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end', () {
    testWidgets('tap to add a book, insert ISBN, verify book now exists',
        (tester) async {
      await tester.pumpWidget(const Grace());

      expect(find.text('Welcome back to Grace.'), findsOneWidget);

      await tester.tap(find.widgetWithText(FilledButton, 'Add a book'));

      await tester.pumpAndSettle();

      expect(find.widgetWithText(TextFormField, 'ISBN-10 or ISBN-13'),
          findsOneWidget);

      await tester.enterText(
          find.widgetWithText(TextFormField, 'ISBN-10 or ISBN-13'),
          '978-0743477543');

      await tester.tap(find.widgetWithText(FilledButton, 'Search'));

      expect(find.widgetWithText(Resource, 'A Midsummer Night\'s Dream'),
          findsOneWidget);
    });
  });
}
