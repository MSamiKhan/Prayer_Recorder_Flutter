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
      child: ListTile(
        title: Text(prayerMonth.prayermonth),
        trailing: Text(
          "${prayerMonth.offeredprayers} / ${prayerMonth.totalprayers}",
        ),
      ),
    );
  }
}
