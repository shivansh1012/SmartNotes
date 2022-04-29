import 'dart:ffi';

class CourseModel {
  String? uid;
  String? title;
  String? author;
  String? description;
  Array? likes;
  Array? comments;
  Map? authorRef;

  CourseModel({this.uid, this.title, this.author});
  
  //converter
  CourseModel.fromJson(Map<String, Object?> json)
      : this(
            uid: json['uid']! as String,
            author: json['author']! as String,
            title: json['title']! as String);

  //data from server
  factory CourseModel.fromMap(map) {
    return CourseModel(
        uid: map['uid'], title: map['title'], author: map['author']);
  }

  //data format to server
  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': title, 'name': author};
  }
}
