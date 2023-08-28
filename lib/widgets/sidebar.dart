import 'package:account_frontend/widgets/desktop_button.dart';
import 'package:flutter/material.dart';

typedef Callback = void Function(int val);

class SideBar extends StatelessWidget {
  const SideBar({Key? key, required this.callback}) : super(key: key);

  final Callback callback;

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
                      child:
                          //  Image.asset(
                          //   'assets/images/logo.png',
                          //   width: 80,
                          // )
                          const Text("aphrx.",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -2))),
                  const Divider(),
                  DesktopButton(
                      buttonIcon: const Icon(
                        Icons.person_2_outlined,
                        color: Colors.black,
                        size: 24.0,
                        semanticLabel: 'Profile icon',
                      ),
                      buttonText: const Text("Profile",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          textAlign: TextAlign.center),
                      onPressed: () => callback(0)),
                  DesktopButton(
                      buttonIcon: const Icon(
                        Icons.apps,
                        color: Colors.black,
                        size: 24.0,
                        semanticLabel: 'App icon',
                      ),
                      buttonText: const Text("Apps",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          textAlign: TextAlign.center),
                      onPressed: () => callback(1)),
                  DesktopButton(
                    buttonIcon: const Icon(
                      Icons.settings_outlined,
                      color: Colors.black,
                      size: 24.0,
                      semanticLabel: 'Settings icon',
                    ),
                    buttonText: const Text("Settings",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        textAlign: TextAlign.center),
                    onPressed: () => callback(2),
                  ),
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
                      onPressed: () => null)
                ],
              ))),
    );
  }
}
