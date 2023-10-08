import 'package:account_frontend/api/profile.dart';
import 'package:account_frontend/utils/models.dart';
import 'package:flutter/material.dart';

class DeleteLink extends StatefulWidget {
  int id;

  DeleteLink({Key? key, required this.id}) : super(key: key);

  @override
  State<DeleteLink> createState() => _EditUserState();
}

class _EditUserState extends State<DeleteLink> {
  void toggleDeleteLink() async {
    final res = await DeleteLinkAPI(widget.id);
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
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Are you sure you would like to remove this link?",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
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
                      toggleDeleteLink();
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
