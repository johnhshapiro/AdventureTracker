import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:FARTS/models/character.dart';
import 'package:FARTS/services/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class CharacterService {

  // final List characterList;
  // CharacterService({ this.characterList });

  final CollectionReference characterCollection = Firestore.instance.collection('characters');

  List<Character> _characterListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      Character newChar = Character(
          alignment: doc.data['alignment'] ?? '',
          attacksAndSpells: doc.data['attacksAndSpells'] ?? [],
          background: doc.data['background'] ?? '',
          classes: doc.data['classes'] ?? {},
          experiencePoints: doc.data['experiencePoints'] ?? 0,
          inventory: doc.data['inventory'] ?? [],
          languages: doc.data['languages'] ?? [],
          name: doc.data['name'] ?? '',
          notes: doc.data['notes'] ?? '',
          race: doc.data['race'] ?? '',
          skills: doc.data['skills'] ?? [],
          stats: doc.data['stats'] ?? {},
          campaignId: doc.data['campaignId'] ?? null,
          userId: doc.data['campaignId'] ?? null,
        );
      return newChar;
      }).toList();
  }

  Stream<List<Character>> get chars {
    return characterCollection.snapshots().map(_characterListFromSnapshot);
  }


}