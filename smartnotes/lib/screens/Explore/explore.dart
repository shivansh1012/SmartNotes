import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/models/course_model.dart';
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
  // List courseList = [];

  @override
  void initState() {
    super.initState();
    fetchCoursesList();
  }

  Future<List> fetchCoursesList() async {
    List courseList = [];
    final rawData =
        await FirebaseFirestore.instance.collection("courses").get();
    for (var element in rawData.docs) {
      // courseList.add(CourseModel.fromMap(element));
      courseList.add(element);
    }
    return courseList;
    //     .then((querySnapshot) {
    //   for (var element in querySnapshot.docs) {
    //     setState(() {
    //       courseList.add(element);
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text(
            'Smart Notes',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.black,
              fontFamily: 'LobsterTwo',
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () => {
                  Fluttertoast.showToast(msg: "Personal Notes Pressed")
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PersonalNotes()))
                },
                icon: const Icon(
                  Icons.article_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            // Search Box
            const SearchBar(),
            // Note Cards
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Container(
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
                            onPressed: (value) => print(value),
                          ),
                          TopicCategory(
                            text: "Physics",
                            onPressed: (value) => print(value),
                          ),
                          TopicCategory(
                            text: "Mathematics",
                            onPressed: (value) => print(value),
                          ),
                          TopicCategory(
                            text: "Programming",
                            onPressed: (value) => print(value),
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder<List>(
                        future: fetchCoursesList(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Expanded(
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: snapshot.data?.length,
                                  itemBuilder: (context, index) {
                                    return ExploreCard(
                                        courseData: CourseModel.fromMap(
                                            snapshot.data?[index]),
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
