import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


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

    return  Scaffold(
      body:  Padding(
        padding: EdgeInsets.only(top: 12.0),
        child: StaggeredGridView.count(
          primary: false,
          crossAxisCount: 10,
          mainAxisSpacing: 0,
          crossAxisSpacing: 2.0,
          padding: EdgeInsets.all(4.0),
          children: <Widget>[
            
            
          ],
          staggeredTiles: <StaggeredTile>[
            /* How it works:
            Tiles build left to right top to bottom. 
            They can all be difference sizes and shapes.
            To move to the next row make sure all columns in current row are accounted for.
            Once on next row remember to account for "taller" tiles from previous rows.
            */

          ],
        )
      )
    );
  }
}
