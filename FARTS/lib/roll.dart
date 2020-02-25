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

      ), 
    );
  }
}