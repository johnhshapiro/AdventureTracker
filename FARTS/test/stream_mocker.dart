import 'package:FARTS/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MockStream {
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  // Stream<UserData> get mockUserData {
  //   return userCollection.document('M8OTV0XlKcW6l4YhGyUCNY74Sfj1')
  // }

}
