import 'package:FARTS/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = Firestore.instance.collection('users');

  Stream<UserData> get userData{
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
  UserData user = UserData(
    uid: snapshot.documentID,
    characters: snapshot.data['characters'],
    gmCampaigns: snapshot.data['gmCampaigns'],
    username: snapshot.data['username'],
    email: snapshot.data['email']
    );
    return user;
  }
}