import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/models/course_model.dart';

class CourseDetails extends StatefulWidget {
  final String courseUID;
  const CourseDetails({Key? key, required this.courseUID}) : super(key: key);

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  CourseModel courseInfo = CourseModel();

  @override
  void initState() {
    super.initState();
    fetchCourseInfo();
  }

  void fetchCourseInfo() async {
    try {
      await FirebaseFirestore.instance
          .collection("courses")
          .doc(widget.courseUID)
          .get()
          .then((value) {
        setState(() {
          courseInfo = CourseModel.fromMap(value.data());
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
        Text(courseInfo.title.toString(),
            style: const TextStyle( fontSize: 35.0)),
        const SizedBox(height: 30.0)
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
                child: const Icon(Icons.arrow_back, color: Colors.white)))
      ],
    );

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
    );
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [topContent, bottomContent]),
    ));
  }
}
