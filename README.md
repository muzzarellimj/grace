# Grace

Grace is an open-source, cross-platform collection management application built with [Flutter](https://flutter.dev/) in [Dart](https://dart.dev/). Grace aims to be a robust, easy to use platform to support graceful collection management via an intuitive user interface, collection snapshots, and edition-specific metadata. Grace is built alongside two supporting API:

- [Grace Authentication API](https://github.com/muzzarellimj/grace-authentication-api) - a Node-based REST API serving authentication requests
- [Grace Material API](https://github.com/muzzarellimj/grace-material-api) - a Go-based REST API serving materials requests

## Getting Started

Grace can be cloned with `git clone https://github.com/muzzarellimj/grace.git`. Once it has been downloaded, open a terminal in the project folder and run the following commands:

```
flutter pub get
flutter run
```

The latter command will prompt you to select a platform based on the available native and emulated devices, so feel free to pick whichever is available from the list of supported platforms.
