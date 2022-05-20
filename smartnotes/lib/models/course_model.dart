import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartnotes/models/user_model.dart';

class CourseModel {
  String? title;
  DocumentReference? authorRef;
  String? description;
  String? coverImageURL;
  Map? document;
  UserModel? authorInfo;

  CourseModel(
      {this.title,
      this.description,
      this.coverImageURL,
      this.authorRef,
      this.document});

  //converter
  CourseModel.fromJson(Map<String, Object?> json)
      : this(
            title: json['title']! as String,
            description: json['description']! as String,
            coverImageURL: json['coverImageURL']! as String,
            authorRef: json['authorRef']! as DocumentReference,
            document: json['document'] as Map);

  //data from server
  factory CourseModel.fromMap(map) {
    return CourseModel(
        title: map['title'],
        authorRef: map['authorRef'],
        description: map['description'],
        coverImageURL: map['coverImageURL'],
        document: map['document']);
  }

  //data format to server
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'authorRef': authorRef,
      'description': description,
      'coverImageURL': coverImageURL,
      'document': document
    };
  }

  void setAuthorInfo(UserModel authorInfo) {
    this.authorInfo = authorInfo;
  }
}
