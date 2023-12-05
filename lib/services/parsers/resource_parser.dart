/// Abstract resource parsing service leverages the template method design pattern.
abstract class ResourceParser {
  Map<String, dynamic>? parse(Map<String, dynamic> data);
}
