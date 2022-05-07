import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartnotes/models/user_model.dart';

class CourseModel {
  final String? uid;
  final String? title;
  final String? author;
  final String? description;
  final String? coverImageURL;
  final DocumentReference? authorRef;

  CourseModel(
      {this.uid,
      this.title,
      this.author,
      this.description,
      this.coverImageURL,
      this.authorRef});

  //converter
  CourseModel.fromJson(Map<String, Object?> json)
      : this(
            uid: json['uid']! as String,
            author: json['author']! as String,
            title: json['title']! as String,
            description: json['description']! as String,
            coverImageURL: json['coverImageURL']! as String,
            authorRef: json['authorRef']! as DocumentReference);

  //data from server
  factory CourseModel.fromMap(map) {
    // print(UserModel.fromMap(map['authorRef']).name);
    // print(map['authorRef']);
    // print(map as Map<String, dynamic>);
    return CourseModel(
        uid: map['uid'],
        title: map['title'],
        author: map['author'],
        description: map['description'],
        coverImageURL: map['coverImageURL'],
        authorRef: map['authorRef']);
  }

  //data format to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'title': title,
      'author': author,
      'description': description,
      'coverImageURL': coverImageURL,
      'authorRef': authorRef
    };
  }
}
