import 'package:flutter/material.dart';
import 'package:smartnotes/models/course_model.dart';

class ExploreCard extends StatelessWidget {
  final CourseModel courseData;
  final Function() action;
  const ExploreCard({Key? key, required this.courseData, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final courseInfo = ListTile(
      title: Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: Text(courseData.title.toString(),
              style: const TextStyle(fontSize: 18.0))),
      subtitle: Text(courseData.authorRef.toString(),
          style: const TextStyle(fontSize: 16.0),
          overflow: TextOverflow.fade,
          maxLines: 1,
          softWrap: false),
      leading: const CircleAvatar(backgroundColor: Colors.pink),
      trailing: const Text.rich(TextSpan(children: [
        TextSpan(text: "0 ", style: TextStyle(fontSize: 18)),
        WidgetSpan(child: Icon(Icons.thumb_up, size: 22.0))
      ])),
    );

    return InkWell(
      onTap: action,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: Image.network(
                  courseData.coverImageURL.toString(),
                  fit: BoxFit.fitHeight,
                  height: 150,
                  // width: 150,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              courseInfo
            ],
          ),
        ),
      ),
    );
  }
}
