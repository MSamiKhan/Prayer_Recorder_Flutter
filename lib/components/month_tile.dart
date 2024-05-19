import 'package:flutter/material.dart';
import 'package:prayerrecorder/models/prayer_month.dart';

class MonthTile extends StatelessWidget {
  final PrayerMonth prayerMonth;
  final void Function() onTap;

  const MonthTile({
    super.key,
    required this.prayerMonth,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          tileColor: Theme.of(context).colorScheme.surface,
          title: Text(
            prayerMonth.prayermonth,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          trailing: Column(
            children: [
              Text(
                "Offered Prayers : ${prayerMonth.offeredprayers}",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Total Prayers : ${prayerMonth.totalprayers}",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
