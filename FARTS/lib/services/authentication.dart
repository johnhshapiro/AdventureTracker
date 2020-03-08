import 'package:firebase_auth/firebase_auth.dart';
import 'package:FARTS/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';


class AuthenticationService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signIn(String email, String password) async {
      try {
        AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;
        return _userDataFromFirebaseUser(user);
      } catch (e) {
        print(e.message);
        return null;
      }
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userDataFromFirebaseUser);
  }

  User _userDataFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
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
    final userData = Provider.of<UserData>(context);
    return Center(
      child: Container(
        child: MaterialButton(
          child: Text('Sign Out'),
          onPressed: () {
            print(userData.email);
            print(userData.uid);
            print(userData.username);
            AuthenticationService().signOut();
          })
      ),
    );
  }
}