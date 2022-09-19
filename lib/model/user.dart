import 'package:cloud_firestore/cloud_firestore.dart';

class myUser {
  String name;
  String profilePhoto;
  String email;
  String uid;

  myUser({
    required this.name,
    required this.profilePhoto,
    required this.email,
    required this.uid,
  });

  // Sending data from App to Firebase
  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePhoto": profilePhoto,
        "email": email,
        "uid": uid,
      };

  // Getting data from Firebase to App
  static myUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return myUser(
      email: snapshot['email'],
      profilePhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      name: snapshot['name'],
    );
  }
}
