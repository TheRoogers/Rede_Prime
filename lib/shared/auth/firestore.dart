import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSetup(
    String displayName, DateTime valitycnh, String url) async {
  CollectionReference users =
      FirebaseFirestore.instance.collection('Users_Client');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  users.add(
    {
      'uid': uid,
      'displayname': displayName,
      'valitycnh': valitycnh,
      'url': url
    },
  );
  return;
}
