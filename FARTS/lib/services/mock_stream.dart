import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

import '../models/user_model.dart';

class MockUser {
  final instance = MockFirestoreInstance();
  final Firestore db = Firestore.instance;
  
  Stream<User> getMockUser() {
    return db
      .collection('users')
      .document('FTEWHzJeXEOUyrtzGlZ3ciBVrrF2')
      .snapshots()
      .map((doc) => User.fromMap(doc));
  }
}