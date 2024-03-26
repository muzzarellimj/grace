class BookTopic {
  int id;
  String name;

  BookTopic({
    required this.id,
    required this.name,
  });

  factory BookTopic.fromJson(Map<String, dynamic> input) {
    return BookTopic(
      id: input['id'],
      name: input['name'],
    );
  }
}
