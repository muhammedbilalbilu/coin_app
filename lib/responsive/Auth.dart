import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_app/Data/Usesr.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMathodes {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> Signup({
    required String name,
    required String email,
    required String password,
    required String bio,
  }) async {
    String res = 'somthing gose wrong';
    try {
      if (name.isNotEmpty ||
          email.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential create = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        Useradd _user = Useradd(
            email: email,
            uid: create.user!.uid,
            username: name,
            bio: bio,
            following: [],
            followers: []);
        await _firestore
            .collection("users")
            .doc(create.user!.uid)
            .set(_user.toJson());
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      print(err.toString());
    }
    return res;
  }

  Future<String> login(
      {required String Password, required String email}) async {
    String res = 'somthing gose wrong';
    try {
      if (Password.isNotEmpty || email.isNotEmpty) {
        _auth.signInWithEmailAndPassword(email: email, password: Password);
        String res = 'success';
      }
    } catch (err) {
      print(err.toString());
    }
    return res;
  }
}
