import 'package:flutter/material.dart';

class CreateCampaign extends StatefulWidget {
  @override
  _CreateCampaignState createState() => _CreateCampaignState();
}

class _CreateCampaignState extends State<CreateCampaign> {
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
                    decoration: InputDecoration(labelText: "Date"),
                  ),
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
                    decoration: InputDecoration(labelText: "Session Number"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('sample'),
                  color: Colors.red[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('sample'),
                  color: Colors.green,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('sample'),
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