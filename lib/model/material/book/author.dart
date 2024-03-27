class BookAuthor {
  int id;
  String firstName;
  String middleName;
  String lastName;
  String biography;
  String image;
  String reference;

  BookAuthor({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.biography,
    required this.image,
    required this.reference,
  });

  factory BookAuthor.fromJson(Map<String, dynamic> input) {
    return BookAuthor(
      id: input['id'],
      firstName: input['first_name'],
      middleName: input['middle_name'],
      lastName: input['last_name'],
      biography: input['biography'],
      image: input['image'],
      reference: input['reference'],
    );
  }
}
