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

  String get id => store.get('id') ?? '';
  String get externalId => store.get('externalId') ?? '';

  String get email => store.get('email') ?? '';
  String get firstName => store.get('firstName') ?? '';
  String get lastName => store.get('lastName') ?? '';

  Future<String?> signup(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    http.Response response = await AuthenticationApi.signup(
      email,
      password,
      firstName,
      lastName,
      token,
    );

    if (response.statusCode != HttpStatus.created) {
      String? message = jsonDecode(response.body)['message'];

      await clearAuthenticationState();

      notifyListeners();

      return message;
    }

    return null;
  }

  Future<String?> signinEmailPassword(
    String email,
    String password,
  ) async {
    http.Response response = await AuthenticationApi.signinEmailPassword(
      email,
      password,
      token,
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await clearAuthenticationState();

      notifyListeners();

      return 'Invalid email address or password.';
    }

    Map<String, dynamic> json = jsonDecode(response.body);

    if (response.statusCode != HttpStatus.ok) {
      await clearAuthenticationState();

      notifyListeners();

      return json['message'];
    }

    Profile profile = Profile.fromJson(json['profile']);

    await storeAuthenticationState(
      true,
      json['token'],
      profile.id,
      profile.externalId,
      profile.email,
      profile.firstName,
      profile.lastName,
    );

    notifyListeners();

    return null;
  }

  Future<String?> signinGoogle() async {
    http.Response response = await AuthenticationApi.signinGoogle(token);

    if (response.statusCode == HttpStatus.unauthorized) {
      await clearAuthenticationState();

      notifyListeners();

      return 'Invalid email address or password.';
    }

    Map<String, dynamic> json = jsonDecode(response.body);

    if (response.statusCode != HttpStatus.ok) {
      await clearAuthenticationState();

      notifyListeners();

      return json['message'];
    }

    Profile profile = Profile.fromJson(json['profile']);

    await storeAuthenticationState(
      true,
      json['token'],
      profile.id,
      profile.externalId,
      profile.email,
      profile.firstName,
      profile.lastName,
    );

    notifyListeners();

    return null;
  }

  Future<String?> pulse() async {
    http.Response response = await AuthenticationApi.pulse(token);

    if (response.statusCode == HttpStatus.unauthorized) {
      await clearAuthenticationState();

      notifyListeners();

      return 'Invalid email address or password.';
    }

    Map<String, dynamic> json = jsonDecode(response.body);

    if (response.statusCode != HttpStatus.ok) {
      await clearAuthenticationState();

      notifyListeners();

      return json['message'];
    }

    Profile profile = Profile.fromJson(json['profile']);

    await storeAuthenticationState(
      true,
      json['token'],
      profile.id,
      profile.externalId,
      profile.email,
      profile.firstName,
      profile.lastName,
    );

    notifyListeners();

    return null;
  }

  Future<String?> update(
    String? email,
    String? password,
    String? firstName,
    String? lastName,
  ) async {
    http.Response response = await AuthenticationApi.update(
      email,
      password,
      firstName,
      lastName,
      token,
    );

    if (response.statusCode != HttpStatus.ok) {
      await clearAuthenticationState();

      notifyListeners();

      return jsonDecode(response.body)['message'];
    }

    return null;
  }

  Future<void> deauthenticate() async {
    await AuthenticationApi.deauthenticate(token);

    await clearAuthenticationState();

    notifyListeners();
  }

  Future<void> clearAuthenticationState() async {
    await store.put('isAuthenticated', null);
    await store.put('token', null);

    await store.put('id', null);
    await store.put('externalId', null);

    await store.put('email', null);
    await store.put('firstName', null);
    await store.put('lastName', null);
  }

  Future<void> storeAuthenticationState(
    bool isAuthenticated,
    String token,
    String id,
    String? externalId,
    String? email,
    String firstName,
    String lastName,
  ) async {
    await store.put('isAuthenticated', isAuthenticated);
    await store.put('token', token);

    await store.put('id', id);
    await store.put('externalId', externalId);

    await store.put('email', email);
    await store.put('firstName', firstName);
    await store.put('lastName', lastName);
  }
}
