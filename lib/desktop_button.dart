import 'package:account_frontend/login_page.dart';
import 'package:flutter/material.dart';

class DesktopButton extends StatelessWidget {
  final Widget buttonIcon;
  final Widget buttonText;

  DesktopButton({required this.buttonIcon, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 10),
      TextButton(
        style: TextButton.styleFrom(
            primary: Colors.white,
            foregroundColor: Colors.blue.shade800,
            minimumSize: const Size.fromHeight(50),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        child: Container(
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Image.asset(
                //   buttonImg,
                //   width: 20,
                // ),
                buttonIcon,

                const SizedBox(width: 10),
                buttonText
              ],
            )),
      )
    ]);
  }
}
