import 'package:FARTS/screens/characters/character_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:FARTS/screens/characters/new_character.dart';
import 'package:FARTS/services/character_list.dart';
import 'package:FARTS/models/character.dart';
import 'package:FARTS/models/user.dart';


class CharacterList extends StatefulWidget {

  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {

  @override
  Widget build(BuildContext context) {

    final chars = Provider.of<List<Character>>(context) ?? [];
    

    return Container(

      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("assets/knight.jpg"),
            fit: BoxFit.cover,
            color: Colors.black38,
            colorBlendMode: BlendMode.luminosity
          ),
          ListView.separated(
            padding: const EdgeInsets.all(50),
            itemCount: chars.length + 1,
            itemBuilder: (BuildContext contex, int index) {
              if (index == chars.length)
                return MaterialButton(
                      child: Text('Create New'),
                      color: Colors.grey[800],
                      splashColor: Colors.amber,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CreateNewCharacter()),
                    );
                  }
                );
              else
                return MaterialButton(
                      child: Text('${chars[index].name}'),
                      color: Colors.grey[800],
                      splashColor: Colors.amber,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CharacterSheetPage(character: chars[index])),
                    );
                  }
                );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider()
          )
        ]    
      )  
    );
  }
}


class CharacterSelect extends StatefulWidget {
  CharacterSelect({Key key, this.title, @required this.userData}) : super(key: key);
  final String title;
  final UserData userData;

  @override
  _CharacterSelectState createState() => _CharacterSelectState();
}

class _CharacterSelectState extends State<CharacterSelect> {
   
  

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Character>>.value(
      value: CharacterService(userId: widget.userData.uid).chars,
      child: Scaffold(
        body: CharacterList() ?? [],
      ),

    );
  }
}
