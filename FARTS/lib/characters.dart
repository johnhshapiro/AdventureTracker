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
            itemCount: chars.length,
            itemBuilder: (BuildContext contex, int index) {
              return Container(
                height: 50,
                color: Colors.grey,
                child: Center(child: Text('${chars[index]}'))
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider()
          )
          //  Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Form(
          //         child: Container(
          //       padding: EdgeInsets.all(10.0),
          //       child: Column(
          //         children: <Widget>[
          //           MaterialButton(
          //             child: Text('Game Master'),
          //             color: Colors.grey[800],
          //             splashColor: Colors.amber,
          //             onPressed: () {
          //               Navigator.push(
          //                 context,
          //                 MaterialPageRoute(builder: (context) => CharacterSelect()),
          //               );
          //             },
          //           ),
          //           MaterialButton(
          //             child: Text('Adventurer'),
          //             color: Colors.grey[800],
          //             splashColor: Colors.amber,
          //             onPressed: () {
          //               Navigator.push(
          //                 context,
          //                 MaterialPageRoute(builder: (context) => CharacterSelect()),
          //                   );
          //             },
          //           ),
          //         ],
          //       ),
          //     )),
          //   ],
          // )
        ]
      )
    );
  }
}