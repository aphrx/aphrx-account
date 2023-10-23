import 'package:account_frontend/tabs/apps.dart';
import 'package:account_frontend/tabs/profile.dart';
// import 'package:account_frontend/tabs/settings.dart';
import 'package:account_frontend/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class MobileBody extends StatefulWidget {
  var user;
  var about;
  var links;
  var availableApps;
  var unavailableApps;
  var settingsList;
  var tabIndex;
  var changeIndex;

  MobileBody(
      {Key? key,
      required this.user,
      required this.about,
      required this.links,
      required this.availableApps,
      required this.unavailableApps,
      required this.settingsList,
      required this.tabIndex,
      required this.changeIndex})
      : super(key: key);

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  // int currIndex = 0;

  Widget contentSwitch(currIndex) {
    if (widget.user != null) {
      if (widget.tabIndex == 0) {
        return Profile(
            user: widget.user, about: widget.about, links: widget.links);
      }
      if (currIndex == 1) {
        return Apps(
            gridAxis: 1,
            availableApps: widget.availableApps,
            unavailableApps: widget.unavailableApps);
        // }
        // if (currIndex == 2) {
        //   return SettingsTab(gridAxis: 1, settingsList: widget.settingsList);
      } else {
        return const Placeholder();
      }
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.transparent,
          child: SideBar(
            callback: widget.changeIndex,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
            // padding: const EdgeInsets.all(20),
            child: contentSwitch(widget.tabIndex)));
  }
}
