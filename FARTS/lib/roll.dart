import 'package:flutter/material.dart';

// Relevant pages
import 'vibrate.dart';

class Roll extends StatefulWidget {
  @override
  _RollState createState() => _RollState();
}

class _RollState extends State<Roll> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.casino),
        onPressed: () {
          Vibrate().smallRoll();
        },
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(30.0),
            color: Colors.red, 
            child: Text('lol'), 
          ),
          Container(
            margin: EdgeInsets.all(30.0),
            color: Colors.red, 
            child: Text('lol'), 
          ),
          Container(
            margin: EdgeInsets.all(30.0),
            color: Colors.red, 
            child: Text('lol'), 
          ),
          Container(
            margin: EdgeInsets.all(30.0),
            color: Colors.red, 
            child: Text('lol'), 
          ),
          Container(
            margin: EdgeInsets.all(30.0),
            color: Colors.red, 
            child: Text('lol'), 
          ),
          Container(
            margin: EdgeInsets.all(30.0),
            color: Colors.red, 
            child: Text('lol'), 
          ),
          Container(
            margin: EdgeInsets.all(30.0),
            color: Colors.red, 
            child: Text('lol'), 
          ),
          Container(
            margin: EdgeInsets.all(30.0),
            color: Colors.red, 
            child: Text('lol'), 
          ),
          Container(
            margin: EdgeInsets.all(30.0),
            color: Colors.red, 
            child: Text('lol'), 
          ),
          Container(
            margin: EdgeInsets.all(30.0),
            color: Colors.red, 
            child: Text('lol'), 
          ),
          Container(
            margin: EdgeInsets.all(30.0),
            color: Colors.red, 
            child: Text('lol'), 
          ),
          Container(
            margin: EdgeInsets.all(30.0),
            color: Colors.red, 
            child: Text('lol'), 
          ),
          Container(
            margin: EdgeInsets.all(30.0),
            color: Colors.red, 
            child: Text('lol'), 
          ),
          Container(
            margin: EdgeInsets.all(30.0),
            color: Colors.red, 
            child: Text('lol'), 
          ),
          Container(
            margin: EdgeInsets.all(30.0),
            color: Colors.red, 
            child: Text('lol'), 
          ),
        ],
      ), 
    );
  }
}