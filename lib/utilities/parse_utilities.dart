class ParseUtilities {
  /// Format a resource identifier as a string, and optionally remove a text selection from it.
  static String? formatResourceId(Object? id, {String? remove}) {
    if (id == null) return null;

    var result = id.toString();

    if (remove != null) {
      result = result.replaceAll(remove, '');
    }

    return result;
  }
}
