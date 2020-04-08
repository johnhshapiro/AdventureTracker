import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PartyView extends StatefulWidget {
  @override
  _PartyViewState createState() => _PartyViewState();
}

class _PartyViewState extends State <PartyView> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('campaigns').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

            if (snapshot.hasError) throw Exception("Unable to get party data from firestore: ${snapshot.error}");

            if (!snapshot.hasData) CircularProgressIndicator();
            
            //_getPartyView(context, snapshot);
            return ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document){

                return Card(
                  child: ListTile(
                    //title: Text(document['name'], style: TextStyle(fontSize: 16.0, color: Colors.black)),
                  ),
                );
              }).toList(),
            );
            
          },
        ),
      ),
    );
  }

  // _getPartyView(context, snapshot) {
  //   return ListView(
  //     children: snapshot.data.documents.map((DocumentSnapshot document){

  //       return Card(
  //         child: ListTile(
  //           title: Text(document['name'], style: TextStyle(fontSize: 16.0, color: Colors.black)),
  //         ),
  //       );

  //     }).toList(),
  //   );
  // }

}