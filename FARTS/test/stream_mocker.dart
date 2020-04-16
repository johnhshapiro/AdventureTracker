import 'package:FARTS/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MockStream {

  final CollectionReference userCollection = Firestore.instance.collection('users');

  // Stream<User> get mockUser {
  //   return User(uid: 'M8OTV0XlKcW6l4YhGyUCNY74Sfj1');
  // }

}