import 'package:account_frontend/screens/account_mgmt/desktop_body.dart';
import 'package:account_frontend/screens/account_mgmt/mobile_body.dart';
import 'package:account_frontend/screens/account_mgmt/responsive_layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: ResponsiveLayout(
      mobileBody: MobileBody(),
      desktopBody: DesktopBody(),
    ));
  }
}
