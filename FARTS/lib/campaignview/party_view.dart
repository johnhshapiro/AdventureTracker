import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PartyView extends StatefulWidget {
  @override
  _PartyViewState createState() => _PartyViewState();
}

class _PartyViewState extends State<PartyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: Firestore.instance.collection('campaigns').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Text('campaign collection error ${snapshot.error}');

            if (!snapshot.hasData) return CircularProgressIndicator();

            return ListView.builder(
                itemCount: snapshot.data.documents[0]['party_test'].length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey[500],
                    child: ListTile(
                      leading: Icon(Icons.person),
                      trailing: Text("Lvl Class Name", style: TextStyle(color: Colors.black)),
                      title: Text(
                          snapshot.data.documents[0]['party_test'][index],
                          style: TextStyle(color: Colors.black)),
                      onTap:
                          () {}, // TODO navigate to the corresponding characterpage (index can be used to retrieve the chars like 'where(DBreference = index) ....showcharacter...)
                    ),
                  );
                });
          }),
    );
  }
}
