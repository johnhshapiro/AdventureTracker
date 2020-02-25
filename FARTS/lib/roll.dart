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
      color: Colors.grey[900],
      child: ListTile(
        title: Text('test output yoyoyo'),
        trailing: IconButton(
          icon: Icon(Icons.add),
          color: Colors.amber,
          onPressed: () {
            _addListItem();
          }
        ),
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