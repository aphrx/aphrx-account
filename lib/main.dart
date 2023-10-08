import 'package:account_frontend/api/auth.dart';
import 'package:account_frontend/screens/account_mgmt/home_page.dart';
import 'package:account_frontend/screens/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.outfitTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: FutureBuilder<bool>(
          future: isLoggedIn(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            // return redirectPage(snapshot.data);
            if (snapshot.data == true) {
              return const HomePage();
            } else if (snapshot.data == false) {
              return const LoginPage();
            } else {
              return Container();
            }
          },
        ));
    // home: SignupPage());
  }
}
