import 'package:FARTS/services/database.dart';
import 'package:flutter/material.dart';

// Relevant pages.
import 'package:FARTS/services/vibrate.dart';
import 'package:FARTS/campaignview/add_load_campaign_view.dart';
import 'package:provider/provider.dart';
import 'package:FARTS/models/user_model.dart';
import 'characters/character_select.dart';

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
                      PageRouteBuilder(
                        pageBuilder: (context, a1, a2) =>
                            GameMaster(userData: userData),
                        transitionsBuilder: (context, animation, a2, child) =>
                            FadeTransition(opacity: animation, child: child),
                        transitionDuration: Duration(milliseconds: 800),
                      ),
                    );
                  },
                  child: Image(
                    key: Key("gmImage"),
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
                              PageRouteBuilder(
                                pageBuilder: (context, a1, a2) =>
                                    GameMaster(userData: userData),
                                transitionsBuilder:
                                    (context, animation, a2, child) =>
                                        FadeTransition(
                                            opacity: animation, child: child),
                                transitionDuration: Duration(milliseconds: 800),
                              ),
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
                      PageRouteBuilder(
                        pageBuilder: (context, a1, a2) =>
                            CharacterSelect(userData: userData),
                        transitionsBuilder: (context, animation, a2, child) =>
                            FadeTransition(opacity: animation, child: child),
                        transitionDuration: Duration(milliseconds: 800),
                      ),
                    );
                  },
                  child: Image(
                      key: Key("advImage"),
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
                                PageRouteBuilder(
                                  pageBuilder: (context, a1, a2) =>
                                      CharacterSelect(userData: userData),
                                  transitionsBuilder:
                                      (context, animation, a2, child) =>
                                          FadeTransition(
                                              opacity: animation, child: child),
                                  transitionDuration:
                                      Duration(milliseconds: 800),
                                ),
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
