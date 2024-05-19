import 'package:flutter/material.dart';
import 'package:prayerrecorder/pages/mysettings_page.dart';
import 'package:prayerrecorder/services/authentications/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.primary,
                    size: 60,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 10, top: 25),
                child: ListTile(
                  title: const Text("H O M E"),
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 10),
                child: ListTile(
                  title: const Text("S E T T I N G S"),
                  leading: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MySettingsPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 25),
            child: ListTile(
              title: const Text("L O G O  O U T"),
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.primary,
              ),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }

  void logout() {
    AuthService auth = AuthService();
    auth.signout();
  }
}
