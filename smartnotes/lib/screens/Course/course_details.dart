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
    Widget _courseInfo(courseInfo) {
      Fluttertoast.showToast(msg: "Dum Dum Dum, this is not yet done");
      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 28, right: 16),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 66),
                Hero(
                    tag: courseInfo.title,
                    child: Material(
                        color: Colors.transparent,
                        child: Text(courseInfo.title,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 34,
                                fontWeight: FontWeight.bold)))),
                const SizedBox(height: 10),
                Text(courseInfo.authorRef.toString(),
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false),
                const SizedBox(height: 16),
                
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 22, right: 22, top: 40, bottom: 10),
                child: Material(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(360),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(360),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back,
                              size: 26,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: FutureBuilder<CourseModel>(
          future: fetchCourseDetails(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _courseInfo(snapshot.data);
            } else {
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
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
