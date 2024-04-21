class Profile {
  String id;
  String? email;
  String firstName;
  String lastName;

  Profile({
    required this.id,
    this.email,
    required this.firstName,
    required this.lastName,
  });

  factory Profile.fromJson(Map<String, dynamic> input) {
    return Profile(
      id: input['id'],
      email: input['email'],
      firstName: input['firstName'],
      lastName: input['lastName'],
    );
  }
}
