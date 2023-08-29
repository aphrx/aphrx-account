import 'package:account_frontend/tabs/profile.dart';
import 'package:account_frontend/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.transparent,
          child: SideBar(
            callback: (int) {},
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
            padding: const EdgeInsets.all(20), child: const Profile()));
  }
}
