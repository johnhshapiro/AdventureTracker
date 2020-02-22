import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<String>> _getChars() async {
  final QuerySnapshot characterDocs = await Firestore.instance.collection('users').getDocuments();
  final List<DocumentSnapshot> characterDocList = characterDocs.documents;

  return characterDocList.map((doc) => doc['name']);
}


class CharacterSelect extends StatefulWidget {
  CharacterSelect({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CharacterSelectState createState() => _CharacterSelectState();
}

class _CharacterSelectState extends State<CharacterSelect> {
  // TODO: Replace example characters with saved characters
  
  final Future<List<String>> charsFuture = _getChars();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("assets/knight.jpg"),
            fit: BoxFit.cover,
            color: Colors.black38,
            colorBlendMode: BlendMode.luminosity
          ),
          FutureBuilder<List<String>>(
            future: charsFuture,
            builder: (context, snapshot) {
              if(snapshot.connectionState != ConnectionState.done) {
                return Text("Loading");
              }
              if(snapshot.hasError) {
                return Text("Error");
              }
              List<String> chars = snapshot.data ?? [];
              return ListView.separated(
                padding: const EdgeInsets.all(50),
                itemCount: chars.length,
                itemBuilder: (BuildContext contex, int index) {
                  String name = chars[index];
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
                      child: Center(child: Text(name))
                    );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider()
              );
          })
          // ListView.separated(
          //   padding: const EdgeInsets.all(50),
          //   itemCount: chars.length + 1,
          //   itemBuilder: (BuildContext contex, int index) {
          //     if (index == chars.length)
          //       return Container(
          //         height: 50,
          //         color: Colors.grey,
          //         child: Center(child: Text('Create New'))
          //       );
          //     else
          //       return Container(
          //         height: 50,
          //         color: Colors.grey,
          //         child: Center(child: Text('${chars[index]}'))
          //       );
          //   },
          //   separatorBuilder: (BuildContext context, int index) => const Divider()
          // )
        ]
      )
    );
  }
}

// class CharacterSheetPage extends StatefulWidget {
//   CharacterSheetPage({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _CharacterSheetPageState createState() => _CharacterSheetPageState();
// }

// class _CharacterSheetPageState extends State<CharacterSheetPage> {
//   // @override
// }