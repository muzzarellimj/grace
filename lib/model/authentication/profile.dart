class Profile {
  String id;
  String? externalId;
  String? email;
  String firstName;
  String lastName;

  Profile({
    required this.id,
    this.externalId,
    this.email,
    required this.firstName,
    required this.lastName,
  });

  factory Profile.fromJson(Map<String, dynamic> input) {
    return Profile(
      id: input['id'],
      externalId: input['externalId'],
      email: input['email'],
      firstName: input['firstName'],
      lastName: input['lastName'],
    );
  }
}
