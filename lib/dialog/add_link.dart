import 'package:account_frontend/api/profile.dart';
import 'package:account_frontend/utils/models.dart';
import 'package:flutter/material.dart';

class AddLink extends StatefulWidget {
  AddLink({Key? key}) : super(key: key);

  @override
  State<AddLink> createState() => _AddLinkState();
}

class _AddLinkState extends State<AddLink> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController destinationUrlController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    bodyController.dispose();
    imageUrlController.dispose();
    destinationUrlController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
  }

  void toggleAddLink() async {
    final res = await AddLinkAPI(titleController.text, bodyController.text,
        destinationUrlController.text, imageUrlController.text);
    if (res.statusCode == 200) {
      Navigator.of(context, rootNavigator: true).pop();
    } else {
      print('Error Code: ' + res.statusCode);
      print(res.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)), //this right here
      child: Container(
        width: 400,
        height: 350,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        maxLines: 1,
                        controller: titleController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Title'),
                      ))),
              const SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        maxLines: 1,
                        controller: bodyController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Description'),
                      ))),
              const SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        maxLines: 1,
                        controller: destinationUrlController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Destination URL'),
                      ))),
              const SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        maxLines: 1,
                        controller: imageUrlController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Image URL'),
                      ))),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {
                      toggleAddLink();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
