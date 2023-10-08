import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileLinks extends StatelessWidget {
  const ProfileLinks(
      {Key? key,
      required this.title,
      required this.body,
      required this.destination,
      required this.image})
      : super(key: key);

  final String title;
  final String body;
  final String destination;
  final String image;

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(destination))) {
      throw Exception('Could not launch $Uri.parse(destination)');
    }
  }

  Image linkImage(String url) {
    if (url != null && url != '') {
      return Image.network(url, fit: BoxFit.cover);
    }
    return Image.asset("assets/images/avatar.png", fit: BoxFit.cover);

    // return Image.network(src)
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => {print("click"), _launchUrl()},
        child: Container(
            // width: double.infinity,
            width: 350,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.all(10),
            height: 70,
            child: Row(
              children: [
                SizedBox(width: 50, child: linkImage(image)),
                const SizedBox(width: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(body)
                ])
              ],
            )));
  }
}
