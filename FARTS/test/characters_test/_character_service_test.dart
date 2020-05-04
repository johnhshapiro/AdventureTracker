import 'package:FARTS/characters/character_service.dart';
import 'package:FARTS/models/user_model.dart';
import 'package:FARTS/services/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:FARTS/custom_scaffold.dart';
import 'package:FARTS/campaignview/campaign_view.dart';
import 'package:provider/provider.dart';

// class MockNavigatorObserver extends Mock implements RouteSettings {}

final Firestore db = Firestore.instance;
Stream<User> get fakeUser {
  return db
      .collection('users')
      .document('FTEWHzJeXEOUyrtzGlZ3ciBVrrF2')
      .snapshots()
      .map((doc) => User.fromMap(doc));
}

void main() {}
