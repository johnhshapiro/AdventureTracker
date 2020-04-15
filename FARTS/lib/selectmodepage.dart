import 'package:flutter/material.dart';

// Relevant pages.
import 'package:FARTS/services/vibrate.dart';
import 'package:FARTS/characters/character_select.dart';
import 'package:FARTS/campaignview/add_load_campaign_view.dart';
import 'package:provider/provider.dart';
import 'package:FARTS/characters/user_model.dart';


class SelectModePage extends StatefulWidget {
  SelectModePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SelectModePageState createState() => _SelectModePageState();
}

class _SelectModePageState extends State<SelectModePage> {
  @override
  Widget build(BuildContext context) {

    UserData userData = Provider.of<UserData>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Vibrate().bigRoll();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GameMaster()),
                    );
                  },
                  child: Image(
                    image: AssetImage("assets/gamemaster.jpg"),
                    fit: BoxFit.fill,
                    color: Colors.black12, // The number here is the opacity.
                    colorBlendMode: BlendMode.luminosity,
                    // Blends the background color with the background image.
                  ),
                ),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: MaterialButton(
                          child: Text('Game Master'),
                          color: Colors.grey[900],
                          onPressed: () {
                            Vibrate().bigRoll();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GameMaster()),
                            );
                          },
                        ),
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
                GestureDetector(
                  onTap: () {
                    Vibrate().bigRoll();
                    Navigator.push(
                      context,
                      // TODO point this at the top level character view page (this is the tappable image, dont forget to do this for the button below also.)
                      MaterialPageRoute(
                          builder: (context) => CharacterSelect(userData: userData)),
                    );
                  },
                  child: Image(
                      image: AssetImage("assets/adventurer.jpg"),
                      fit: BoxFit.fill,
                      color: Colors.black12, // The number here is the opacity.
                      colorBlendMode: BlendMode
                          .luminosity // Blends the background color with the background image.
                      ),
                ),
                Form(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          MaterialButton(
                            child: Text('Adventurer'),
                            color: Colors.grey[900],
                            onPressed: () {
                              Vibrate().bigRoll();
                              Navigator.push(
                                context,
                                // TODO point this at the top level character view page (this is the actual button)
                                MaterialPageRoute(
                                    builder: (context) => CharacterSelect(userData: userData)),
                              );
                            },
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
