//import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import "package:cloud_firestore/cloud_firestore.dart";

// TODO: Drop down menu for alignment, 
// TODO: query class and race as drop down, 
// TODO: check box for skills, 
// TODO: add remaining fields,
// TODO: Get validation working.
// TODO: submit button

// Used createnewuserpage.dart as template
class CreateNewCharacter extends StatefulWidget {
  @override
  _CreateNewCharacterState createState() => _CreateNewCharacterState();

}

class _CreateNewCharacterState extends State<CreateNewCharacter> {
  final _formkey = GlobalKey<FormState>();
  final CollectionReference raceCollection = Firestore.instance.collection('races');
  final CollectionReference classCollection = Firestore.instance.collection('classes');
  String _name = '';

  List<String> alignmentList = <String>[
                      "lawful good",
                      "neutral good",
                      "chaotic good",
                      "lawful neutral",
                      "true neutral",
                      "chaotic neutral",
                      "lawful evil",
                      "neutral evil",
                      "chaotic evil"
                    ];
  String _alignment = "";
  String _class = '';
  String _race = '';

  int _str, _dex, _con, _int, _wis, _cha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Form(
            key: _formkey,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    // Character Name
                    validator: (value) {
                      if (value.isEmpty)
                        return 'Name cannot be empty';
                      return null;
                    },
                    onChanged: (input) => _name = input,
                    decoration: InputDecoration(labelText: "Name"),
                    keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                    // Alignment
                    validator: (value) {
                      if (value.isEmpty)
                        return 'Alignment cannot be empty';
                      return null;
                    },
                    onChanged: (input) => _name = input,
                    decoration: InputDecoration(labelText: "Alignment"),
                    keyboardType: TextInputType.text,
                  ),
                  //TOD: Get Drop down to work
                  // DropdownButtonFormField(
                  //   value: _alignment,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       _alignment = value;
                  //     });
                  //   },
                  //   items: alignmentList.map<DropdownMenuItem<String>>((String item) {
                  //       return DropdownMenuItem<String>(
                  //         value: item,
                  //         child: Text(item),
                  //       );
                  //   }).toList(),
                  // ),
                  TextFormField(
                    // Race
                    validator: (value) {
                      if (value.isEmpty)
                        return 'Race cannot be empty';
                      return null;
                    },
                    onChanged: (input) => _race = input,
                    decoration: InputDecoration(labelText: "Race"),
                    keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                    // Class
                    validator: (value) {
                      if (value.isEmpty)
                        return 'Class cannot be empty';
                      return null;
                    },
                    onChanged: (input) => _class = input,
                    decoration: InputDecoration(labelText: "Class"),
                    keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                    // Strength
                    validator: (value) {
                      if (value.isEmpty || int.tryParse(value) < 3 || int.tryParse(value) > 18)
                        return 'Ability scores must be an integer from 3 to 18';
                      return null;
                    },
                    onChanged: (input) => _str = int.tryParse(input),
                    decoration: InputDecoration(labelText: "Strength"),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    // Dexterity
                    validator: (value) {
                      if (value.isEmpty || int.tryParse(value) < 3 || int.tryParse(value) > 18)
                        return 'Ability scores must be an integer from 3 to 18';
                      return null;
                    },
                    onChanged: (input) => _dex = int.tryParse(input),
                    decoration: InputDecoration(labelText: "Dexterity"),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    // Constitution
                    validator: (value) {
                      if (value.isEmpty || int.tryParse(value) < 3 || int.tryParse(value) > 18)
                        return 'Ability scores must be an integer from 3 to 18';
                      return null;
                    },
                    onChanged: (input) => _con = int.tryParse(input),
                    decoration: InputDecoration(labelText: "Constitution"),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    // Intelligence
                    validator: (value) {
                      if (value.isEmpty || int.tryParse(value) < 3 || int.tryParse(value) > 18)
                        return 'Ability scores must be an integer from 3 to 18';
                      return null;
                    },
                    onChanged: (input) => _int = int.tryParse(input),
                    decoration: InputDecoration(labelText: "Intelligence"),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    // Wisdom
                    validator: (value) {
                      if (value.isEmpty || int.tryParse(value) < 3 || int.tryParse(value) > 18)
                        return 'Ability scores must be an integer from 3 to 18';
                      return null;
                    },
                    onChanged: (input) => _wis = int.tryParse(input),
                    decoration: InputDecoration(labelText: "Wisdom"),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    // Charisma
                    validator: (value) {
                      if (value.isEmpty || int.tryParse(value) < 3 || int.tryParse(value) > 18)
                        return 'Ability scores must be an integer from 3 to 18';
                      return null;
                    },
                    onChanged: (input) => _cha = int.tryParse(input),
                    decoration: InputDecoration(labelText: "Charisma"),
                    keyboardType: TextInputType.number,
                  ),
                  
                ]
              )
            )
          )
        ]
      )
    );
  }
}

