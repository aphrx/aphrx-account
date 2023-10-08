import 'package:http/browser_client.dart';
import 'dart:convert';

const String baseUrl = 'http://localhost:8000';
var client = BrowserClient()..withCredentials = true;

Future<dynamic> GetSettingsAPI() async {
  // client.withCredentials = false;
  final response = await client.get(Uri.parse(baseUrl + '/settings/get'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      });
  print(response.body);
  return response;
}
