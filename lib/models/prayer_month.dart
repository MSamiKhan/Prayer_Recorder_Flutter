class PrayerMonth {
  late final String prayermonth;
  late int totalprayers;
  late int offeredprayers;

  PrayerMonth({
    required this.prayermonth,
    required this.totalprayers,
    required this.offeredprayers,
  });

  PrayerMonth.fromMap(Map<String, dynamic> monthData) {
    prayermonth = monthData["prayermonth"];
    totalprayers = monthData["totalprayers"];
    offeredprayers = monthData["offeredprayers"];
  }

  Map<String, dynamic> toMap() {
    return {
      "prayermonth": prayermonth,
      "totalprayers": totalprayers,
      "offeredprayers": offeredprayers,
    };
  }
}
