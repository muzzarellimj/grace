class BookPublisher {
  int id;
  String name;

  BookPublisher({
    required this.id,
    required this.name,
  });

  factory BookPublisher.fromJson(Map<String, dynamic> input) {
    return BookPublisher(
      id: input['id'],
      name: input['name'],
    );
  }
}
