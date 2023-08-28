import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          height: 150,
          child: SizedBox(
              height: 700,
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100)),
                  child: Image.asset('assets/images/avatar.png',
                      fit: BoxFit.cover))),
        ),
        Text("Amal Parameswaran",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
        Text(
          "Software Developer with a YouTube channel",
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Placeholder(), Placeholder()],
        )
        // TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}
