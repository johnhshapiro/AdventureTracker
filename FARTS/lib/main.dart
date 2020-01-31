import 'package:flutter/material.dart';

void main() => runApp(BoardsEdge()); /*Loads 'main' as a Widget, even the app itself is a Widget. '=>' AKA 'fat arrow' in Dart 
is the single line lambda function syntax for the language. Pretty cool.  */

class BoardsEdge extends StatelessWidget {
  // This is the root Widget (Class).
  // Global variable declaration goes here I think.

  @override
  Widget build(BuildContext context) { // 'build' is the equivalent of a constructor for a class (note its also a widget like everything)
    return MaterialApp(
      title: 'Boards Edge',  // Naming the app Boards Edge for now we can change later.

      /*theme: ThemeData(
        primarySwatch: Colors.black,     <--  We will likely add theme data here later. 
      ),*/

      home: HomePage(title: 'Boards Edge'), // Loads the Homepage Widget (instantiated below in the two classes required for a stateful widget)
    );
  }
}

class HomePage extends StatefulWidget { /* Note every stateful Widget requires two classes to implement, this one, with the 'createState()' 
method call at the bottom, and then the protected class below which extends a state. */
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState(); // The underscore prefix indicates this is a private or protected class, see notes for more.
}

class _HomePageState extends State<HomePage> { // Protected/private class here gives state to the HomePage class
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title),   // Do we want an appbar? Probably not based on the protoype but I left it in for now.
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const RaisedButton(
              onPressed: null, // Null will be changed to link to the next screen. This is a good next thing to work on.
              child: Text('Dungeon Master', style: TextStyle(fontSize: 20, color: Colors.black),),
            ),

            const RaisedButton(
              onPressed: null,
              child: Text('Adventurer', style: TextStyle(fontSize: 20, color: Colors.black)) // Change the style of the button here. Might be abe to link this to a custom theme we create later.
            )

          ],
        )
        ,),

    );
  }
}
