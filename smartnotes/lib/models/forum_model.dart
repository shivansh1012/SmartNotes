class ForumModel {
  String? uid;
  String? title;
  String? author;
  String? description;
  Map? authorRef;

  ForumModel({this.uid, this.title, this.author});

  //converter
  ForumModel.fromJson(Map<String, Object?> json)
      : this(
            uid: json['uid']! as String,
            author: json['author']! as String,
            title: json['title']! as String);

  //data from server
  factory ForumModel.fromMap(map) {
    return ForumModel(
        uid: map['uid'], title: map['title'], author: map['author']);
  }

  //data format to server
  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': title, 'name': author};
  }
}
