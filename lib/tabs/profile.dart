import 'package:account_frontend/widgets/profile_links.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  var user;
  Profile({Key? key, required user}) : super(key: key);

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
        Text(user, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
        const Text(
          "Software Developer with a YouTube channel",
        ),

        const SizedBox(height: 20),
        const Text("About",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

        const SizedBox(height: 20),
        const SizedBox(
          width: 500,
          child: Text(
              "Hey! Welcome to my profile. My name is Amal and I am a Software Developer and a YouTuber. My current series is all about Ecosystems so check them out!"),
        ),
        const SizedBox(height: 20),
        const Text("Links",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),

        const ProfileLinks(
            title: "Instagram", body: "View all my pictures here!"),
        const SizedBox(height: 20),

        const ProfileLinks(
            title: "Website", body: "Check out my amazing website!"),
        const SizedBox(height: 20),

        const ProfileLinks(
            title: "YouTube", body: "I have a YouTube channel as well!"),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () => null,
          child: Text("Edit Profile",
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.blue.shade800)),
        ),

        // TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}
