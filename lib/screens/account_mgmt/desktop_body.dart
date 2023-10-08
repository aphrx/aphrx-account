import 'package:account_frontend/tabs/apps.dart';
import 'package:account_frontend/tabs/profile.dart';
import 'package:account_frontend/tabs/settings.dart';
import 'package:account_frontend/utils/models.dart';
import 'package:account_frontend/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class DesktopBody extends StatefulWidget {
  var user;
  var about;
  var links;
  var availableApps;
  var unavailableApps;
  var settingsList;

  DesktopBody(
      {Key? key,
      required this.user,
      required this.about,
      required this.links,
      required this.availableApps,
      required this.unavailableApps,
      required this.settingsList})
      : super(key: key);

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  int currIndex = 0;

  Widget contentSwitch(currIndex) {
    if (widget.user != null) {
      if (currIndex == 0) {
        return Profile(
            user: widget.user, about: widget.about, links: widget.links);
      }
      if (currIndex == 1)
        return Apps(
            gridAxis: 3,
            availableApps: widget.availableApps,
            unavailableApps: widget.unavailableApps);
      if (currIndex == 2) {
        print(widget.settingsList);
        return SettingsTab(gridAxis: 3, settingsList: widget.settingsList);
      } else {
        return const Placeholder();
      }
    } else {
      return Container();
    }
  }

  void changeIndex(int ind) {
    setState(() => currIndex = ind);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SideBar(callback: changeIndex),
        Expanded(
          flex: 7,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 10, 10),
              child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: contentSwitch(currIndex))),
        ),
      ],
    );
  }
}
