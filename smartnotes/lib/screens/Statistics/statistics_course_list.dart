import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartnotes/models/course_model.dart';
import 'package:smartnotes/models/user_model.dart';
import 'package:smartnotes/screens/Statistics/statistic_course_card.dart';

class StatisticsCourseList extends StatelessWidget {
  const StatisticsCourseList({Key? key}) : super(key: key);

  Future<List<CourseModel>> fetchMyCourses() async {
    List<CourseModel> courseList = [];

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference _users = firebaseFirestore.collection("users");
    CollectionReference _courses = firebaseFirestore.collection("courses");
    User? user = FirebaseAuth.instance.currentUser;

    List myCourses = UserModel.fromMap(await _users.doc(user!.uid).get())
        .coursesCreated as List;

    for (var courseID in myCourses) {
      CourseModel tempCourseInfo =
          CourseModel.fromMap(await _courses.doc(courseID).get());
      final rawUserData = await FirebaseFirestore.instance
          .doc(tempCourseInfo.authorRef!.path)
          .get();
      tempCourseInfo.setAuthorInfo(UserModel.fromMap(rawUserData));
      tempCourseInfo.setId(courseID);
      courseList.add(tempCourseInfo);
    }

    // Fluttertoast.showToast(
    //     msg: "StatCourList: " + courseList.toString(),
    //     backgroundColor: Colors.pink,);
    return courseList;
  }

  @override
  Widget build(BuildContext context) {
    Widget _topbar() {
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 22, right: 22, top: 40, bottom: 10),
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
      );
    }

    Widget _courseList(List<CourseModel> courseList) {
      if (courseList.isEmpty) {
        return const Center(
          child: Text("No Courses Uploaded"),
        );
      } else {
        return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: courseList.length,
            itemBuilder: (context, index) {
              return StatisticCourseCard(courseData: courseList[index]);
            });
      }
    }

    Widget _body() {
      return Positioned.fill(
        child: Container(
          padding: const EdgeInsets.only(top: 75),
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child: FutureBuilder<List<CourseModel>>(
              future: fetchMyCourses(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _courseList(snapshot.data as List<CourseModel>);
                } else {
                  return Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(
                              color: Colors.pink,
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
        ),
      );
    }

    Widget _stack() {
      return Stack(
        children: [_topbar(), _body()],
      );
    }

    return Scaffold(
      body: _stack(),
    );
  }
}
