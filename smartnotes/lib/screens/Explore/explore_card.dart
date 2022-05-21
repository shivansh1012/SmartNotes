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
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        splashColor: Colors.blue.withAlpha(30),
        onTap: action,
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.network(
                    courseData.coverImageURL.toString(),
                    fit: BoxFit.fitWidth,
                    height: 150,
                    width: double.infinity,
                  ),
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
