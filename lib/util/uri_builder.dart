class UriBuilder {
  static Uri asUri(bool secure, String host, String path) {
    return secure ? Uri.https(host, path) : Uri.http(host, path);
  }

  static String asString(bool secure, String host, String path) {
    return asUri(secure, host, path).toString();
  }
}
