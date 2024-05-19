import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:prayerrecorder/models/prayer_day.dart';
import 'package:prayerrecorder/models/prayer_month.dart';

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

  Future<void> saveDayData(PrayerDay prayerDay) async {
    String currentUserID = _auth.currentUser!.uid;
    final DateTime prayerDate = DateTime.parse(prayerDay.prayerDate);

    await _firestore
        .collection(currentUserID)
        .doc(DateFormat(DateFormat.MONTH).format(prayerDate))
        .collection(monthsdaysCollection)
        .doc(prayerDay.prayerDate)
        .set(prayerDay.toMap());
  }

  Future<void> saveMonthData(PrayerMonth prayerMonthData) async {
    String currentUserID = _auth.currentUser!.uid;
    final DateTime currentDate = DateTime.now();

    await _firestore
        .collection(currentUserID)
        .doc(DateFormat(prayerMonthData.prayermonth).format(currentDate))
        .collection(monthsdaysCollection)
        .doc(monthInfoDoc)
        .set(prayerMonthData.toMap());
  }
}
