// import 'package:FARTS/viewcampaignpage.dart';
import 'package:FARTS/authwrapper.dart';
import 'package:FARTS/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// import './selectmodepage.dart';
import './loginpage.dart';
// import './homepage.dart';

void main() {
  runApp(BoardsEdge());
  SystemChrome.setEnabledSystemUIOverlays([]);
}
/*Loads 'main' as a Widget, even the app itself is a Widget. '=>' AKA 'fat arrow' in Dart 
is the single line lambda function syntax for the language. Pretty cool.  */

class BoardsEdge extends StatelessWidget {
  // This is the root Widget (Class).
  // final FirebaseAuth _auth = FirebaseAuth.instance; // Used for checking authorization state changes
  // This is a test variable for a unit test demo in FARTS/test/main_test.dart
  final int unitTestVar = 0;

  @override
  Widget build(BuildContext context) {
    // 'build' is the equivalent of a constructor for a class (note its also a widget like everything)
    return StreamProvider<FirebaseUser>.value(
      value: AuthenticationService().user,
      child: MaterialApp(
          home:
              AuthWrapper(), // Sets AuthWrapper as homepage, which returns the homepage only if user is signed in
          theme: ThemeData(
            // Define the default brightness and colors.
            brightness: Brightness.dark,
            primaryColor: Colors.grey[900],
            accentColor: Colors.amber,

            // Define default font family
            fontFamily: 'Georgia',

            // Define the default TextTheme. Use this to specify the default
            // text styling for headlines (headline5), titles (headline6), bodies of text (bodyText2), and more.
            // *NOTE* if you are seeing red underline for the textTheme variables you need to update flutter/dart
            textTheme: TextTheme(
                headline:
                    TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
                title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
                body2: TextStyle(fontSize: 14.0, fontFamily: 'Georgia')),
          )),
    );
  }
}
