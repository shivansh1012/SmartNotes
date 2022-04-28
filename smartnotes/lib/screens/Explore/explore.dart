import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/screens/Course/course_details.dart';
import 'package:smartnotes/screens/Explore/explore_card.dart';
import 'package:smartnotes/screens/components/search_bar.dart';
import 'package:smartnotes/screens/Explore/topic_tag.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List courseList = [];

  @override
  void initState() {
    super.initState();
    fetchCoursesList();
  }

  void fetchCoursesList() async {
    try {
      await FirebaseFirestore.instance
          .collection("courses")
          .get()
          .then((querySnapshot) {
        for (var element in querySnapshot.docs) {
          setState(() {
            courseList.add(element);
          });
        }
      });
    } catch (e) {
      Fluttertoast.showToast(msg: "Fetch Error" + e.toString());
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                    const TopicTag(),
                    Expanded(
                      child: ListView.builder(
                          itemCount: courseList.length,
                          itemBuilder: (context, index) {
                            return ExploreCard(
                                topicName: courseList[index]['title'],
                                author: courseList[index]['author'],
                                action: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CourseDetails(courseUID: courseList[index]['uid'])));
                                });
                          }),
                    ),
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
