import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? email;
  String? name;
  // List? personalNotes;
  // List? wishlist;
  // List? coursesBought;
  // List? coursesCreated;
  // List? classroomCreated;
  // List? classroomJoined;

  UserModel({
    // this.classroomCreated,
    // this.classroomJoined,
    // this.coursesBought,
    // this.coursesCreated,
    this.email,
    this.name,
    // this.personalNotes,
    // this.wishlist,
    this.uid,
  });

  //data deformat from server
  factory UserModel.fromMap(map) {
    return UserModel(
        // classroomCreated: map['classroomCreated'],
        // classroomJoined: map['classroomJoined'],
        // coursesBought: map['coursesBought'],
        // coursesCreated: map['coursesCreated'],
        email: map['email'],
        name: map['name'],
        // personalNotes: map['personalNotes'],
        // wishlist: map['wishlist'],
        uid: map['uid']);
  }

  //data format to server
  Map<String, dynamic> toMap() {
    return {
      // 'classroomCreated': classroomCreated,
      // 'classroomJoined': classroomJoined,
      // 'coursesBought': coursesBought,
      // 'coursesCreated': coursesCreated,
      'email': email,
      'name': name,
      // 'personalNotes': personalNotes,
      // 'wishlist': wishlist,
      'uid': uid,
    };
  }
}
