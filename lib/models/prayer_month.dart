class PrayerMonth {
  late final String userId;
  late final String prayermonth;
  late int totalprayers;
  late int offeredprayers;

  PrayerMonth({
    required this.userId,
    required this.prayermonth,
    required this.totalprayers,
    required this.offeredprayers,
  });

  PrayerMonth.fromMap(Map<String, dynamic> monthData) {
    userId = monthData["userId"];
    prayermonth = monthData["prayermonth"];
    totalprayers = monthData["totalprayers"];
    offeredprayers = monthData["offeredprayers"];
  }

  Map<String, dynamic> toMap() {
    return {
      "userID": userId,
      "prayermonth": prayermonth,
      "totalprayers": totalprayers,
      "offeredprayers": offeredprayers,
    };
  }
}
