import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/models/course_model.dart';
import 'package:smartnotes/models/user_model.dart';
import 'package:smartnotes/screens/Course/course_preview.dart';
import 'package:smartnotes/screens/Explore/explore_card.dart';
import 'package:smartnotes/screens/Explore/topic_category.dart';
import 'package:smartnotes/screens/components/search_bar.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  Future<List<CourseModel>> fetchCoursesList() async {
    List<CourseModel> courseList = [];
    final rawData =
        await FirebaseFirestore.instance.collection("courses").get();
    for (var element in rawData.docs) {
      CourseModel tempCourseInfo = CourseModel.fromMap(element);
      final rawUserData = await FirebaseFirestore.instance
          .doc(tempCourseInfo.authorRef!.path)
          .get();
      tempCourseInfo.setAuthorInfo(UserModel.fromMap(rawUserData));
      tempCourseInfo.setId(element.id);
      courseList.add(tempCourseInfo);
    }
    Fluttertoast.showToast(msg: "Explore: Course List fetch complete");
    return courseList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SearchBar(),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          const SizedBox(
                            width: 28,
                          ),
                          TopicCategory(
                            text: "Chemistry",
                            onPressed: (value) => Fluttertoast.showToast(
                                msg: "Explore: Chemistry selected $value"),
                          ),
                          TopicCategory(
                            text: "Physics",
                            onPressed: (value) => Fluttertoast.showToast(
                                msg: "Explore: Physics selected $value"),
                          ),
                          TopicCategory(
                            text: "Mathematics",
                            onPressed: (value) => Fluttertoast.showToast(
                                msg: "Explore: Mathematics selected $value"),
                          ),
                          TopicCategory(
                            text: "Programming",
                            onPressed: (value) => Fluttertoast.showToast(
                                msg: "Explore: Programming selected $value"),
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder<List>(
                        future: fetchCoursesList(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Expanded(
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  setState(() {});
                                },
                                child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: snapshot.data?.length,
                                    itemBuilder: (context, index) {
                                      return ExploreCard(
                                          courseData: snapshot.data?[index],
                                          action: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CoursePreview(
                                                            courseUID: snapshot
                                                                .data?[index]
                                                                .id)));
                                          });
                                    }),
                              ),
                            );
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
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
