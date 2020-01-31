import 'package:flutter/material.dart';

void main() => runApp(BoardsEdge()); /*Loads 'main' as a Widget, even the app itself is a Widget. '=>' AKA 'fat arrow' in Dart 
is the single line lambda function syntax for the language. Pretty cool.  */

class BoardsEdge extends StatelessWidget {
  // This is the root Widget (Class).
  // Global variable declaration goes here I think.

  @override
  Widget build(BuildContext context) { // 'build' is the equivalent of a constructor for a class (note its also a widget like everything)
    return MaterialApp(
      title: 'Boards Edge',
      /*theme: ThemeData(
        primarySwatch: Colors.black,      <--  We will likely add theme data here later. 
      ),*/
      home: HomePage(title: 'HomePage'),
    );
  }
}

class HomePage extends StatefulWidget {
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
