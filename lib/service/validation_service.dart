import 'package:flutter/material.dart';

class ValidationService {
  String? validateEmailAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid email address.';
    }

    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid name.';
    }

    return null;
  }

  String? validatePassword(
    TextEditingController passwordController,
    TextEditingController passwordAgainController,
    String? value,
  ) {
    if (value == null || value.isEmpty || value.length < 8) {
      return 'Please enter a password with 8 or more characters.';
    }

    if (passwordController.value != passwordAgainController.value) {
      return 'Passwords need to match.';
    }

    return null;
  }
}
