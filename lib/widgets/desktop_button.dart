import 'package:flutter/material.dart';

class DesktopButton extends StatelessWidget {
  final Widget buttonIcon;
  final Widget buttonText;
  final Function pressed;

  const DesktopButton(
      {Key? key,
      required this.buttonIcon,
      required this.buttonText,
      required this.pressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
        onPressed: () => pressed,
        child: Container(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
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
