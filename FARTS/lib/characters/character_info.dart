import 'package:FARTS/characters/character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CharacterInfoPage extends StatefulWidget {
  final Character character;

  CharacterInfoPage({Key key, this.title, @required this.character})
      : super(key: key);
  final String title;

  @override
  _CharacterInfoPageState createState() => _CharacterInfoPageState();
}

class _CharacterInfoPageState extends State<CharacterInfoPage> {
  @override
  Widget build(BuildContext context) {
    Character char = widget.character;
    print(char);
    String race = "Race placeholder";
    String classes = "Classes placeholder";
    String charName = "j";
    String charAlignment = "test";
    String charExperiencePoints = "test";
    String charNotes = "test";

    if (char != null) {
      charName = char.name;
      charAlignment = char.alignment;
      charExperiencePoints = char.experiencePoints.toString();
      charNotes = char.notes ?? "";
    }
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: StaggeredGridView.count(
              primary: false,
              crossAxisCount: 10,
              mainAxisSpacing: 0,
              crossAxisSpacing: 2.0,
              padding: EdgeInsets.all(20.0),
              children: <Widget>[
                /* How this works:
            The child at index 'n' provides the content for StaggeredTile at index 'n'.
            */
                Text(charName, style: TextStyle(fontSize: 30.0)),
                Text(classes, style: TextStyle(fontSize: 10.0)),
                Text(
                  "Class(es) and level(s)",
                  style: TextStyle(fontSize: 10.0, color: Colors.grey[600]),
                ),
                Text(race.toString(), style: TextStyle(fontSize: 10.0)),
                Text(charAlignment, style: TextStyle(fontSize: 10.0)),
                Text(charExperiencePoints, style: TextStyle(fontSize: 10.0)),
                Text(
                  "Name",
                  style: TextStyle(fontSize: 10.0, color: Colors.grey[600]),
                ),
                Text(
                  "Race",
                  style: TextStyle(fontSize: 10.0, color: Colors.grey[600]),
                ),
                Text(
                  "Alignment",
                  style: TextStyle(fontSize: 10.0, color: Colors.grey[600]),
                ),
                Text(
                  "Experience Points",
                  style: TextStyle(fontSize: 10.0, color: Colors.grey[600]),
                ),
                Text('Ability Scores and Skills'),
                Text('Combat'),
                Text('Inventory'),
                Text(""),
                Text(
                  "Notes",
                  style: TextStyle(fontSize: 10.0, color: Colors.grey[600]),
                ),
                Text(charNotes, style: TextStyle(fontSize: 30.0))
              ],
              staggeredTiles: <StaggeredTile>[
                /* How it works:
            Tiles build left to right top to bottom. 
            They can all be difference sizes and shapes.
            To move to the next row make sure all columns in current row are accounted for.
            Once on next row remember to account for "taller" tiles from previous rows.
            */
                // Top row - Left corner (4 rows) - First Three rows
                StaggeredTile.count(4, 3), // Top Left, Character name
                // Top row - Right corner (4 rows) - First row
                StaggeredTile.count(6, 1), // Classes
                // Top/Right Second row
                StaggeredTile.count(6, 1), // Class label
                // Top/Right Third row
                StaggeredTile.count(2, 1), // Character race
                StaggeredTile.count(2, 1), // Character alignment
                StaggeredTile.count(2, 1), // Experience Points
                // Top/Left Fourth Row
                StaggeredTile.count(4, 1),
                // Top/Right Fourth row
                StaggeredTile.count(2, 1), // Race label
                StaggeredTile.count(2, 1), // Alignment label
                StaggeredTile.count(2, 1), // Experience label
                // Buttons
                StaggeredTile.count(5, 5), // Ability Scores and Skills
                StaggeredTile.count(5, 5), // Combat
                StaggeredTile.count(5, 5), // Equipment
                StaggeredTile.count(5, 5), // Empty tab (placeholder or spacing)
                // Bottom
                StaggeredTile.count(10, 1), // Notes label
                StaggeredTile.count(10, 5), // Notes
              ],
            )));
  }
}
