import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Relevant Pages
import 'package:FARTS/homepage.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {

  // GestureDetector(
  //   onTap: () {
  //     Navigator.push(context,
  //         MaterialPageRoute(builder: (context) => MapView()));
  //   },
  //   child: Container(
  //     padding: EdgeInsets.all(5.0),
  //     child: FittedBox(
  //       fit: BoxFit.fitHeight,
  //       //child: Image.network(snapshot.data.documents[0]['maps'].toString()),
  //       child: Image.network(
  //           "https://firebasestorage.googleapis.com/v0/b/flutter-adventure-rts.appspot.com/o/map.png?alt=media&token=a1549bd9-38d9-4690-b860-5369152e7519"
  //               .toString()),
  //     ),
  //   ),
  // ),
  
  @override
  build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection('campaigns').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          if (snapshot.hasError) throw Exception ('Unable to get map from FireStore DB: ${snapshot.error}');

          if (!snapshot.hasData) return CircularProgressIndicator();

          return _mapViewBody(context, snapshot);
        }
      ),
    );
  }

    _mapViewBody(context, AsyncSnapshot snapshot) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Image.asset('assets/samplemap.jpg')
              ),

              Positioned(
                bottom: 5,
                left: 5,
                child: Text(snapshot.data.documents[0]['mapName'],
                        style: TextStyle(fontSize: 30.0, 
                        color: Colors.black, 
                        fontStyle: FontStyle.italic))
              ),
            ],
          ),
        ],
      );
  }

}