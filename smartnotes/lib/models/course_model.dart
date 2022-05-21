import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartnotes/models/user_model.dart';

class CourseModel {
  //Stored in Db
  String? title;
  String? description;
  String? coverImageURL;
  Map? document;
  DocumentReference? authorRef;
  List? likes;

  //Not Stored in db
  String? id;
  UserModel? authorInfo;

  CourseModel(
      {this.title,
      this.description,
      this.coverImageURL,
      this.authorRef,
      this.document,
      this.likes});

  //converter
  CourseModel.fromJson(Map<String, Object?> json)
      : this(
            title: json['title']! as String,
            description: json['description']! as String,
            coverImageURL: json['coverImageURL']! as String,
            authorRef: json['authorRef']! as DocumentReference,
            document: json['document'] as Map,
            likes: json['likes'] as List);

  //data from server
  factory CourseModel.fromMap(map) {
    return CourseModel(
        title: map['title'] as String,
        authorRef: map['authorRef'] as DocumentReference,
        description: map['description'] as String,
        coverImageURL: map['coverImageURL'] as String,
        document: map['document'] as Map,
        likes: map['likes'] as List);
  }

  //data format to server
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'authorRef': authorRef,
      'description': description,
      'coverImageURL': coverImageURL,
      'document': document,
      'likes': likes
    };
  }

  void setId(String id) {
    this.id = id;
  }

  void setAuthorInfo(UserModel authorInfo) {
    this.authorInfo = authorInfo;
  }
}
