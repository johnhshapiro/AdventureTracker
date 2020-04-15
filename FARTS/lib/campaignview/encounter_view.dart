import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EncounterView extends StatefulWidget {

  @override
  _EncounterViewState createState() => _EncounterViewState();
}

class _EncounterViewState extends State<EncounterView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: Firestore.instance.collection('campaigns').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Text('campaign collection error ${snapshot.error}');

            if (!snapshot.hasData) return Center( child: CircularProgressIndicator());

            return ListView.builder(
                itemCount: snapshot.data.documents[0]['encounter_test'].length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey[500],
                    child: ListTile(
                      trailing: Text("example XP", style: TextStyle(fontSize: 12.0, color: Colors.black)),
                      title: Text(
                          snapshot.data.documents[0]['encounter_test'][index],
                          style: TextStyle(color: Colors.black)),
                      onTap:
                          () {}, // TODO inflate or navigate to the corresponding encounter data.
                    ),
                  );
                });
          }),
    );
  }
}