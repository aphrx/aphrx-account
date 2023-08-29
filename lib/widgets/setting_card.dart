import 'package:flutter/material.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({Key? key, required this.title, required this.body})
      : super(key: key);

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => null,
        child: Container(
            // width: double.infinity,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.all(10),
            height: 70,
            child: Expanded(
                child: Row(
              children: [
                const SizedBox(width: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(body)
                ])
              ],
            ))));
  }
}
