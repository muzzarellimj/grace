import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grace/api/authentication_api.dart';
import 'package:grace/model/authentication/profile.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class AuthenticationService extends ChangeNotifier {
  Box store = Hive.box('authentication');

  bool get isAuthenticated => store.get('isAuthenticated') ?? false;
  String get token => store.get('token') ?? '';

  AuthenticationService() {
    store.put('isAuthenticated', isAuthenticated);
    store.put('token', token);
  }

  Future<Profile?> authenticate(String email, String password) async {
    http.Response response =
        await AuthenticationApi.authenticationEmailPassword(
            email, password, token);

    if (response.statusCode != HttpStatus.ok) {
      await clearAuthenticationState();

      notifyListeners();

      return null;
    }

    Map<String, dynamic> json = jsonDecode(response.body);
    Profile profile = Profile.fromJson(json['profile']);

    await storeAuthenticationState(true, json['token']);

    notifyListeners();

    return profile;
  }

  Future<Profile?> authenticateGoogle() async {
    http.Response response = await AuthenticationApi.authenticateGoogle(token);

    if (response.statusCode != HttpStatus.ok) {
      await clearAuthenticationState();

      notifyListeners();

      return null;
    }

    Map<String, dynamic> json = jsonDecode(response.body);
    Profile profile = Profile.fromJson(json['profile']);

    await storeAuthenticationState(true, json['token']);

    notifyListeners();

    return profile;
  }

  Future<Profile?> pulse() async {
    http.Response response = await AuthenticationApi.pulse(token);

    if (response.statusCode != HttpStatus.ok) {
      await clearAuthenticationState();

      notifyListeners();

      return null;
    }

    Map<String, dynamic> json = jsonDecode(response.body);
    Profile profile = Profile.fromJson(json['profile']);

    await storeAuthenticationState(true, json['token']);

    notifyListeners();

    return profile;
  }

  Future<void> deauthenticate() async {
    await AuthenticationApi.deauthenticate(token);

    await clearAuthenticationState();

    notifyListeners();
  }

  Future<void> clearAuthenticationState() async {
    await store.put('isAuthenticated', null);
    await store.put('token', null);
  }

  Future<void> storeAuthenticationState(
      bool isAuthenticated, String token) async {
    await store.put('isAuthenticated', isAuthenticated);
    await store.put('token', token);
  }
}
