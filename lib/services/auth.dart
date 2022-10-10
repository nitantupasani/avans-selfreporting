import 'package:brains4buildings/globals.dart';
import 'package:brains4buildings/models/user.dart';
import 'package:brains4buildings/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create ouruser based on firebase user

  OurUser? _userFromFirebaseUser(User user) {
    return user != null ? OurUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<OurUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
  }

  //sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      unique_identification = result.user?.uid;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
