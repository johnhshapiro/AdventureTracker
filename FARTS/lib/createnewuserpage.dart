// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import './homepage.dart';

class CreateNewUser extends StatefulWidget {
  @override
  _CreateNewUserState createState() => _CreateNewUserState();
}

class _CreateNewUserState extends State<CreateNewUser> {
  final _formkey = GlobalKey<FormState>();
  final CollectionReference userCollection =
      Firestore.instance.collection('users');
  String _username, _email, _password, _error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
              image: AssetImage("assets/loginImage.jpg"),
              fit: BoxFit.cover,
              color: Colors.black54, // The number here is the opacity.
              colorBlendMode: BlendMode
                  .luminosity // Blends the background color with the background image.
              ),
          Form(
            key: _formkey,
            child: Theme(
              data: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.red,
                  backgroundColor: Colors.black,
                  inputDecorationTheme: InputDecorationTheme(
                      labelStyle:
                          TextStyle(color: Colors.grey[200], fontSize: 20.0))),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      // Username
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'Must Be At Least 4 Characters';
                        }
                        return null;
                      },
                      onChanged: (input) => _username = input,
                      decoration: InputDecoration(labelText: "Username"),
                    ),
                    TextFormField(
                      // Email,
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Invalid email';
                        }
                        return null;
                      },
                      onChanged: (input) => _email = input,
                      decoration: InputDecoration(
                        labelText: "Email Address",
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      // Password
                      validator: (value) => value.length < 6
                          ? 'Password must be at least 6 characters'
                          : null,
                      // TODO don't store the password value for checking password match purposes, instead create a hashfunction.
                      // So save it to a string and then MD5 (or whatever working encryption) it into an irreversible hash.,
                      onChanged: (input) => _password = input,
                      decoration: InputDecoration(
                        labelText: "Password",
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    TextFormField(
                      // Confirm Password
                      validator: (value) {
                        if (value.isEmpty || value != _password) {
                          return 'Password Doesn' '\'t Match';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    Builder(
                      builder: (context) => MaterialButton(
                        color: Colors.grey[900],
                        child: Text("Create"),
                        onPressed: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Checking Inputs...'),
                          ));
                          createUser();
                        },
                        splashColor: Colors
                            .amber, //Creates the color splash when u press the button. By u do u mean me?
                      ),
                    ),
                    // TODO: Think of a better way to show the error text
                    Text(_error),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future createUser() async {
    if (_formkey.currentState.validate()) {
      try {
        AuthResult result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        String uid = result.user.uid;
        await userCollection.document(uid).setData({
          'username': _username,
          'email': _email,
          'characters': [null],
          'gmCampaigns': [null],
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } catch (e) {
        print(e.code);
        if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
          setState(() => _error = "A user with that email already exists");
        }
      }
    }
  }
}
