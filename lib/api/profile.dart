import 'package:http/browser_client.dart';
import 'dart:convert';

const String baseUrl = 'http://localhost:8000';
var client = BrowserClient()..withCredentials = true;

Future<dynamic> EditUserAPI(
    String firstname, String lastname, String bio, String avatarUrl) async {
  // client.withCredentials = false;
  final response = await client.post(
    Uri.parse(baseUrl + '/profile/edit'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{
      'first_name': firstname,
      'last_name': lastname,
      'bio': bio,
      'avatar_url': avatarUrl
    }),
  );

  return response;
}

Future<dynamic> EditAboutAPI(String about) async {
  // client.withCredentials = false;
  final response = await client.post(
    Uri.parse(baseUrl + '/profile/edit-about'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{'about': about}),
  );

  return response;
}

Future<dynamic> AddLinkAPI(
    String title, String body, String destination_url, String image_url) async {
  // client.withCredentials = false;
  final response = await client.post(
    Uri.parse(baseUrl + '/profile/add-link'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{
      'image_url': image_url,
      'title': title,
      'body': body,
      'destination_url': destination_url
    }),
  );

  return response;
}

Future<dynamic> DeleteLinkAPI(int id) async {
  // client.withCredentials = false;
  final response = await client.delete(
    Uri.parse(baseUrl + '/profile/delete-link'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, int>{'id': id}),
  );

  return response;
}
