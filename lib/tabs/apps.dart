import 'package:account_frontend/widgets/app_card.dart';
import 'package:flutter/material.dart';

class Apps extends StatelessWidget {
  const Apps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5)),
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Search...'),
              ))),
      const SizedBox(height: 20),
      const Column(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Available Apps",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            AppCard(
              title: "Aphrx Drive",
              body: "A space to store all your files on the cloud!",
            ),
            SizedBox(height: 20),
            Text("Unavailable Apps",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppCard(
                  title: "Aphrx Mail",
                  body: "A next generation email client!",
                ),
                AppCard(
                  title: "Aphrx Notes",
                  body: "A place to keep all your notes, big or small!",
                ),
                AppCard(
                  title: "Aphrx Social",
                  body: "Yet another Mastodon client?",
                )
              ],
            )
          ]),
        ],
      )
    ]);
  }
}
