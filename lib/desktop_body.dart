import 'package:account_frontend/desktop_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 10, 20),
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
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(20),
                          child:
                              //  Image.asset(
                              //   'assets/images/logo.png',
                              //   width: 80,
                              // )
                              Text("aphrx.",
                                  style: GoogleFonts.outfit(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: -2))),
                      new Divider(),
                      DesktopButton(
                          buttonIcon: Icon(
                            Icons.person_2_outlined,
                            color: Colors.black,
                            size: 24.0,
                            semanticLabel: 'Profile icon',
                          ),
                          buttonText: Text("Profile",
                              style: GoogleFonts.outfit(
                                  fontSize: 16, color: Colors.black),
                              textAlign: TextAlign.center)),
                      DesktopButton(
                          buttonIcon: Icon(
                            Icons.apps,
                            color: Colors.black,
                            size: 24.0,
                            semanticLabel: 'App icon',
                          ),
                          buttonText: Text("Apps",
                              style: GoogleFonts.outfit(
                                  fontSize: 16, color: Colors.black),
                              textAlign: TextAlign.center)),
                      DesktopButton(
                          buttonIcon: Icon(
                            Icons.settings_outlined,
                            color: Colors.black,
                            size: 24.0,
                            semanticLabel: 'Settings icon',
                          ),
                          buttonText: Text("Settings",
                              style: GoogleFonts.outfit(
                                  fontSize: 16, color: Colors.black),
                              textAlign: TextAlign.center)),
                      // DesktopButton(
                      // DesktopButton(
                      //     buttonImg: 'assets/images/home.png',
                      //     buttonText: "Apps"),
                      // DesktopButton(
                      //     buttonImg: 'assets/images/home.png',
                      //     buttonText: "Settings"),
                      Expanded(child: Container()),
                      new Divider(),
                      DesktopButton(
                          buttonIcon: Icon(
                            Icons.logout_outlined,
                            color: Colors.red,
                            size: 24.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                          buttonText: Text("Logout",
                              style: GoogleFonts.outfit(
                                  fontSize: 16, color: Colors.red),
                              textAlign: TextAlign.center))
                    ],
                  ))),
        ),
        Expanded(
          flex: 7,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      height: 200,
                      color: Colors.grey.shade800,
                      child: SizedBox(
                          height: 700,
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100)),
                              child: Image.asset('assets/images/avatar.png',
                                  fit: BoxFit.cover))))
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
