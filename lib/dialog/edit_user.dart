import 'package:account_frontend/api/profile.dart';
import 'package:account_frontend/utils/models.dart';
import 'package:flutter/material.dart';

class EditUser extends StatefulWidget {
  User user;

  EditUser({Key? key, required this.user}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    firstNameController.dispose();
    lastNameController.dispose();
    bioController.dispose();
    imageUrlController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    firstNameController.text = widget.user.firstName;
    lastNameController.text = widget.user.lastName;
    bioController.text = widget.user.bio;
    imageUrlController.text = widget.user.avatarUrl;
  }

  void toggleEditUser() async {
    final res = await EditUserAPI(firstNameController.text,
        lastNameController.text, bioController.text, imageUrlController.text);
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
        height: 360,
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
                        controller: firstNameController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'First Name'),
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
                        controller: lastNameController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Last Name'),
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
                        controller: bioController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Bio'),
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
                            border: InputBorder.none, hintText: 'Avatar URL'),
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
                      toggleEditUser();
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
