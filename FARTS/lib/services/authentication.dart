import 'package:firebase_auth/firebase_auth.dart';
import 'package:FARTS/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class AuthenticationService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signIn(String email, String password) async {
      try {
        AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;
        // Stream<DocumentSnapshot> userStream = _userFromFirebaseUser(user) ?? null;
        // DocumentSnapshot userDoc = await userStream.first.then((DocumentSnapshot snapshot) {return snapshot;}) ?? null;
        return user;
      } catch (e) {
        print(e.message);
        return null;
      }
  }

  // DocumentReference _userStreamFromFirebaseUser(FirebaseUser fbUser) {
  //   String userId = fbUser.uid ?? null;
  //   DocumentReference docStream = Firestore.instance.document('users/$userId');
  //   return docStream;
  // }

  // DocumentSnapshot _getUserDocument(DocumentReference userStream)  {
  //   return userStream.get().then((DocumentSnapshot snapshot) => snapshot.data);
  // }


  Stream<UserData> get userDoc {
    return _auth.onAuthStateChanged.map(_userDataFromFirebaseUser);
  }

  UserData _userDataFromFirebaseUser(FirebaseUser fbuser) {
    // DocumentReference userStream = _userStreamFromFirebaseUser(fbuser) ?? null;
    UserData userData;
    Firestore.instance.collection('user').document(fbuser.uid).get().then((DocumentSnapshot snapshot) => {
      //print("hello " + snapshot.documentID),
      print(snapshot.documentID),
      // print(snapshot.data.keys.toString()),
      // print(snapshot.data['email'].toString() ?? 'noemail'),
      // print(snapshot.data['gmCampaigns'].toString() ?? 'nocampaign'),
      // print(snapshot.data['username'].toString() ?? 'noname'),
    });
    // print(userData.toString());
    return userData;
  }

    
  //   {
  //     // UserData(
  //     //   uid: snapshot.data.toString(),
  //     //   characters: snapshot.data['characters'],
  //     //   username: snapshot.data['username'],
  //     //   gmCampaigns: snapshot.data['gmCampaigns'],
  //     //   email: snapshot.data['email'],
  //     //  ) ?? null;
  //     // return newUser;
  //   });
  //   print(ud.uid); // demo of how to get references from UserData

  //   // NOTE: The following is for demo purposes. How to follow reference and get another document
  //   // for (DocumentReference char in ud.characters) {
  //   //   print(char.path);
  //   //   printCharName(char.path);

  //   // }
  //   return userDoc;
  // }


  Stream<FirebaseUser> get user {
  // This stream is used to check state changes in authorization
    return _auth.onAuthStateChanged ?? null;
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();  
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: MaterialButton(
          child: Text('Sign out'),
          onPressed: () {
            AuthenticationService().signOut();
          })
      ),
    );
  }
}