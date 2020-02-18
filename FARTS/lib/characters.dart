import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CharacterSelect extends StatefulWidget {
  CharacterSelect({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CharacterSelectState createState() => _CharacterSelectState();
}

class _CharacterSelectState extends State<CharacterSelect> {
  // TODO: Replace example characters with saved characters
  final List<String> chars = <String>['Gnome Fighter', 'Half-Orc Wizard', 'Goblin Cleric'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("assets/knight.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.luminosity
          ),
          ListView.separated(
            padding: const EdgeInsets.all(50),
            itemCount: chars.length + 1,
            itemBuilder: (BuildContext contex, int index) {
              if (index == chars.length)
                return Container(
                  height: 50,
                  color: Colors.grey,
                  child: Center(child: Text('Create New'))
                );
              else
                return Container(
                  height: 50,
                  color: Colors.grey,
                  child: Center(child: Text('${chars[index]}'))
                );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider()
          )
        ]
      )
    );
  }
}

class CharacterSheetPage extends StatefulWidget {
  CharacterSheetPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CharacterSheetPageState createState() => _CharacterSheetPageState();
}

class _CharacterSheetPageState extends State<CharacterSheetPage> {
  @override
}