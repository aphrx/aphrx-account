import 'package:http/browser_client.dart';
import 'dart:convert';

const String baseUrl = 'http://localhost:8000';
var client = BrowserClient()..withCredentials = true;

Future<dynamic> Login(String username, String password) async {
  // client.withCredentials = false;
  final response = await client.post(
    Uri.parse(baseUrl + '/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(
        <String, String>{'username': username, 'password': password}),
  );

  return response;
}

Future<dynamic> Register(
    String username, String password, String firstName, String lastName) async {
  // client.withCredentials = false;
  final response = await client.post(
    Uri.parse(baseUrl + '/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'avatar_url': '',
      'bio': ''
    }),
  );

  return response;
}

Future<dynamic> Logout() async {
  // client.withCredentials = true;
  final response = await client
      .get(Uri.parse(baseUrl + '/logout'), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });

  return response;
}

Future<dynamic> GetUser() async {
  // var client = BrowserClient()..withCredentials = true;
  // client.withCredentials = true;
  final response = await client
      .get(Uri.parse(baseUrl + '/profile/get'), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });

  return response;
}

Future<bool> isLoggedIn() async {
  final response = await GetUser();
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<dynamic> GetAbout() async {
  // var client = BrowserClient()..withCredentials = true;
  // client.withCredentials = true;
  final response = await client
      .get(Uri.parse(baseUrl + '/profile/about'), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });

  if (response.statusCode == 200) {
    return response;
  } else {
    return null;
  }
}

Future<dynamic> GetLinks() async {
  // var client = BrowserClient()..withCredentials = true;
  // client.withCredentials = true;
  final response = await client
      .get(Uri.parse(baseUrl + '/profile/links'), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });

  if (response.statusCode == 200) {
    return response;
  } else {
    return null;
  }
}
