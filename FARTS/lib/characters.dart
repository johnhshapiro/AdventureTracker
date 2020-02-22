import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';


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
                          MaterialPageRoute(builder: (context) => CharacterSelect()),
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

class CharacterSheetPage extends StatefulWidget {
  final DocumentSnapshot character;

  CharacterSheetPage({Key key, this.title, @required this.character}) : super(key: key);
  final String title;

  @override
  _CharacterSheetPageState createState() => _CharacterSheetPageState();
}

class _CharacterSheetPageState extends State<CharacterSheetPage> {

  @override
  Widget build(BuildContext context) {
    var keys = widget.character.data.keys.toList();

    return ListView.separated(
      padding: const EdgeInsets.all(50),
      itemCount: keys.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext contex, int index) {

        return Container(
          child: Text('${keys[index]}: ${widget.character.data[keys[index]]}'),
        );
      }
    );
  }
}