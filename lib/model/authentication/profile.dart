import 'package:grace/model/authentication/role.dart';
import 'package:grace/model/authentication/status.dart';

class Profile {
  String id;
  String? externalId;
  String? email;
  String firstName;
  String lastName;
  Role role;
  Status status;

  Profile({
    required this.id,
    this.externalId,
    this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.status,
  });

  factory Profile.fromJson(Map<String, dynamic> input) {
    return Profile(
      id: input['id'],
      externalId: input['externalId'],
      email: input['email'],
      firstName: input['firstName'],
      lastName: input['lastName'],
      role: Role.fromIdentifier(input['role']),
      status: Status.fromIdentifier(input['status']),
    );
  }
}
