# Grace

Grace is an open-source, cross-platform collection management application built with [Flutter](https://flutter.dev/) in [Dart](https://dart.dev/). Grace aims to be a robust, easy to use platform to support graceful collection management via an intuitive user interface, collection snapshots, and edition-specific metadata. Grace currently supports web and iOS platforms.

- [Getting Started](#getting-started)
- [Features](#features)

Supporting resources are as follows:

- [Code Smell and Refactoring](code-smell/code-smell.md)
- [Design](design/design.md)
- [Presentation](presentation//presentation.pdf)
- [Requirements](requirement/requirement.md)
- [User Manual](manual/manual.md)

## Getting Started

Grace can be cloned with `git clone https://github.com/muzzarellimj/grace.git`. Once it has been downloaded, open a terminal in the project folder and run the following commands:

```
flutter pub get
flutter run
```

The latter command will prompt you to select a platform based on the available native and emulated devices, so feel free to pick whichever is available from the list of supported platforms.

## Features

Grace was built with a few simple features in mind: add a book, fetch metadata, organize and store metadata, and provide some methods to see the book.

### Adding a book

Users can input an ISBN-10 or ISBN-13 to the resource addition modal, and a few things will occur:

- `OpenLibraryApi` fetches edition metadata with the provided ISBN
- `OpenLibraryApi` fetches work metadata with the edition response
- `OpenLibraryApi` fetches all author metadata with the work response
- `BookParser` prepares and parses edition, work, and author data to extract approriate data
- `FirebaseApi` inserts the parsed document into the collection

### Viewing a collection

Users can visit the home screen to see a snapshot of all recently added books, each displaying the cover image, title, author(s), and excerpt within a compact card layout.

### Viewing a book

Users can click or tap a button on each resource card to open a bottom sheet modal that provides all additional metadata about the specific book edition, including the publishers, contributors, ISBN, and more.