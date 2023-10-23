import 'package:account_frontend/api/auth.dart';
import 'package:account_frontend/screens/login_page.dart';
import 'package:account_frontend/widgets/desktop_button.dart';
import 'package:flutter/material.dart';

typedef Callback = void Function(int val);

class SideBar extends StatefulWidget {
  const SideBar({Key? key, required this.callback}) : super(key: key);

  final void Function(int) callback;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  void logoutClick() async {
    print("Logout clicked");
    final res = await Logout();
    if (res.statusCode == 200) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          ModalRoute.withName(
              '/') // Replace this with your root screen's route name (usually '/')
          );
      print("Logging out");
    } else {
      print('Error Code: ' + res.statusCode);
      print(res.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      child: Container(
          width: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).colorScheme.primary,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(20),
                      child: RichText(
                          text: TextSpan(
                              text: "a",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.blue.shade800,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -2),
                              children: [
                            TextSpan(
                                text: "phrx",
                                style: TextStyle(
                                    fontSize: 30,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -2)),
                            TextSpan(
                                text: ".",
                                style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.blue.shade800,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -2)),
                          ]))),
                  const Divider(),
                  Column(children: [
                    const SizedBox(height: 10),
                    TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          foregroundColor: Colors.blue.shade800,
                          minimumSize: const Size.fromHeight(50),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                      onPressed: () => widget.callback(0),
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person_2_outlined,
                                color: Theme.of(context).colorScheme.onPrimary,
                                size: 24.0,
                                semanticLabel: 'Profile icon',
                              ),
                              SizedBox(width: 10),
                              Text("Profile",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                  textAlign: TextAlign.center)
                            ],
                          )),
                    )
                  ]),
                  const SizedBox(height: 10),
                  Expanded(child: Container()),
                  const Divider(),
                  DesktopButton(
                      buttonIcon: const Icon(
                        Icons.logout_outlined,
                        color: Colors.red,
                        size: 24.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                      buttonText: const Text("Logout",
                          style: TextStyle(fontSize: 16, color: Colors.red),
                          textAlign: TextAlign.center),
                      pressed: () => logoutClick())
                ],
              ))),
    );
  }
}

class GuestSideBar extends StatefulWidget {
  const GuestSideBar({Key? key, required this.callback}) : super(key: key);

  final void Function(int) callback;

  @override
  State<GuestSideBar> createState() => _GuestSideBarState();
}

class _GuestSideBarState extends State<GuestSideBar> {
  void logoutClick() async {
    print("Logout clicked");
    final res = await Logout();
    if (res.statusCode == 200) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          ModalRoute.withName(
              '/') // Replace this with your root screen's route name (usually '/')
          );
      print("Logging out");
    } else {
      print('Error Code: ' + res.statusCode);
      print(res.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      child: Container(
          width: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(20),
                      child: RichText(
                          text: TextSpan(
                              text: "a",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.blue.shade800,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -2),
                              children: [
                            TextSpan(
                                text: "phrx",
                                style: TextStyle(
                                    fontSize: 30,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -2)),
                            TextSpan(
                                text: ".",
                                style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.blue.shade800,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -2)),
                          ]))),
                  const Divider(),
                  Column(children: [
                    const SizedBox(height: 10),
                    TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          foregroundColor: Colors.blue.shade800,
                          minimumSize: const Size.fromHeight(50),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                      onPressed: () => widget.callback(0),
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Image.asset(
                              //   buttonImg,
                              //   width: 20,
                              // ),
                              Icon(
                                Icons.person_2_outlined,
                                color: Theme.of(context).colorScheme.onPrimary,
                                size: 24.0,
                                semanticLabel: 'Profile icon',
                              ),

                              SizedBox(width: 10),
                              Text("Profile",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                  textAlign: TextAlign.center)
                            ],
                          )),
                    )
                  ]),
                  Column(children: [
                    const SizedBox(height: 10),
                    TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          foregroundColor: Colors.blue.shade800,
                          minimumSize: const Size.fromHeight(50),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                      onPressed: () => widget.callback(2),
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Image.asset(
                              //   buttonImg,
                              //   width: 20,
                              // ),
                              Icon(
                                Icons.settings_outlined,
                                color: Theme.of(context).colorScheme.onPrimary,
                                size: 24.0,
                                semanticLabel: 'Settings icon',
                              ),

                              SizedBox(width: 10),
                              Text("Settings",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                  textAlign: TextAlign.center)
                            ],
                          )),
                    )
                  ]),
                  Expanded(child: Container()),
                  const Divider(),
                  DesktopButton(
                      buttonIcon: const Icon(
                        Icons.logout_outlined,
                        color: Colors.red,
                        size: 24.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                      buttonText: const Text("Logout",
                          style: TextStyle(fontSize: 16, color: Colors.red),
                          textAlign: TextAlign.center),
                      pressed: () => logoutClick())
                ],
              ))),
    );
  }
}
