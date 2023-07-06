import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../data/models/user.dart' as model;

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  }

  //sing up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    // required String bio,
    // required Uint8List file,
  }) async {
    String res = "Some Error occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty
          // bio.isNotEmpty
          //file != null,
          ) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        // String photoUrl = await StorageMethod()
        //     .uploadImageToStorage('profilePics', file, false

        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          // photoUrl: photoUrl,
          email: email,
          // bio: bio,
          // followers: [],
          // following: [],
        );

        //add user to our database
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(user.toJson());

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Login In  user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "some error occurred";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
