import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/models/course_model.dart';
import 'package:smartnotes/screens/Authentication/sign_in.dart';
import 'package:smartnotes/screens/Course/course_details.dart';

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
    Widget _documentDetails(documentList) {
      bool isVideoPresent = false;
      bool isDocPresent = false;
      bool isPDFPresent = false;
      bool isImagePresent = false;

      for (int index = 0; index < documentList.length; index++) {
        String key = documentList.keys.elementAt(index);
        if(key.endsWith("mp4") || key.endsWith("mk4")) {
          isVideoPresent = true;
        } else if(key.endsWith("pdf")) {
          isPDFPresent = true;
        } else if(key.endsWith("jpg") || key.endsWith("png") || key.endsWith("jpeg")) {
          isImagePresent = true;
        } else {
          isDocPresent = true;
        }
      }

      return Row(
        children: [
          if(isPDFPresent)
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.1)),
            child: const Center(
                child: Icon(
              Icons.picture_as_pdf,
              size: 28,
            )),
          ),
          if(isPDFPresent)
          const SizedBox(width: 16),
          if(isImagePresent)
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.1)),
            child: const Center(
                child: Icon(
              Icons.collections,
              size: 28,
            )),
          ),
          if(isImagePresent)
          const SizedBox(width: 16),
          if(isDocPresent)
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.1)),
            child: const Center(
                child: Icon(
              Icons.description,
              size: 28,
            )),
          ),
          if(isDocPresent)
          const SizedBox(width: 16),
          if(isVideoPresent)
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.1)),
            child: const Center(
                child: Icon(
              Icons.video_library_rounded,
              size: 28,
            )),
          ),
        ],
      );
    }

    Widget _coursePreview(courseDetails) => Stack(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 66,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Hero(
                        tag: courseDetails.title,
                        child: Material(
                            color: Colors.transparent,
                            child: Text(courseDetails.title,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold))))),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Text(courseDetails.authorRef.toString(),
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false),
                ),
                const SizedBox(height: 16),
                const Center(
                    child: Text("Files Present",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400))),
                const SizedBox(height: 16),
                Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: _documentDetails(courseDetails.document)),
                const SizedBox(
                  height: 16,
                ),
                const Center(
                    child: Text("Course Description",
                        style: TextStyle(fontSize: 16))),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 28, right: 28, bottom: 80),
                  child: Text(
                    courseDetails.description,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        height: 1.5,
                        fontSize: 16),
                  ),
                )
              ],
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
                        InkWell(
                          borderRadius: BorderRadius.circular(360),
                          onTap: () {
                            Fluttertoast.showToast(msg: "Add to wishlist");
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.playlist_add,
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 87,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    gradient: LinearGradient(
                        stops: [
                          0,
                          1
                        ],
                        colors: [
                          Color.fromARGB(255, 171, 171, 171),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
                child: Center(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        _startCourse();
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          color: const Color(0xff4A80F0),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const SizedBox(
                            height: 56,
                            width: 319,
                            child: Center(
                              child: Text("Start",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        );

    return Scaffold(
      body: FutureBuilder<CourseModel>(
          future: fetchCourseDetails(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _coursePreview(snapshot.data);
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

  _startCourse() {
    if (FirebaseAuth.instance.currentUser == null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const SignIn()));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: ((context) => CourseDetails(courseUID: widget.courseUID))));
    }
  }
}
