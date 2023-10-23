import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardWidget extends StatelessWidget {
  CardWidget(
      {Key? key,
      required this.title,
      required this.body,
      this.imageUrl,
      this.destinationUrl,
      this.destinationFunction})
      : super(key: key);

  final String title;
  final String body;
  var imageUrl;
  var destinationUrl;
  var destinationFunction;

  Future<void> onClick() async {
    if (destinationUrl != null) return _launchUrl();
    if (destinationFunction != null) return _launchFunction();
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(destinationUrl))) {
      throw Exception('Could not launch $Uri.parse(destination)');
    }
  }

  Future<void> _launchFunction() async {
    destinationFunction();
  }

  Widget linkImage() {
    if (imageUrl != null && imageUrl != '') {
      return Image.network(imageUrl, fit: BoxFit.cover);
    }
    return Placeholder();

    // return Image.network(src)
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      InkWell(
          onTap: () => onClick(),
          child: Container(
              width: double.infinity,
              // width: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.all(10),
              // margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              height: 70,
              child: Flexible(
                  child: Row(
                children: [
                  SizedBox(width: 50, child: linkImage()),
                  const SizedBox(width: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Flexible(
                            child: Text(
                          body,
                          overflow: TextOverflow.ellipsis,
                        ))
                      ])
                ],
              )))),
      // const SizedBox(height: 20)
    ]));
  }
}
