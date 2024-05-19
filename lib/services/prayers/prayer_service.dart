import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:prayerrecorder/models/prayer_day.dart';

class PrayerService {
  final String monthsdaysCollection = "MonthsDays";
  final String monthInfoDoc = "MonthInfo";

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> getMonthsData() {
    String currentUserID = _auth.currentUser!.uid;
    DateTime currentDate = DateTime.now();
    return _firestore
        .collection(currentUserID)
        .doc(DateFormat(DateFormat.MONTH).format(currentDate))
        .collection(monthsdaysCollection)
        .snapshots()
        .map(
      (snapshot) {
        return snapshot.docs
            .where((doc) => doc.id == monthInfoDoc)
            .map((doc) => doc.data())
            .toList();
      },
    );
  }

  Stream<List<Map<String, dynamic>>> getMonthDaysData() {
    String currentUserID = _auth.currentUser!.uid;
    DateTime currentDate = DateTime.now();

    return _firestore
        .collection(currentUserID)
        .doc(DateFormat(DateFormat.MONTH).format(currentDate))
        .collection(monthsdaysCollection)
        .snapshots()
        .map(
      (snapshot) {
        return snapshot.docs
            .where((doc) => doc.id != monthInfoDoc)
            .map((doc) => doc.data())
            .toList();
      },
    );
  }

  Future<void> saveDayData(
      int prayerCount, Map<String, bool> prayersData) async {
    String currentUserID = _auth.currentUser!.uid;
    final DateTime currentDate = DateTime.now();

    PrayerDay prayerDay = PrayerDay(
        dayNo: DateFormat(DateFormat.MONTH_DAY).format(currentDate),
        prayerDate: currentDate.toString(),
        prayersCount: prayerCount,
        prayersData: prayersData);

    await _firestore
        .collection(currentUserID)
        .doc(DateFormat(DateFormat.MONTH).format(currentDate))
        .collection(monthsdaysCollection)
        .doc(prayerDay.dayNo)
        .set(prayerDay.toMap());
  }
}
