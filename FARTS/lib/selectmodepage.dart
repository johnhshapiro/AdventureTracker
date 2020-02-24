import 'package:FARTS/homepage.dart';
import 'package:FARTS/vibrate.dart';
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                  Image(
                  image: AssetImage("assets/gamemaster.jpg"),
                  fit: BoxFit.fill,
                  color: Colors.black12, // The number here is the opacity.
                  colorBlendMode: BlendMode
                      .luminosity // Blends the background color with the background image.
                  ),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                        child: Text('Game Master'),
                        color: Colors.grey[600],
                        onPressed: (){
                          Vibrate().bigRoll();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                      ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
            fit: StackFit.expand,
              children: <Widget>[
                Image(
                image: AssetImage("assets/adventurer.jpg"),
                fit: BoxFit.fill,
                color: Colors.black12, // The number here is the opacity.
                colorBlendMode: BlendMode
                    .luminosity // Blends the background color with the background image.
                ),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      MaterialButton(
                        child: Text('Adventurer'),
                        color: Colors.grey[600],
                        onPressed: (){
                          Vibrate().bigRoll();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                      ),
                    ]
                  ),
                ),
              ],
            ),
          ),
      ],),
    );
  }
}
