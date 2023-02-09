import 'package:flutter/material.dart';
import 'package:flutter_application_1/aboutUs.dart';
import 'package:flutter_application_1/privacy_policy.dart';
import 'package:flutter_application_1/terms_conditions.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("EZ SOFT"),
            accountEmail: Text("SOFTBERRY PVT LTD"),
            currentAccountPicture: CircleAvatar(
              child: Text("EZ"),
              backgroundColor: Colors.white,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.pages_rounded),
            title: const Text("Terms & Conditions"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const terms_conditoins(),
                ),
              );
            },
            selected: true,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text("Privacy Policy"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Privacy_Policy(),
                ),
              );
            },
            selected: true,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outlined),
            title: const Text("About Us"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const aboutUs(),
                ),
              );
            },
            selected: true,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
