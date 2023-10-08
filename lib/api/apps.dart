import 'package:http/browser_client.dart';
import 'dart:convert';

const String baseUrl = 'http://localhost:8000';
var client = BrowserClient()..withCredentials = true;

Future<dynamic> GetAppsAPI(bool availability) async {
  // client.withCredentials = false;
  final response = await client.get(
      Uri.parse(baseUrl + '/apps/get?availability=' + availability.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      });

  return response;
}
