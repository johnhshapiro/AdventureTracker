import 'package:FARTS/characters/character_info.dart';
import 'package:FARTS/custom_scaffold.dart';
import 'package:flutter/material.dart';

// Relevant pages.
import 'package:FARTS/characters/ability_scores_and_skills.dart';
import 'package:FARTS/characters/combat.dart';
import 'package:FARTS/characters/inventory.dart';

import 'character_model.dart';

class CharacterView extends StatefulWidget {
  final Character character;

  CharacterView({Key key, this.title, @required this.character})
      : super(key: key);
  final String title;


  @override
  _CharacterViewState createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  final _characterNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.announcement),
      title: Text('Characther'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.map),
      title: Text('Abilities'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.group),
      title: Text('Combat'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.error),
      title: Text('Items'),
    ),
  ];
  // This is a list of the routes available to the NavBar.

  @override
  Widget build(BuildContext context) {
    Character char = widget.character;

    final _characterRouteList = [
      CharacterInfoPage(character: char),
      AbilityScoresPage(character: char),
      CombatPage(),
      InventoryPage()
    ];
    return CustomScaffold(
        nabVar: true,
        routeList: _characterRouteList,
        navBarItems: _characterNavBarItems
        );
  }
}
