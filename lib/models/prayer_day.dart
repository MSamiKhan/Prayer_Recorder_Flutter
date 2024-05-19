class PrayerDay {
  final String dayNo;
  final String prayerDate;
  final int prayersCount;
  final Map<String, bool> prayersData;

  PrayerDay({
    required this.dayNo,
    required this.prayerDate,
    required this.prayersCount,
    required this.prayersData,
  });

  Map<String, dynamic> toMap() {
    return {
      "dayNo": dayNo,
      "prayerDate": prayerDate,
      "prayersCount": prayersCount,
      "prayersData": prayersData,
    };
  }

  int prayerCount(Map<String, dynamic> prayersData) {
    int counter = 0;
    for (var prayer in prayersData.values) {
      if (prayer == true) {
        counter++;
      }
    }
    return counter;
  }
}
