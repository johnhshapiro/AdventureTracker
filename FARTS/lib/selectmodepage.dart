import 'package:flutter/material.dart';

class SelectModePage extends StatefulWidget {
  SelectModePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SelectModePageState createState() => _SelectModePageState();
}

class _SelectModePageState extends State<SelectModePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("assets/loginImage.jpg"),
            fit: BoxFit.cover,
            color: Colors
                .black87, // The number here is the opacity.
            colorBlendMode: BlendMode.luminosity // Blends the background color with the background image.
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Form(child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {
                    },
                    child: Text('Game Master'),
                    color: Colors.grey[800],
                    splashColor: Colors.amber,
                  ),
                  MaterialButton(
                    onPressed: () {
                    },
                    child: Text('Adventurer'),
                    color: Colors.grey[800],
                    splashColor: Colors.amber,
                  ),
                ],
              ),
            )),
          ],)
        ],),  
    );
  }
  
}
