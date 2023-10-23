import 'dart:convert';
import 'package:account_frontend/api/auth.dart';
import 'package:account_frontend/screens/account_mgmt/home_page.dart';
import 'package:account_frontend/screens/login_page.dart';
import 'package:account_frontend/utils/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'dart:html';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var guest_username;

  void doWork() async {
    var uri =
        Uri.dataFromString(window.location.href); //converts string to a uri
    Map<String, String> params =
        uri.queryParameters; // query parameters automatically populated

    setState(() {
      guest_username = params['user'];
      ;
    }); // return value of parameter "param1" from uri
    print(jsonEncode(params)); //can use returned parameters to encode as json
  }

  @override
  void initState() {
    super.initState();
    doWork();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Colors.white,
              onPrimary: Colors.black,
              secondary: Colors.grey.shade50,
              onSecondary: Colors.black,
              error: Colors.red,
              onError: Colors.white,
              onBackground: Colors.grey.shade50,
              surface: Colors.white,
              onSurface: Colors.black,
              background: Colors.grey.shade50),
          primarySwatch: Colors.red,
          textTheme: GoogleFonts.outfitTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme(
              brightness: Brightness.dark,
              primary: Colors.black,
              onPrimary: Colors.white,
              secondary: Colors.grey.shade900,
              onSecondary: Colors.white,
              error: Colors.red,
              onError: Colors.white,
              onBackground: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
              background: Colors.grey.shade900),
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.outfitTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: FutureBuilder<bool>(
          future: isLoggedIn(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            // return redirectPage(snapshot.data);
            if (snapshot != null) {
              if (snapshot.data == true) {
                return const HomePage();
              } else if (guest_username != null) {
                return const Scaffold();
              } else {
                return const LoginPage();
              }
            }
            return const Scaffold();
          },
        ));
    // home: SignupPage());
  }
}
