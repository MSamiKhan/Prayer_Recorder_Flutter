class PrayerDay {
  final String prayerDate;
  final int prayersCount;
  final Map<String, bool> prayersData;

  const PrayerDay({
    required this.prayerDate,
    required this.prayersCount,
    required this.prayersData,
  });

  Map<String, dynamic> toMap() {
    return {
      "prayerDate": prayerDate,
      "prayersCount": prayersCount,
      "prayersData": prayersData,
    };
  }
}
