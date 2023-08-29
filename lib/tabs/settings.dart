import 'package:account_frontend/widgets/setting_card.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        const Text("General Settings",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SettingCard(title: 'Dark Mode', body: 'Disable'),
            SettingCard(title: 'Coloured Sidebar', body: 'Disable'),
            SettingCard(title: 'Language', body: 'English'),
            SettingCard(title: 'Country', body: 'Canada')
          ],
        )
      ],
    );
  }
}
