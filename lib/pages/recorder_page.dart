import 'package:flutter/material.dart';
import 'package:prayerrecorder/components/day_tile.dart';
import 'package:prayerrecorder/models/prayer_day.dart';
import 'package:prayerrecorder/services/prayers/prayer_service.dart';

class RecorderPage extends StatefulWidget {
  final int year;
  final int month;
  final int days;
  const RecorderPage({
    super.key,
    required this.year,
    required this.month,
    required this.days,
  });

  @override
  State<RecorderPage> createState() => _RecorderPageState();
}

class _RecorderPageState extends State<RecorderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/app-logo.png",
              height: 200,
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: _initialDaysList(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _initialDaysList() {
    List<Widget> daysTiles = [];
    for (int i = 1; i <= widget.days; i++) {
      DateTime prayerDate = DateTime(widget.year, widget.month, i);
      Map<String, bool> prayersData = {
        "Fajr": false,
        "Dhuhr": false,
        "Asr": false,
        "Magrib": false,
        "Isha": false,
      };
      PrayerDay prayerDay = PrayerDay(
          prayerDate: prayerDate.toString(),
          prayersCount: 0,
          prayersData: prayersData);
      PrayerService().saveDayData(prayerDay);
      daysTiles.add(
        DayTile(
          prayerDay: prayerDay,
        ),
      );
    }
    return daysTiles;
  }
}
