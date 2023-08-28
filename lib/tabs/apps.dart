import 'package:account_frontend/widgets/app_card.dart';
import 'package:flutter/material.dart';

class Apps extends StatelessWidget {
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
      SizedBox(height: 20),
      Row(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Available Apps",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            AppCard()
          ]),
          Column(
            children: [],
          )
        ],
      )
    ]);
  }
}
