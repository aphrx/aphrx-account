import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.all(10),
        height: 70,
        child: Row(
          children: [
            Container(width: 50, child: Placeholder()),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Aphrx Drive",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text("A safe space to store all your files on the cloud!")
            ])
          ],
        ));
  }
}
