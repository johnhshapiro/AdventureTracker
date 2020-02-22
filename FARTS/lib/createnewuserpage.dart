import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './homepage.dart';

class CreateNewUser extends StatefulWidget {
  @override
  _CreateNewUserState createState() => _CreateNewUserState();
}

class _CreateNewUserState extends State<CreateNewUser> {
  final _formkey = GlobalKey<FormState>();
  String _pwCheck, _email, _password, _confirmPassword, _username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
              image: AssetImage("assets/loginImage.jpg"),
              fit: BoxFit.cover,
              color: Colors.black87, // The number here is the opacity.
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
                      decoration: InputDecoration(labelText: "Username"),
                    ),
                    TextFormField(
                      // Email
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Invalid Email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Email Address",
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      // Password
                      validator: (value) {
                        _pwCheck = value; // TODO don't store the password value for checking password match purposes, instead create a hashfunction. 
                        // So save it to a string and then MD5 (or whatever working encryption) it into an irreversible hash.
                        if (value.isEmpty || value.length < 6) {
                          return 'Must be at least 8 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    TextFormField(
                      // Confirm Password
                      validator: (value) {
                        if (value.isEmpty || value != _pwCheck) {
                          _pwCheck = null;
                          return 'Password Doesn' '\'t Match';
                        }
                        _pwCheck = null;
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
                        color: Colors.grey[800],
                        child: Text("Create"),
                        onPressed: () {
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Checking Inputs...'),));
                          if (_formkey.currentState.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );
                          }
                        },
                        splashColor: Colors
                            .amber, //Creates the color splash when u press the button. By u do u mean me?
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void createUser() async {
    if (_formkey.currentState.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage())
        );
      } catch (e) {
      }
    }
  }
}
