import 'package:account_frontend/widgets/desktop_button.dart';
import 'package:flutter/material.dart';

typedef Callback = void Function(int val);

class SideBar extends StatelessWidget {
  const SideBar({Key? key, required this.callback}) : super(key: key);

  final void Function(int) callback;

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
                            const TextSpan(
                                text: "phrx",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -2)),
                            TextSpan(
                                text: ".",
                                style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.blue.shade800,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -2)),
                            // TextSpan(
                            //     text: "account",
                            //     style: TextStyle(
                            //         fontSize: 30,
                            //         color: Colors.blue.shade800,
                            //         fontWeight: FontWeight.w800,
                            //         letterSpacing: -2))
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
                      onPressed: () => callback(0),
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: const Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Image.asset(
                              //   buttonImg,
                              //   width: 20,
                              // ),
                              Icon(
                                Icons.person_2_outlined,
                                color: Colors.black,
                                size: 24.0,
                                semanticLabel: 'Profile icon',
                              ),

                              SizedBox(width: 10),
                              Text("Profile",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
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
                      onPressed: () => callback(1),
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: const Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Image.asset(
                              //   buttonImg,
                              //   width: 20,
                              // ),
                              Icon(
                                Icons.apps,
                                color: Colors.black,
                                size: 24.0,
                                semanticLabel: 'App icon',
                              ),

                              SizedBox(width: 10),
                              Text("Apps",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
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
                      onPressed: () => callback(2),
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: const Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Image.asset(
                              //   buttonImg,
                              //   width: 20,
                              // ),
                              Icon(
                                Icons.settings_outlined,
                                color: Colors.black,
                                size: 24.0,
                                semanticLabel: 'Settings icon',
                              ),

                              SizedBox(width: 10),
                              Text("Settings",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
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
                      pressed: () => null)
                ],
              ))),
    );
  }
}
