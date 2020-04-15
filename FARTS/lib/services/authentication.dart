import 'package:firebase_auth/firebase_auth.dart';
import 'package:FARTS/characters/user_model.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signIn(String email, String password) async {
    try {
      AuthResult result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Stream<FirebaseUser> get fbuser {
    // This stream is used to check state changes in authorization
    return _auth.onAuthStateChanged;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userDataFromFirebaseUser);
  }

  User _userDataFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }
}
