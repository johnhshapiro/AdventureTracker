import 'package:flutter/material.dart';

void main() => runApp(BoardsEdge()); /*Loads 'main' as a Widget, even the app itself is a Widget. '=>' AKA 'fat arrow' in Dart 
is the single line lambda function syntax for the language. Pretty cool.  */

class BoardsEdge extends StatelessWidget {
  // This is the root Widget (Class).
  // Global variable declaration goes here I think.

  @override
  Widget build(BuildContext context) { // 'build' is the equivalent of a constructor for a class (note its also a widget like everything)
    return MaterialApp(
      title: 'Boards Edge',  // <-- Calling the app Boards Edge for now we can change later.
      /*theme: ThemeData(
        primarySwatch: Colors.black,     <--  We will likely add theme data here later. 
      ),*/
      home: HomePage(title: 'Boards Edge'),
    );
  }
}

class HomePage extends StatefulWidget { /* Note every stateful Widget requires two classes to implement, this one, the 'createState()' 
method call at the bottom, and then the class below which extends a state. */
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'test output',
            ),
          ],
        )
        ,),
    );
  }
}
