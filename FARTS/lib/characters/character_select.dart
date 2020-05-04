import 'package:FARTS/characters/character_sheet.dart';
import 'package:FARTS/characters/character_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:FARTS/characters/new_character.dart';
import 'package:FARTS/characters/character_service.dart';
import 'package:FARTS/characters/character_model.dart';
import 'package:FARTS/models/user_model.dart';
import 'package:FARTS/custom_scaffold.dart';

class CharacterList extends StatefulWidget {
  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  @override
  Widget build(BuildContext context) {
    int charsLength = 0;
    int index = 0;
    String indexName = 'test';
    var charIndex;
    // print(Provider.of<List<Character>>(context) ?? []);
    // if (Provider.of<List<Character>>(context) ?? [] != []) {
    final chars = Provider.of<List<Character>>(context) ?? [];
    print(chars);
    charsLength = chars.length;
    indexName = chars[index].name;
    charIndex = chars[index];
    // }
    return Scaffold(
      body: Container(
          child: Stack(fit: StackFit.expand, children: <Widget>[
        Image(
          image: AssetImage('assets/realoldpaper.jpg'),
          fit: BoxFit.cover,
        ),
        ListView.separated(
            padding: const EdgeInsets.all(50),
            itemCount: charsLength,
            itemBuilder: (BuildContext contex, int index) {
              return Card(
                color: Colors.transparent,
                child: ListTile(
                    title: Text(indexName,
                        style: TextStyle(fontSize: 16.0, color: Colors.black)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CharacterView(character: charIndex),
                          // CharacterSheetPage(character: chars[index])
                        ),
                      );
                    }),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider())
      ])),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Create New'),
        backgroundColor: Colors.grey[500],
      ),
    );
  }
}

class CharacterSelect extends StatefulWidget {
  CharacterSelect({Key key, this.title, @required this.userData})
      : super(key: key);
  final String title;
  final UserData userData;

  @override
  _CharacterSelectState createState() => _CharacterSelectState();
}

class _CharacterSelectState extends State<CharacterSelect> {
  @override
  Widget build(BuildContext context) {
    if (widget.userData == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return StreamProvider<List<Character>>.value(
        value: CharacterService(userId: widget.userData.uid).chars,
        child: Scaffold(
          body: CharacterList() ?? [],
        ),
      );
    }
  }
}
