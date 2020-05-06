import 'package:FARTS/custom_scaffold.dart';
import 'package:flutter/material.dart';


class InventoryPage extends StatefulWidget {
  final Map inventory;

  InventoryPage({Key key, this.title, @required this.inventory})
    : super(key: key);
  final String title;

  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  @override
  Widget build(BuildContext context) {
    Map inventory = widget.inventory;
    List apiItems = [];
    List allItems = [];

    inventory.forEach((key, value) {
      if(key != 'custom') {
        apiItems = apiItems + value;
      }
      allItems = allItems + value;
    }); 
    
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand, 
          children: <Widget>[
            Image(
                  image: AssetImage('assets/realoldpaper.jpg'),
                  fit: BoxFit.cover,
            ),
            ListView.separated( 
              padding: const EdgeInsets.all(50),
              itemCount: allItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.transparent,
                  child: ListTile(
                    title: Text('${allItems[index]}',
                      style: TextStyle(
                        fontSize: 16.0, color: Colors.black)
                      ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                const Divider()
            )
          ]
        )
      ),
    
    );
  }
}
