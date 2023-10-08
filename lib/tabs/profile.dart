import 'package:account_frontend/dialog/add_link.dart';
import 'package:account_frontend/dialog/delete_link.dart';
import 'package:account_frontend/dialog/edit_about.dart';
import 'package:account_frontend/dialog/edit_user.dart';
import 'package:account_frontend/widgets/profile_links.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  var user;
  var about;
  var links;

  Profile({
    Key? key,
    required this.user,
    required this.about,
    required this.links,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isEditing = false;

  Image profileImage(String url) {
    if (url != null && url != '') {
      return Image.network(url, fit: BoxFit.cover);
    }
    return Image.asset("assets/images/avatar.png", fit: BoxFit.cover);

    // return Image.network(src)
  }

  void toggleEditProfile() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  Container editProfileScreen() {
    return Container(
        height: double.infinity,
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 150,
                  width: 150,
                  child: SizedBox(
                      width: 150,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: profileImage(widget.user.avatarUrl))),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 40),
                      Text(widget.user.firstName + " " + widget.user.lastName,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w800)),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return EditUser(user: widget.user);
                            }),
                      )
                    ]),
                const SizedBox(height: 20),

                Text(widget.user.bio),

                const SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 40),
                      const Text("About",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      IconButton(
                          onPressed: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return EditAbout(aboutText: widget.about.body);
                              }),
                          icon: Icon(Icons.edit, size: 20))
                    ]),

                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.about.body,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 40),
                      const Text("Links",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      IconButton(
                          onPressed: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddLink();
                              }),
                          icon: const Icon(Icons.add, size: 20))
                    ]),
                const SizedBox(height: 20),
                for (var link in widget.links)
                  Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 40),
                          ProfileLinks(
                              title: link.title,
                              body: link.body,
                              destination: link.destinationUrl,
                              image: link.imageUrl),
                          IconButton(
                              onPressed: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return DeleteLink(id: link.id);
                                  }),
                              icon: const Icon(Icons.delete, size: 20))
                        ]),
                    const SizedBox(height: 20)
                  ]),

                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => toggleEditProfile(),
                  child: Text(editText(),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.blue.shade800)),
                ),

                // TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
            )));
  }

  Container displayProfileScreen() {
    return Container(
        height: double.infinity,
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 150,
                  width: 150,
                  child: SizedBox(
                      height: 150,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: profileImage(widget.user.avatarUrl))),
                ),
                Text(widget.user.firstName + " " + widget.user.lastName,
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
                const SizedBox(height: 20),

                Text(widget.user.bio),

                const SizedBox(height: 20),
                const Text("About",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.about.body,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                const Text("Links",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                for (var link in widget.links)
                  Column(children: [
                    ProfileLinks(
                        title: link.title,
                        body: link.body,
                        destination: link.destinationUrl,
                        image: link.imageUrl),
                    const SizedBox(height: 20)
                  ]),

                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => toggleEditProfile(),
                  child: Text(editText(),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.blue.shade800)),
                ),

                // TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
            )));
  }

  String editText() {
    if (isEditing == false) {
      return "Edit Profile";
    } else {
      return "Done";
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isEditing) {
      return editProfileScreen();
    } else {
      return displayProfileScreen();
    }
  }
}
