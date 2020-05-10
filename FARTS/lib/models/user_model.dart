import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;

  User({this.uid});

  factory User.fromMap(DocumentSnapshot document) {
    return User(uid: document.documentID);
  }
}

class UserData {
  final String uid;
  final dynamic characters;
  final String email;
  final dynamic gmCampaigns;
  final String username;

  UserData(
      {this.uid, this.characters, this.email, this.gmCampaigns, this.username});
}
