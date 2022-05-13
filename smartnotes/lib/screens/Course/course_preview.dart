import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/models/course_model.dart';

class CoursePreview extends StatefulWidget {
  final String courseUID;
  const CoursePreview({Key? key, required this.courseUID}) : super(key: key);

  @override
  State<CoursePreview> createState() => _CoursePreviewState();
}

class _CoursePreviewState extends State<CoursePreview> {

  Future<CourseModel> fetchCourseDetails() async {
    final rawData = await FirebaseFirestore.instance
        .collection("courses")
        .doc(widget.courseUID)
        .get();

    Fluttertoast.showToast(msg: "Fetch Complete");
    final courseDetails =
        CourseModel.fromMap(rawData.data() as Map<String, dynamic>);

    return courseDetails;
  }

  @override
  Widget build(BuildContext context) {
    Widget _topContent(courseDetails) => Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 10),
              height: MediaQuery.of(context).size.height * 0.4,
              // decoration: const BoxDecoration(color: Colors.grey),
              // Image Intended
            ),
            Container(
              padding: const EdgeInsets.all(40.0),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              // allow when there is image
              // decoration: const BoxDecoration(color: Color.fromRGBO(58, 66, 86, 0.9)),
              child: Center(
                  child: Column(
                children: <Widget>[
                  Text(courseDetails.title.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 35.0)),
                  const SizedBox(height: 30.0),
                  // Text(courseDetails.author.toString()),
                  const SizedBox(height: 30.0),
                  const Text("Free")
                ],
              )),
            ),
            Positioned(
                left: 8.0,
                top: 60.0,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back, color: Colors.black)))
          ],
        );

    Widget _bottomContent(courseDetails) => Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: [
              const Text("Course Description"),
              const SizedBox(height: 10),
              Text(
                courseDetails.description.toString(),
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        );

    final _joinCourse = Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: ElevatedButton(onPressed: () {}, child: const Text("Buy Course")),
    );

    return Scaffold(
      body: FutureBuilder<CourseModel>(
          future: fetchCourseDetails(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                  child: Column(children: [
                _topContent(snapshot.data),
                _bottomContent(snapshot.data),
                _joinCourse
              ]));
            } else {
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Awaiting Data...'),
                      )
                    ]),
              );
            }
          }),
    );
  }
}
