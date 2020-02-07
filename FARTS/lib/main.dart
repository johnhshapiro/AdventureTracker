import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(BoardsEdge());
/*Loads 'main' as a Widget, even the app itself is a Widget. '=>' AKA 'fat arrow' in Dart 
is the single line lambda function syntax for the language. Pretty cool.  */

class BoardsEdge extends StatelessWidget {
  // This is the root Widget (Class).
  // Global variable declaration goes here I think.
  @override
  Widget build(BuildContext context) {
    // 'build' is the equivalent of a constructor for a class (note its also a widget like everything)
    return MaterialApp(
        home: LoginPage(), // Sets the login page as the home page.
        theme: ThemeData(
            //primarySwatch: Colors.black **FIXME this is making the build break right now.
            ));
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit
            .expand, // Note 'fit' here is a property of the body Stack making the image expand to fill the display.
        children: <Widget>[
          Image(
              image: AssetImage("assets/loginImage.jpg"),
              fit: BoxFit.cover,
              color: Colors
                  .black87, // The number here is the opacity (87% opaque to help get the layered look with the background image)
              colorBlendMode: BlendMode
                  .darken // Blends the background color with the background image.
              ),
          Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // Note for column, main axis alignment will be vertically aligned.
            children: <Widget>[
              Form(
                child: Theme(
                  // This theme is wrapping the entire Column child which displays all the text fields, allowing the forms to have their own speerate theme (brighter than the background)
                  data: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.red,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 20.0))),
                  child: Container(
                    // This container is also wrapping the next column widget to enable padding (and whatver else we want for layout)
                    padding: const EdgeInsets.all(40.00),
                    child: Column(
                      // Entering column as a child here allows for multiple forms.
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Enter Username",
                          ),
                          keyboardType: TextInputType
                              .emailAddress, //This is just telling it to pull up the right keyboard type for an email address
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Enter Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top:
                                  20.0), // Creates padding between login button and forms
                        ),
                        MaterialButton(
                          color: Colors.grey,
                          textColor: Colors.black,
                          child: Text("Login"),
                          onPressed: () => {},
                          splashColor: Colors
                              .blueAccent, //Creates the color spalsh when u press the button.
                        ),
                        // Currently doesnt do anything onpressed but will check loging and link to selection screen.
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

class HomePage extends StatefulWidget {
  /* Note every stateful Widget requires two classes to implement, this one, with the 'createState()' 
method call at the bottom, and then the protected class below which extends a state. */
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() =>
      _HomePageState(); // The underscore prefix indicates this is a private class, see notes for more.
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const RaisedButton(
              onPressed:
                  null, // Null will be changed to link to the next screen. This is a good next thing to work on.
              child: Text(
                'Dungeon Master',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            const RaisedButton(
                onPressed: null,
                child: Text('Adventurer',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors
                            .black)) // Change the style of the button here. Might be abe to link this to a custom theme we create later.
                )
          ],
        ),
      ),
    );
  }
}
