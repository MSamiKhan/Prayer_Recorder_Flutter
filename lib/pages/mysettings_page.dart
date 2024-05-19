import 'package:prayerrecorder/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySettingsPage extends StatelessWidget {
  const MySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("SETTINGS"),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Dark Mode"),
            CupertinoSwitch(
              value: Provider.of<ThemeProvider>(context, listen: false).isDark,
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme(),
            ),
          ],
        ),
      ),
    );
  }
}
