import 'dart:convert';

import 'package:account_frontend/api/apps.dart';
import 'package:account_frontend/api/auth.dart';
import 'package:account_frontend/api/settings.dart';
import 'package:account_frontend/screens/account_mgmt/desktop_body.dart';
import 'package:account_frontend/screens/account_mgmt/mobile_body.dart';
import 'package:account_frontend/utils/models.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var user;
  var about;
  var links;
  var availableApps;
  var unavailableApps;
  var settingsList;
  var tabIndex = 0;

  void changeIndex(int ind) {
    setState(() => tabIndex = ind);
  }

  getUserDetails() async {
    final res = await GetUser();
    var userObj = User.fromJson(jsonDecode(res.body));

    setState(() {
      user = userObj;
    });
  }

  getAboutDetails() async {
    final aboutRes = await GetAbout();
    var aboutObj = ProfileModule.fromJson(jsonDecode(aboutRes.body));
    setState(() {
      about = aboutObj;
    });
  }

  getLinksDetails() async {
    final linksRes = await GetLinks();
    Iterable iterable = jsonDecode(linksRes.body);
    List<ProfileModule> linksObj = List<ProfileModule>.from(
        iterable.map((e) => ProfileModule.fromJson(e)));
    setState(() {
      links = linksObj;
    });
  }

  getAvailableApps() async {
    final appsRes = await GetAppsAPI(true);
    Iterable iterable = jsonDecode(appsRes.body);
    List<App> appsObj = List<App>.from(iterable.map((e) => App.fromJson(e)));
    setState(() {
      availableApps = appsObj;
    });
  }

  getUnavailableApps() async {
    final appsRes = await GetAppsAPI(false);
    Iterable iterable = jsonDecode(appsRes.body);
    List<App> appsObj = List<App>.from(iterable.map((e) => App.fromJson(e)));
    setState(() {
      unavailableApps = appsObj;
    });
  }

  getSettings() async {
    final settingsRes = await GetSettingsAPI();
    Iterable iterableSettings = jsonDecode(settingsRes.body);
    List<Setting> settingsObj =
        List<Setting>.from(iterableSettings.map((e) => Setting.fromJson(e)));

    setState(() {
      settingsList = settingsObj;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserDetails();
    getAboutDetails();
    getLinksDetails();
    // getAvailableApps();
    // getUnavailableApps();
    // getSettings();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return Scaffold(
            body: MobileBody(
                user: user,
                about: about,
                links: links,
                availableApps: availableApps,
                unavailableApps: unavailableApps,
                settingsList: settingsList,
                tabIndex: tabIndex,
                changeIndex: changeIndex));
      } else {
        return Scaffold(
            body: DesktopBody(
                user: user,
                about: about,
                links: links,
                availableApps: availableApps,
                unavailableApps: unavailableApps,
                settingsList: settingsList,
                tabIndex: tabIndex,
                changeIndex: changeIndex));
      }
    });
    //   return Scaffold(
    //       body: ResponsiveLayout(
    //     mobileBody: ,
    //     desktopBody: );
    // }
  }
}
