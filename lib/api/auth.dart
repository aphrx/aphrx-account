import 'package:account_frontend/screens/account_mgmt/home_page.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseUrl = 'http://localhost:8000';

Future<dynamic> Login(String username, String password) async {
  var client = BrowserClient()..withCredentials = true;

  final response = await client.post(
    Uri.parse(baseUrl + '/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, String>{'username': username, 'password': password}),
  );

  return response;
}

Future<dynamic> GetUser() async {
  var client = BrowserClient()..withCredentials = true;

  final response = await client
      .get(Uri.parse(baseUrl + '/profile/get'), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });

  if (response.statusCode == 200) {
    return response;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    // throw Exception('Failed to login. Please try again later.');
    return null;
  }
}

Future isLoggedIn(context) async {
  final response = await GetUser();
  return response;
}
