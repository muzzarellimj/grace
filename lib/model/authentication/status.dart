enum Status {
  active(identifier: 0),
  restricted(identifier: 1);

  final int identifier;

  const Status({required this.identifier});

  factory Status.fromIdentifier(int? value) {
    for (var status in Status.values) {
      if (value == status.identifier) {
        return status;
      }
    }

    return Status.active;
  }
}
