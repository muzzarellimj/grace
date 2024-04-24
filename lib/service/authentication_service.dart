import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grace/api/authentication_api.dart';
import 'package:grace/model/authentication/profile.dart';
import 'package:grace/model/authentication/role.dart';
import 'package:grace/model/authentication/status.dart';
import 'package:grace/model/response/get_user_set.dart';
import 'package:grace/model/response/response_status.dart';
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

  Role get role => Role.fromIdentifier(store.get('role'));
  Status get status => Status.fromIdentifier(store.get('status'));

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
      profile.role.identifier,
      profile.status.identifier,
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
      profile.role.identifier,
      profile.status.identifier,
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
      profile.role.identifier,
      profile.status.identifier,
    );

    notifyListeners();

    return null;
  }

  Future<String?> update({
    String? email,
    String? password,
    String? firstName,
    String? lastName,
  }) async {
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

  Future<GetUserSetResponse> adminGetUserSet() async {
    http.Response response = await AuthenticationApi.adminGetUserSet(token);

    if (response.statusCode == HttpStatus.unauthorized) {
      await clearAuthenticationState();

      notifyListeners();

      return GetUserSetResponse(
        status: ResponseStatus.failure,
        message: 'Oops! We hit a snag. Please try again.',
      );
    }

    Map<String, dynamic> json = jsonDecode(response.body);

    if (response.statusCode != HttpStatus.ok) {
      return GetUserSetResponse(
        status: ResponseStatus.failure,
        message: json['message'],
      );
    }

    List<Profile> users =
        (json['data'] as List).map((user) => Profile.fromJson(user)).toList();

    return GetUserSetResponse(status: ResponseStatus.success, users: users);
  }

  Future<String?> adminUpdate(
    String id, {
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    Role? role,
    Status? status,
  }) async {
    http.Response response = await AuthenticationApi.adminUpdateUser(
      id,
      email,
      password,
      firstName,
      lastName,
      role?.identifier,
      status?.identifier,
      token,
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await clearAuthenticationState();

      notifyListeners();

      return 'Oops! We hit a snag. Please try again.';
    }

    Map<String, dynamic> json = jsonDecode(response.body);

    if (response.statusCode != HttpStatus.ok) {
      return json['message'];
    }

    return null;
  }

  Future<void> clearAuthenticationState() async {
    await store.put('isAuthenticated', null);
    await store.put('token', null);

    await store.put('id', null);
    await store.put('externalId', null);

    await store.put('email', null);
    await store.put('firstName', null);
    await store.put('lastName', null);

    await store.put('role', null);
    await store.put('status', null);
  }

  Future<void> storeAuthenticationState(
    bool isAuthenticated,
    String token,
    String id,
    String? externalId,
    String? email,
    String firstName,
    String lastName,
    int role,
    int status,
  ) async {
    await store.put('isAuthenticated', isAuthenticated);
    await store.put('token', token);

    await store.put('id', id);
    await store.put('externalId', externalId);

    await store.put('email', email);
    await store.put('firstName', firstName);
    await store.put('lastName', lastName);

    await store.put('role', role);
    await store.put('status', status);
  }
}
