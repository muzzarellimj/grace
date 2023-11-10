# Grace

Grace is an open-source, cross-platform collection management application built with [Flutter](https://flutter.dev/) in [Dart](https://dart.dev/).

## Milestones

### November 10, 2023

Grace has been built as a basic application with very little design and without an appropriate data source, as prescribed in the [proposal document](docs/proposal.md). A stretch goal was also achieved; Firebase was onboarded with Firestore, so our current-state database is read-only and processes documents within the `books` collection as a [`Stream`](https://api.dart.dev/stable/2.8.3/dart-async/Stream-class.html) with [`QuerySnapshot`](https://pub.dev/documentation/cloud_firestore/latest/cloud_firestore/QuerySnapshot-class.html)s, which enable realtime collection updates.

CLOC counted 193 lines of code across 4 files; complete results can be found [here](docs/cloc/11-10.txt).