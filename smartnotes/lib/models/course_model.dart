class CourseModel {
  String? uid;
  String? title;
  String? author;

  CourseModel({this.uid, this.title, this.author});

  //data from server
  factory CourseModel.fromMap(map) {
    return CourseModel(
      uid: map['uid'],
      title: map['title'],
      author: map['author']
    );
  }
}