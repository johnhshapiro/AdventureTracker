import 'package:firebase_auth/firebase_auth.dart';
import 'package:FARTS/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class AuthenticationService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signIn(String email, String password) async {
      try {
        AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;
        Stream<DocumentSnapshot> userStream = _userFromFirebaseUser(user) ?? null;
        UserData userDoc = await userStream.first.then(_userDataFromSnapshot) ?? null;
        return user;
      } catch (e) {
        print(e.message);
        return null;
      }
  }

  Stream<DocumentSnapshot> _userFromFirebaseUser(FirebaseUser fbUser) {
    String userId = fbUser.uid.toString() ?? null;
    Stream<DocumentSnapshot> docStream = Firestore.instance.document('users/$userId').snapshots();
    return docStream;
  }

  Stream<UserData> get userDoc {
    return userDoc;
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    UserData ud = UserData(
      uid: snapshot.data.toString(),
      characters: snapshot.data['characters'],
      username: snapshot.data['username'],
      gmCampaigns: snapshot.data['gmCampaigns'],
      email: snapshot.data['email'],
    );
    print(ud.uid); // demo of how to get references from UserData

    // NOTE: The following is for demo purposes. How to follow reference and get another document
    for (DocumentReference char in ud.characters) {
      print(char.path);
      printCharName(char.path);

    }
    return ud;
  }

  Future<void> printCharName(String charPath) async {
      
    String charName = await Firestore.instance.document(charPath).snapshots().first.then((DocumentSnapshot charDoc) {
       return charDoc.data['name'].toString(); 
    });
    print(charName);
  } // NOTE: End reference demo


  Stream<FirebaseUser> get user {
  // This stream is used to check state changes in authorization
    return _auth.onAuthStateChanged ?? null;
  }
}