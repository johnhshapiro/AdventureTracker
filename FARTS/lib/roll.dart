import 'package:flutter/material.dart';

// Relevant pages
import 'vibrate.dart';

class Roll extends StatefulWidget {
  @override
  _RollState createState() => _RollState();
}

class _RollState extends State<Roll> {
  int listItemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Vibrate().bigRoll();
        },
        child: Icon(Icons.casino),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: this.listItemCount,
              itemBuilder: (context, index) => this._buildListTile(index)),
          ),
        ],
      ),
    );
  }

  // Build an Individual List Tile
  _buildListTile(int index) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      color: Colors.grey[900],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(labelText: 'd2', ),
              keyboardType: TextInputType.number,
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(labelText: 'd3', ),
              keyboardType: TextInputType.number,
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(labelText: 'd4', ),
              keyboardType: TextInputType.number,
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(labelText: 'd6', ),
              keyboardType: TextInputType.number,
            ),
          ),
          IconButton(
            icon: Icon(Icons.add, size: 30.0,),
            color: Colors.amber,
            onPressed: () {
              _addListItem();
            }
          ),
        ],
      ),
    );
  }

  // Increments the count of list items, allows for infinite list.
  _addListItem() {
    setState(() {
      listItemCount = listItemCount + 1;
    });
  }

}