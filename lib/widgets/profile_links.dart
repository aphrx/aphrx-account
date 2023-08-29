import 'package:flutter/material.dart';

class ProfileLinks extends StatelessWidget {
  const ProfileLinks({Key? key, required this.title, required this.body})
      : super(key: key);

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => null,
        child: Container(
            // width: double.infinity,
            width: 350,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.all(10),
            height: 70,
            child: Expanded(
                child: Row(
              children: [
                const SizedBox(width: 50, child: Placeholder()),
                const SizedBox(width: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(body)
                ])
              ],
            ))));
  }
}
