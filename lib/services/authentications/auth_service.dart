import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final String userCollection = "Users";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // User? getCurrentUser() {
  //   return _auth.currentUser;
  // }

  Future<UserCredential> loginwithEmailPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<UserCredential> signupwithEmailPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      _firestore.collection(userCollection).doc(userCredential.user!.uid).set(
        {
          "uid": userCredential.user!.uid,
          "email": email,
          "password": password,
        },
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signout() async {
    return await _auth.signOut();
  }

  Future<UserCredential> signInWithGoogle() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);
  }
}
