import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'character_model.dart';

int calculateModifier(int abilityScore) {
  int mod = ((abilityScore - 10) / 2).floor();
  return mod;
}

StaggeredGridView abilityScoreCell(String name, int score) {
  // Single Block for ability score
  return StaggeredGridView.count(
    crossAxisCount: 3,
    primary: false,
    mainAxisSpacing: 0,
    crossAxisSpacing: 0,
    padding: EdgeInsets.all(0),
    children: <Widget>[
      Card(
        child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                    height: 1,
                    fontSize: 16.0,
                    color: Colors.white,
                    fontStyle: FontStyle.italic
            ),
          ),
        ),
      ),
      Card(
        color: Colors.transparent,
        child: Center(
          child: Text(score.toString(),
            style: TextStyle(
              height: 1,
              fontSize: 24.0,
              )
            ),
        ),
      ),
      Card(
        color: Colors.transparent,
        child: Center(
          child: Text(
            calculateModifier(score).toString(),
            style: TextStyle(
              height: 1,
              fontSize: 16.0, 
              color: Colors.white,  
            ),
          ),
        ),
      ),
    ],
    staggeredTiles: <StaggeredTile>[
      StaggeredTile.count(3, 1), // Ability name
      StaggeredTile.count(2, 2), // Ability score
      StaggeredTile.count(1, 2), // Ability modifier
    ],
  );
}

StaggeredGridView skillCell(int modifier, String name) {
  // Single Block for saving throw or skill
  return StaggeredGridView.count(
    crossAxisCount: 4,
    primary: false,
    physics: NeverScrollableScrollPhysics(),
    mainAxisSpacing: 0,
    crossAxisSpacing: 0,
    padding: EdgeInsets.all(0),
    children: <Widget>[
      Card(
        color: Colors.transparent,
        child: Center(
          child: Text(
            modifier.toString(),
            style: TextStyle(
              height: 1,
              fontSize: 20.0,
            )
          ),
        ),
      ),
      Card(
        color: Colors.transparent,
        child: Center(
          child: Text(name,
            style: TextStyle(
              height: 1,
              fontSize: 15.0, 
              color: Colors.white, 
            ),
          ),
        ),
      ),
    ],
    staggeredTiles: <StaggeredTile>[
      StaggeredTile.count(1, 1), // Modifier
      StaggeredTile.count(3, 1), // Name
    ],
  );
}

class AbilityScoresPage extends StatefulWidget {
  final Character character;

  AbilityScoresPage({Key key, this.title, @required this.character})
      : super(key: key);
  final String title;

  @override
  _AbilityScoresState createState() => _AbilityScoresState();
}

class _AbilityScoresState extends State<AbilityScoresPage> {
  @override
  Widget build(BuildContext context) {
    Character char = widget.character;

    List<List<String>> statFields = [
      ["Strength", "str"],
      ["Dexterity", "dex"],
      ["Constitution", "con"],
      ["Intelligence", "int"],
      ["Wisdom", "wis"],
      ["Charisma", "cha"]
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
      ["Sleight of Hand", "dex"],
      ["Stealth", "dex"],
      ["Survival", "wis"],
      ["Passive Perception", "wis"]
    ];

    // skillsAndSavingThrows = statFields + skillsAndSavingThrows;

    List<Widget> _gridChildContent = [];
    List<StaggeredTile> _gridTileShapes = [];

    int _statIndex;
    String _lookup, _statName, _skillName;

    // Add page title row
    _gridChildContent.add(
      Center(
        child: Text(
          "Ability Scores and Skills",
          style: TextStyle(
            height: 1,
            fontSize: 30.0,
            color: Colors.black,
            fontStyle: FontStyle.italic
            )
          ),
      ),
    );
    _gridTileShapes.add(
      StaggeredTile.count(7, 1),
    );

    int skillLineCount = 0;
    for (var i = 0; i < 26; i++) {
      if (i % 4 == 0 && i <= 16) {
        // The first and every sixth tile will be an ability score
        _statIndex = (i ~/ 4);
        _lookup = statFields[_statIndex][1];
        _statName = statFields[_statIndex][0];

        _gridChildContent.add(
          Card(
            color: Colors.transparent,
            child: abilityScoreCell(_statName, char.stats[_lookup])
            ),
        );
        _gridTileShapes.add(
          StaggeredTile.count(3, 3), // Strength ability score
        );
      } else if (i % 2 == 0 && i >= 20) {
        _gridChildContent.add(
            Text("", 
              style: TextStyle(
                height: 1,
                fontSize: 20.0
                )
            )
        );
        _gridTileShapes.add(
          StaggeredTile.count(3, 1),
        );
      
      } else {
        // All other tiles are skills or saving throws

        if (skillLineCount == 0) {
          _gridChildContent.add(
            Card(
              child: Center(
                child: Text("Skills", 
                  style: TextStyle(
                    height: 1,
                    fontSize: 20.0,
                    color: Colors.white,
                    fontStyle: FontStyle.italic
                    )
                  ),
              ),
            ),
          );
        } else if (skillLineCount < skillsAndSavingThrows.length) {
          _lookup = skillsAndSavingThrows[skillLineCount][1];
          _skillName = skillsAndSavingThrows[skillLineCount][0];
          _gridChildContent.add(
            Card(
              color: Colors.transparent,
              child: skillCell(calculateModifier(char.stats[_lookup]), _skillName)
            ),
          );
        } else {
          _gridChildContent.add(
            Card(
              child: Text("", 
                style: TextStyle(
                  height: 1,
                  fontSize: 20.0
                )
              )
            ),
          );
        }

        _gridTileShapes.add(
          StaggeredTile.count(4, 1),
        );
        skillLineCount++;
      }
    }

    return Scaffold(
        body: Container(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/realoldpaper.jpg'),
                  fit: BoxFit.cover,
                ),
                StaggeredGridView.count(
                  primary: false,
                  crossAxisCount: 7,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  padding: EdgeInsets.only(top: 40.0),
                  children: _gridChildContent,
                  staggeredTiles: _gridTileShapes,
                )
              ]
            )
        )
      );
  }
}
