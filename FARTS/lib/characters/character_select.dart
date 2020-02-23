import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:FARTS/characters/character_sheet.dart';
import 'package:FARTS/characters/new_character.dart.';



class CharacterDB {

  final CollectionReference charCollection = Firestore.instance.collection('characters');


  Stream<QuerySnapshot> get chars {
    return charCollection.snapshots();
  }

}

class CharacterList extends StatefulWidget {
  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  @override
  Widget build(BuildContext context) {

    final chars = Provider.of<QuerySnapshot>(context);
    List charList = new List();
    for (var doc in chars.documents) {
      charList.add(doc);
    }


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
            itemCount: charList.length + 1,
            itemBuilder: (BuildContext contex, int index) {
              if (index == charList.length)
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
                      child: Text('${charList[index].data['name']}'),
                      color: Colors.grey[800],
                      splashColor: Colors.amber,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CharacterSheetPage(character: charList[index])),
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
  CharacterSelect({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CharacterSelectState createState() => _CharacterSelectState();
}

class _CharacterSelectState extends State<CharacterSelect> {
   
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: CharacterDB().chars,
      child: Scaffold(
        body: CharacterList(),
      ),

    );
  }
}


