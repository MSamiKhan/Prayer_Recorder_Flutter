import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prayerrecorder/firebase_options.dart';
import 'package:prayerrecorder/services/authentications/auth_gate.dart';
import 'package:prayerrecorder/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      home: const AuthGate(),
    );
  }
}
