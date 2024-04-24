enum Role {
  user(identifier: 0),
  administrator(identifier: 1);

  final int identifier;

  const Role({required this.identifier});

  factory Role.fromIdentifier(int? value) {
    for (var role in Role.values) {
      if (value == role.identifier) {
        return role;
      }
    }

    return Role.user;
  }
}
