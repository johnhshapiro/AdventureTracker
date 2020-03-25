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
  final CollectionReference raceCollection =
      Firestore.instance.collection('races');
  final CollectionReference classCollection =
      Firestore.instance.collection('classes');
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

  TextFormField charactersInt(String x, int y) {
    return TextFormField(
      // Dexterity
      validator: (value) {
        if (value.isEmpty ||
            int.tryParse(value) < 3 ||
            int.tryParse(value) > 18)
          return 'Ability scores must be an integer from 3 to 18';
        return null;
      },
      onChanged: (input) => y = int.tryParse(input),
      decoration: InputDecoration(labelText: x),
      keyboardType: TextInputType.number,
    );
  }

  TextFormField charactersStr(String lable, String charClass) {
    return TextFormField(
      // Class
      validator: (value) {
        if (value.isEmpty) return 'Class cannot be empty';
        return null;
      },
      onChanged: (input) => charClass = input,
      decoration: InputDecoration(labelText: lable),
      keyboardType: TextInputType.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
      Form(
          key: _formkey,
          child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    charactersStr('Name', _name),
                    charactersStr('Alignment', _name),

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
                    charactersStr('Race', _race),
                    charactersStr('Class', _class),
                    charactersInt('Strength', _str),
                    charactersInt("Dexterity", _dex),
                    charactersInt('Constitution', _con),
                    charactersInt('Intelligence', _int),
                    charactersInt('Wisdom', _wis),
                    charactersInt('Charisma', _cha),
                  ])))
    ]));
  }
}
