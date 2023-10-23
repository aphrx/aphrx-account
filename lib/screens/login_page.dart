import 'package:account_frontend/api/auth.dart';
import 'package:account_frontend/screens/account_mgmt/home_page.dart';
import 'package:account_frontend/screens/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void loginClick() async {
    final res = await Login(usernameController.text, passwordController.text);
    if (res.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      print('Error Code: ' + res.statusCode);
      print(res.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
            child: Center(
                child: Container(
                    padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    width: 500,
                    height: 500,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Sign in',
                              style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 24,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary)),
                          const SizedBox(height: 20),
                          Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextField(
                                    cursorColor:
                                        Theme.of(context).colorScheme.onPrimary,
                                    controller: usernameController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Username'),
                                  ))),
                          const SizedBox(height: 20),
                          Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextField(
                                    cursorColor:
                                        Theme.of(context).colorScheme.onPrimary,
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        fillColor: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        border: InputBorder.none,
                                        hintText: 'Password'),
                                  ))),
                          const SizedBox(height: 20),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blue.shade800,
                                    minimumSize: const Size.fromHeight(50),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    )),
                                onPressed: () => loginClick(),
                                child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        60, 15, 60, 15),
                                    child: const Text("Sign in",
                                        style: TextStyle(color: Colors.white))),
                              )),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("New to Aphrx? ",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary)),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignupPage()));
                                },
                                child: Text("Create account",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blue.shade800)),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Divider(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withOpacity(0.2)),
                          const SizedBox(height: 20),
                          Text("Trouble signing in?",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary))
                        ])))));
  }
}
