class PersonalNoteModel {
  String? uid;
  String? title;
  String? author;
  String? description;
  Map? authorRef;

  PersonalNoteModel({this.uid, this.title, this.author});
  
  //converter
  PersonalNoteModel.fromJson(Map<String, Object?> json)
      : this(
            uid: json['uid']! as String,
            author: json['author']! as String,
            title: json['title']! as String);

  //data from server
  factory PersonalNoteModel.fromMap(map) {
    return PersonalNoteModel(
        uid: map['uid'], title: map['title'], author: map['author']);
  }

  //data format to server
  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': title, 'name': author};
  }
}
