import 'package:flutter/material.dart';
import 'package:prayerrecorder/pages/mylogin_page.dart';
import 'package:prayerrecorder/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const PrayerRecorder(),
    ),
  );
}

class PrayerRecorder extends StatelessWidget {
  const PrayerRecorder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paryer Recorder',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const MyLoginPage(),
    );
  }
}
