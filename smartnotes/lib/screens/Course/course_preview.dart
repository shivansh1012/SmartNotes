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
  CourseModel courseDetails = CourseModel();

  @override
  void initState() {
    super.initState();
    fetchCourseDetails();
  }

  void fetchCourseDetails() async {
    try {
      await FirebaseFirestore.instance
          .collection("courses")
          .doc(widget.courseUID)
          .get()
          .then((value) {
        setState(() {
          courseDetails =
              CourseModel.fromMap(value.data() as Map<String, dynamic>);
        });
      });
    } catch (e) {
      Fluttertoast.showToast(msg: "Fetch Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    final basicCourseDetails = Column(
      children: <Widget>[
        Text(courseDetails.title.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 35.0)),
        const SizedBox(height: 30.0),
        Text(courseDetails.author.toString()),
        const SizedBox(height: 30.0),
        const Text("Free")
      ],
    );

    final topContent = Stack(
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
          child: Center(child: basicCourseDetails),
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

    final bottomContent = Container(
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

    final joinCourse = Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: ElevatedButton(onPressed: () {}, child: const Text("Buy Course")),
    );

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(children: [topContent, bottomContent, joinCourse])),
    ));
  }
}
