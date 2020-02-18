import 'package:flutter/material.dart';

class Campaign extends StatefulWidget {
  @override
  _CampaignState createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    decoration: InputDecoration(labelText: "Campaign Name"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    decoration: InputDecoration(labelText: "Date/Session #"),
                  ),
                ),
                Container(  
                  padding: const EdgeInsets.all(1),
                  child: Image.asset('assets/samplemap.jpg'),
                  //child: AssetImage('assets/samplemap.jpg'),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    decoration: InputDecoration(labelText: "Notes"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    decoration: InputDecoration(labelText: "Characters"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    decoration: InputDecoration(labelText: "NPCS"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Encounters'),
                  color: Colors.green,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Treasure'),
                  color: Colors.blue,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('sample'),
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
} 