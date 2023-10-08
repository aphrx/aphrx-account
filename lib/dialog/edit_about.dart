import 'package:account_frontend/api/profile.dart';
import 'package:account_frontend/utils/models.dart';
import 'package:flutter/material.dart';

class EditAbout extends StatefulWidget {
  String aboutText;

  EditAbout({Key? key, required this.aboutText}) : super(key: key);

  @override
  State<EditAbout> createState() => _EditUserState();
}

class _EditUserState extends State<EditAbout> {
  TextEditingController aboutController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    aboutController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    aboutController.text = widget.aboutText;
  }

  void toggleEditAbout() async {
    final res = await EditAboutAPI(aboutController.text);
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
        height: 190,
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
                        maxLines: 4,
                        minLines: 4,
                        controller: aboutController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Bio'),
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
                      toggleEditAbout();
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
