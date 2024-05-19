import 'package:flutter/material.dart';
import 'package:prayerrecorder/components/month_tile.dart';
import 'package:prayerrecorder/components/my_drawer.dart';
import 'package:prayerrecorder/models/prayer_month.dart';
import 'package:prayerrecorder/pages/recorder_page.dart';
import 'package:prayerrecorder/services/prayers/prayer_service.dart';

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
        centerTitle: true,
        title: const Text("MONTHS RECORDS LIST"),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: _buildMonthsList(),
      drawer: const MyDrawer(),
    );
  }

  Widget _buildMonthsList() {
    return StreamBuilder(
      stream: PrayerService().getMonthsData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Icon(
                  Icons.error,
                  size: 60,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  "Error: Unable to load the user.",
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).colorScheme.primary,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          );
        }
        return ListView(
          children: snapshot.data!
              .map<Widget>(
                  (monthData) => _buildMonthListItem(monthData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildMonthListItem(
      Map<String, dynamic> monthData, BuildContext context) {
    return MonthTile(
      prayerMonth: PrayerMonth.fromMap(monthData),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RecorderPage(),
          ),
        );
      },
    );
  }
}
