import 'package:account_frontend/widgets/card.dart';
import 'package:flutter/material.dart';

class Apps extends StatelessWidget {
  int gridAxis;
  var availableApps;
  var unavailableApps;

  Apps(
      {Key? key,
      required this.gridAxis,
      required this.availableApps,
      required this.unavailableApps})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
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
                                border: InputBorder.none,
                                hintText: 'Search...'),
                          ))),
                  const SizedBox(height: 20),
                  // Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Available Apps",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),

                  GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      crossAxisCount: gridAxis,
                      crossAxisSpacing: 20,
                      childAspectRatio: 4,
                      children: [
                        for (var app in availableApps)
                          CardWidget(
                              title: app.title,
                              body: app.body,
                              imageUrl: app.imageUrl,
                              destinationUrl: app.destinationUrl)
                      ]),

                  SizedBox(height: 20),
                  Text("Unavailable Apps",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [

                  GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      crossAxisCount: gridAxis,
                      crossAxisSpacing: 20,
                      childAspectRatio: 4,
                      children: [
                        for (var app in unavailableApps)
                          CardWidget(
                              title: app.title,
                              body: app.body,
                              imageUrl: app.imageUrl,
                              destinationUrl: app.destinationUrl)
                      ]),
                  //   ],
                  // )
                  // ]),
                ])));
  }
}
