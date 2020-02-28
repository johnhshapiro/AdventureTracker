import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signIn(String email, String password) async {
      try {
        AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;
        return user;
      } catch (e) {
        return null;
      }
  }

  Stream<FirebaseUser> get user {
  // This stream is used to check state changes in authorization
    return _auth.onAuthStateChanged;
  }
}