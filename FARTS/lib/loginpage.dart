import 'package:flutter/material.dart';

import './main.dart';
import './homepage.dart';
import './createnewuserpage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Stack stacks multiple children widgets (Image, and Column which in turn has many children itself) in a space.
        fit: StackFit
            .expand, // Note 'fit' here is a property of the body Stack making the image expand to fill the display.
        children: <Widget>[
          Image(
              image: AssetImage("assets/loginImage.jpg"),
              fit: BoxFit.cover,
              color: Colors
                  .black87, // The number here is the opacity.
              colorBlendMode: BlendMode.luminosity // Blends the background color with the background image.
              ),
          Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // For column, main axis alignment will always be vertically aligned (row = horizontal for main axis)
            children: <Widget>[
              Form(
                child: Theme(
                  // This theme is wrapping the entire Column child which displays all the text fields, allowing the forms to have their own speerate theme (brighter than the background)
                  data: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.red,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(
                              color: Colors.grey[200], fontSize: 20.0))),
                  child: Container(
                    // This container is also wrapping the next column widget to enable padding (and whatver else we want for layout)
                    padding: const EdgeInsets.all(40.00),
                    child: Column(
                      // Entering column as a child here allows for multiple forms.
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: "Username",
                          ),
                          keyboardType: TextInputType
                              .emailAddress, // This is just telling it to pull up the right keyboard type for an email address
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            labelText: "Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top:
                                  40.0),
                        ),
                        // TODO: make the button check user credentials. Right now it just logs in no matter what
                        MaterialButton(
                          color: Colors.grey[800],
                          child: Text("Login"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                          splashColor: Colors
                              .amber, //Creates the color splash when u press the button.
                        ),
                        MaterialButton(
                          color: Colors.grey[800],
                          child: Text("New User"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateNewUser()),
                            );
                          },
                          // Doesn't do anything right now but will link to the create user page!
                          splashColor: Colors
                              .amber, //Creates the color splash when u press the button.
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}