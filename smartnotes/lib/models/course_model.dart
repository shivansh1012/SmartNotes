import 'package:cloud_firestore/cloud_firestore.dart';

class CourseModel {
  String? title;
  DocumentReference? authorRef;
  String? description;
  String? coverImageURL;
  List? documentURL;

  CourseModel(
      {this.title,
      this.description,
      this.coverImageURL,
      this.authorRef,
      this.documentURL});

  //converter
  CourseModel.fromJson(Map<String, Object?> json)
      : this(
            title: json['title']! as String,
            description: json['description']! as String,
            coverImageURL: json['coverImageURL']! as String,
            authorRef: json['authorRef']! as DocumentReference,
            documentURL: json['documentURL']! as List);

  //data from server
  factory CourseModel.fromMap(map) {
    return CourseModel(
        title: map['title'],
        authorRef: map['authorRef'],
        description: map['description'],
        coverImageURL: map['coverImageURL'],
        documentURL: map['documentURL']);
  }

  //data format to server
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'authorRef': authorRef,
      'description': description,
      'coverImageURL': coverImageURL,
      'documentURL': documentURL
    };
  }
}
