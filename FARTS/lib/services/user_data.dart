// import 'package:FARTS/models/user.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserService {

//   final String uid;
//   UserService({ this.uid });

//   UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
//     UserData ud = UserData(
//       uid: uid,
//       characters: snapshot.data['characters'],
//       username: snapshot.data['username'],
//       gmCampaigns: snapshot.data['gmCampaigns'],
//       email: snapshot.data['email'],
//     );
//     print(ud.characters.runtimeType);
//     return ud;
//   }
  
//   Stream<UserData> get userData {
//     Stream<UserData> ud = Firestore.instance.document('users/$uid').snapshots()
//       .map(_userDataFromSnapshot);
//     print(ud);
//     return ud;
//   }

// }

