import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:smartnotes/models/user_model.dart';

class UserStatus extends ChangeNotifier {
  bool isUserLoggedIn = false;
  UserModel? loggedInUser;

  Future<UserModel?> fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return null;
    } else {
      var rawData = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();
      return UserModel.fromMap(rawData.data());
    }
  }

  void updateUserStatus(user) {
    if (user == null) {
      isUserLoggedIn = false;
    } else {
      isUserLoggedIn = true;
    }
    loggedInUser = user;
    notifyListeners();
  }
}
