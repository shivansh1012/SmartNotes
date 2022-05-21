import 'package:flutter/material.dart';
import 'package:smartnotes/models/course_model.dart';

class StatisticCourseCard extends StatelessWidget {
  final CourseModel courseData;
  const StatisticCourseCard({Key? key, required this.courseData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final courseInfo = ListTile(
      title: Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: Text(courseData.title.toString(),
              style: const TextStyle(fontSize: 18.0),
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false)),
      subtitle: Text(courseData.authorInfo!.name.toString(),
          style: const TextStyle(fontSize: 16.0),
          overflow: TextOverflow.fade,
          maxLines: 1,
          softWrap: false),
      leading: const CircleAvatar(backgroundColor: Colors.pink),
      trailing: Text.rich(TextSpan(children: [
        TextSpan(
            text: courseData.likes!.length.toString() + " ",
            style: const TextStyle(fontSize: 18)),
        const WidgetSpan(child: Icon(Icons.thumb_up, size: 22.0))
      ])),
    );

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      color: const Color.fromARGB(255, 255, 241, 245),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            courseInfo,
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(
                  onPressed: () {}, child: const Text("View Course")),
              ElevatedButton(onPressed: () {}, child: const Text("View Stats"))
            ])
          ],
        ),
      ),
    );
  }
}
