class UriBuilder {
  static Uri asUri(
    bool secure,
    String host,
    String path, {
    Map<String, dynamic>? query,
  }) {
    return secure ? Uri.https(host, path, query) : Uri.http(host, path, query);
  }

  static String asString(bool secure, String host, String path) {
    return asUri(secure, host, path).toString();
  }
}
