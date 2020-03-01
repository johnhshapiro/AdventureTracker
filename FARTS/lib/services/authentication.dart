import 'package:firebase_auth/firebase_auth.dart';
import 'package:FARTS/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signIn(String email, String password) async {
      try {
        AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;
        return _userFromFirebaseUser(user);
      } catch (e) {
        print(e.message);
        return null;
      }
  }

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot, User user) {
    UserData ud = UserData(
      uid: user.uid,
      characters: snapshot.data['characters'],
      username: snapshot.data['username'],
      gmCampaigns: snapshot.data['gmCampaigns'],
      email: snapshot.data['email'],
    );
    print(ud.characters.runtimeType);
    return ud;
  }
  
  Stream<UserData> get userData {
    Stream<UserData> ud = Firestore.instance.document('users/$uid').snapshots()
      .map(_userDataFromSnapshot);
    print(ud);
    return ud;
  }

  Stream<UserData> get user {
  // This stream is used to check state changes in authorization
    return _auth.onAuthStateChanged ?? null;
  }
}