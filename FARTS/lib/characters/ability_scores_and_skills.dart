import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

int calculateModifier(int ability_score) {
  int mod = ((ability_score - 10)/2).floor();
  return mod;
}

StaggeredGridView abilityScoreCell(String name, int score) {
  // Single Block for ability score
  return StaggeredGridView.count(
    crossAxisCount: 3,
        mainAxisSpacing: 0,
        crossAxisSpacing: 2.0,
        padding: EdgeInsets.all(4.0),
        children: <Widget>[
          Text(name, style: TextStyle(fontSize:15.0, color: Colors.grey[600]),),
          Text(score.toString(), style: TextStyle(fontSize: 25.0)),
          Text(calculateModifier(score).toString(), style: TextStyle(fontSize: 20.0, color: Colors.grey[600]),),
          
        ],
        staggeredTiles: <StaggeredTile>[

          StaggeredTile.count(3, 2), // Ability name
          StaggeredTile.count(2, 3), // Ability score
          StaggeredTile.count(1, 3), // Ability modifier

        ],
  );

}

StaggeredGridView skillCell(int modifier, String name) {
    // Single Block for saving through or skill
    return StaggeredGridView.count(
      crossAxisCount: 4,
          mainAxisSpacing: 0,
          crossAxisSpacing: 2.0,
          padding: EdgeInsets.all(4.0),
          children: <Widget>[
            Text(modifier.toString(), style: TextStyle(fontSize: 20.0)),
            Text(name, style: TextStyle(fontSize: 15.0, color: Colors.grey[600]),),
            
          ],
          staggeredTiles: <StaggeredTile>[

            StaggeredTile.count(1, 1), // Modifier
            StaggeredTile.count(3, 1), // Name

          ],
    );
}


class AbilityScoresPage extends StatefulWidget {
  final DocumentSnapshot character;

  AbilityScoresPage({Key key, this.title, @required this.character}) : super(key: key);
  final String title;

  @override
  _AbilityScoresState createState() => _AbilityScoresState();
}


class _AbilityScoresState extends State<AbilityScoresPage> {

  @override
  Widget build(BuildContext context) {

   
    DocumentSnapshot char = widget.character;

    List<List<String>> statFields = [
      ["str", "Strength"], 
      ["dex", "Dexterity"], 
      ["con", "Constitution"], 
      ["int", "Intelligence"], 
      ["wis", "Wisdom"], 
      ["cha", "Charisma"] 
    ];

    List<List<String>> skillsAndSavingThrows = [ 
      /*  Maps tile number to skills 
      skipped multiples of 6 because every 
      sixth tile is an ability score */
      ["Acrobatics", "dex"], 
      ["Animal Handling", "wis"], 
      ["Acrana", "int"], 
      ["Athletics", "str"], 
      ["Deception", "cha"], 
      ["History", "int"], 
      ["Insight", "wis"],
      ["Intimidation", "cha"],
      ["Investigation", "int"],
      ["Medicine", "wis"],
      ["Nature", "int"],
      ["Perception", "wis"],
      ["Performance", "cha"],
      ["Persuasion", "cha"],
      ["Religion", "int"],
      ["Sleigh of Hand", "dex"],
      ["Stealth", "dex"],
      ["Survival", "wis"],
      ["Passive Perception", "wis"]
    ];


    List<Widget> _gridChildContent = [];
    List<StaggeredTile> _gridTileShapes = [];

    int _statIndex;
    String _lookup, _statName, _skillName;

    // Add page title row
    _gridChildContent.add(
      Text("Ability Scores and Skills", style: TextStyle(fontSize: 30.0)),
      );
    _gridTileShapes.add(
      StaggeredTile.count(7,2),
    );


    for (var i = 0; i < 36; i++) {
      if (i % 6 == 0) { // The first and every sixth tile will be an ability score
        _statIndex = (i/6).floor();
        _lookup = statFields[_statIndex][0];
        _statName = statFields[_statIndex][1];

        _gridChildContent.add(
          abilityScoreCell(_statName, char['stats'][_lookup]),
        );
        _gridTileShapes.add(
          StaggeredTile.count(3, 5), // Strength ability score
        );
      } else { // All other tiles are skills or saving throws
          if (i==1 || i==10 || i==35){
            _gridChildContent.add(
              Text(""),
             );
          } else if (i==2) {
            _gridChildContent.add(
              Text("Saving Throws", style: TextStyle(fontSize: 20.0)),
             );
          } else if (i > 2 && i < 10 ) {
            if (i < 6) {
              _statIndex = i-3;
            } else {
              _statIndex = i-4;
            }
            _lookup = statFields[_statIndex][0];
            _statName = statFields[_statIndex][1];
            _gridChildContent.add(
              skillCell(calculateModifier(char['stats'][_lookup]), _statName),
            );
          }  else if (i==11) {
            _gridChildContent.add(
              Text("Skills", style: TextStyle(fontSize: 20.0)),
             );
          } else {
            _lookup = skillsAndSavingThrows[i][1];
            _skillName = skillsAndSavingThrows[i][0];
            _gridChildContent.add(
              skillCell(calculateModifier(char['stats'][_lookup]), _skillName),
             );
          }
          _gridTileShapes.add(
            StaggeredTile.count(4, 1),
          );
      }
    }

    return  Scaffold(
      body:  Padding(
        padding: EdgeInsets.only(top: 12.0),
        child: StaggeredGridView.count(
          primary: false,
          crossAxisCount: 7,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20.0,
          padding: EdgeInsets.all(40.0),
          children: _gridChildContent,
          staggeredTiles: _gridTileShapes,
        )
      )
    );
  }
}
