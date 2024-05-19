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
              children: _initialMonthsList(),
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }

  List<Widget> _initialMonthsList() {
    List<Widget> monthsTiles = [];
    for (int i = 1; i <= DateTime.monthsPerYear; i++) {
      int daysInMonth = _getDaysInMonth(DateTime.now().year, i);

      PrayerMonth prayerMonth = PrayerMonth(
        prayermonth: _getMonthName(i),
        totalprayers: daysInMonth * 5,
        offeredprayers: 0,
      );
      PrayerService().saveMonthData(prayerMonth);
      monthsTiles.add(
        MonthTile(
          prayerMonth: prayerMonth,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RecorderPage(
                  year: DateTime.now().year,
                  month: i,
                  days: daysInMonth,
                ),
              ),
            );
          },
        ),
      );
    }
    return monthsTiles;
  }

  // Widget _buildMonthsList() {
  //   return StreamBuilder(
  //     stream: PrayerService().getMonthsData(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasError) {
  //         return Center(
  //           child: Column(
  //             children: [
  //               Icon(
  //                 Icons.error,
  //                 size: 60,
  //                 color: Theme.of(context).colorScheme.primary,
  //               ),
  //               Text(
  //                 "Error: Unable to load the data.",
  //                 style: TextStyle(
  //                   fontSize: 20,
  //                   color: Theme.of(context).colorScheme.primary,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       }
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(
  //           child: CircularProgressIndicator(
  //             backgroundColor: Theme.of(context).colorScheme.primary,
  //             color: Theme.of(context).colorScheme.inversePrimary,
  //           ),
  //         );
  //       }
  //       return ListView(
  //         children: snapshot.data!
  //             .map<Widget>(
  //                 (monthData) => _buildMonthListItem(monthData, context))
  //             .toList(),
  //       );
  //     },
  //   );
  // }

  // Widget _buildMonthListItem(
  //     Map<String, dynamic> monthData, BuildContext context) {
  //   return MonthTile(
  //     prayerMonth: PrayerMonth.fromMap(monthData),
  //     onTap: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const RecorderPage(),
  //         ),
  //       );
  //     },
  //   );
  // }

  int _getDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      final bool isLeapYear =
          (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      return isLeapYear ? 29 : 28;
    }
    const List<int> daysInMonth = <int>[
      31,
      -1,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];
    return daysInMonth[month - 1];
  }

  String _getMonthName(int monthNumber) {
    List<String> monthslist = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return monthslist[monthNumber - 1];
  }
}
