import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grace/util/uri_builder.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher_string.dart';

class AuthenticationApi {
  static String host =
      dotenv.env['AUTHENTICATION_API_HOST'] ?? 'localhost:3000';

  static bool secure = dotenv.env['PROTOCOL'] == 'https';

  static Future<http.Response> signup(
    String email,
    String password,
    String firstName,
    String lastName,
    String token,
  ) async {
    return await http.post(
      UriBuilder.asUri(secure, host, '/api/signup'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
      body: jsonEncode({
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
      }),
    );
  }

  static Future<http.Response> signinEmailPassword(
    String email,
    String password,
    String token,
  ) async {
    return await http.post(
      UriBuilder.asUri(secure, host, '/api/signin'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
  }

  static Future<http.Response> signinGoogle(String token) async {
    http.Response response = await http.get(
      UriBuilder.asUri(secure, host, '/api/signin/google'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    if (response.statusCode != HttpStatus.ok) {
      await launchUrlString('https://accounts.google.com/');
    }

    return response;
  }

  static Future<http.Response> pulse(String token) async {
    return await http.post(
      UriBuilder.asUri(secure, host, '/api/pulse'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
  }

  static Future<http.Response> update(
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    String token,
  ) async {
    Map<String, String> data = {};

    if (email != null) {
      data['email'] = email;
    }

    if (password != null) {
      data['password'] = password;
    }

    if (firstName != null) {
      data['firstName'] = firstName;
    }

    if (lastName != null) {
      data['lastName'] = lastName;
    }

    return await http.post(
      UriBuilder.asUri(secure, host, '/api/update'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
      body: jsonEncode(data),
    );
  }

  static Future<http.Response> deauthenticate(String token) async {
    return await http.post(
      UriBuilder.asUri(secure, host, '/api/signout'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
  }

  static Future<http.Response> adminGetUserSet(String token) async {
    return await http.get(
      UriBuilder.asUri(secure, host, '/api/administration/user'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
  }

  static Future<http.Response> adminUpdateUser(
    String id,
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    int? role,
    int? status,
    String token,
  ) async {
    Map<String, dynamic> data = {};

    data['id'] = id;

    if (email != null) {
      data['email'] = email;
    }

    if (password != null) {
      data['password'] = password;
    }

    if (firstName != null) {
      data['firstName'] = firstName;
    }

    if (lastName != null) {
      data['lastName'] = lastName;
    }

    if (role != null) {
      data['role'] = role;
    }

    if (status != null) {
      data['status'] = status;
    }

    return await http.post(
      UriBuilder.asUri(secure, host, '/api/administration/update'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
      body: jsonEncode(data),
    );
  }
}
