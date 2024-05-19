import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prayerrecorder/models/prayer_day.dart';

// ignore: must_be_immutable
class DayTile extends StatefulWidget {
  late PrayerDay prayerDay;
  DayTile({super.key, required this.prayerDay});

  @override
  State<DayTile> createState() => _DayTileState();
}

class _DayTileState extends State<DayTile> {
  late List<String> prayers;
  late List<bool> prayersvals;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prayers = widget.prayerDay.prayersData.keys
        .map((value) => value.toUpperCase())
        .toList();
    prayersvals = widget.prayerDay.prayersData.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    DateTime prayerDate = DateTime.parse(widget.prayerDay.prayerDate);
    return Card(
      elevation: 10,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat(DateFormat.WEEKDAY).format(prayerDate),
                  style: style,
                ),
                Text(
                  "Prayers Offered : ${_prayerCount(prayersvals)}",
                  style: style,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  prayers[0],
                  style: style,
                ),
                Text(
                  prayers[1],
                  style: style,
                ),
                Text(
                  prayers[2],
                  style: style,
                ),
                Text(
                  prayers[3],
                  style: style,
                ),
                Text(
                  prayers[4],
                  style: style,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Checkbox(
                  value: prayersvals[0],
                  checkColor: Theme.of(context).colorScheme.secondary,
                  onChanged: (newValue) {
                    setState(() {
                      prayersvals[0] = newValue!;
                    });
                  },
                ),
                Checkbox(
                  value: prayersvals[1],
                  checkColor: Theme.of(context).colorScheme.secondary,
                  onChanged: (newValue) {
                    setState(() {
                      prayersvals[1] = newValue!;
                    });
                  },
                ),
                Checkbox(
                  value: prayersvals[2],
                  checkColor: Theme.of(context).colorScheme.secondary,
                  onChanged: (newValue) {
                    setState(() {
                      prayersvals[2] = newValue!;
                    });
                  },
                ),
                Checkbox(
                  value: prayersvals[3],
                  checkColor: Theme.of(context).colorScheme.secondary,
                  onChanged: (newValue) {
                    setState(() {
                      prayersvals[3] = newValue!;
                    });
                  },
                ),
                Checkbox(
                  value: prayersvals[4],
                  checkColor: Theme.of(context).colorScheme.secondary,
                  onChanged: (newValue) {
                    setState(() {
                      prayersvals[4] = newValue!;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  int _prayerCount(List<bool> prayersvals) {
    int counter = 0;
    for (var prayer in prayersvals) {
      if (prayer == true) {
        counter++;
      }
    }
    return counter;
  }
}
