import 'package:account_frontend/api/auth.dart';
import 'package:account_frontend/screens/account_mgmt/home_page.dart';
import 'package:account_frontend/screens/login_page.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  void registerClick() async {
    final res = await Register(usernameController.text, passwordController.text,
        firstNameController.text, lastNameController.text);
    if (res.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    } else {
      print('Error Code: ' + res.statusCode);
      print(res.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Container(
                    padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.5),
                        //     spreadRadius: 5,
                        //     blurRadius: 7,
                        //     offset: const Offset(
                        //         0, 3), // changes position of shadow
                        //   ),
                        // ],
                        // color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(5)),
                    width: 500,
                    height: 800,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Create an account',
                              style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 24,
                                  color: Colors.black)),
                          const SizedBox(height: 20),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextField(
                                    controller: firstNameController,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'First Name'),
                                  ))),
                          const SizedBox(height: 20),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextField(
                                    controller: lastNameController,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Last Name'),
                                  ))),
                          const SizedBox(height: 20),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextField(
                                    controller: usernameController,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Username'),
                                  ))),
                          const SizedBox(height: 20),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextField(
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Password'),
                                  ))),
                          const SizedBox(height: 20),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextField(
                                    controller: confirmPasswordController,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Confirm Password'),
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
                                onPressed: () => registerClick(),
                                child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        60, 15, 60, 15),
                                    child: const Text("Create account")),
                              )),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account? "),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()));
                                },
                                child: Text("Sign in",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blue.shade800)),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Divider(),
                          const SizedBox(height: 20),
                          const Text(
                              "By creating an Aphrx account, you agree to our terms and conditions.",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 11))
                        ])))));
  }
}
