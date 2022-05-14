import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/models/user_model.dart';

class UserStatus {
  static User? user = FirebaseAuth.instance.currentUser;
  static late UserModel loggedInUser;

  static void fetchUserData() async {
    // User? user = FirebaseAuth.instance.currentUser;
    if (FirebaseAuth.instance.currentUser == null) {
      loggedInUser = UserModel();
    } else {
      FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .get()
          .then((value) {
        loggedInUser = UserModel.fromMap(value.data());
        Fluttertoast.showToast(
            msg: "User Found " + loggedInUser.name.toString());
      });
    }
  }
}
