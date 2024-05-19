import 'package:flutter/material.dart';
import 'package:prayerrecorder/components/my_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("MONTHS RECORDS LIST"),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Container(
        color: Colors.green,
      ),
      drawer: const MyDrawer(),
    );
  }
}
