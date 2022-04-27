import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/screens/Explore/explore_card.dart';
import 'package:smartnotes/screens/components/search_bar.dart';
import 'package:smartnotes/screens/Explore/topic_tag.dart';
import 'package:smartnotes/models/course_model.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<CourseModel> courseList = [];

  @override
  void initState() {
    super.initState();
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
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      const TopicTag(),
                      ExploreCard(
                          topicName: "Thermodynamics",
                          author: "Gaurav Gupta",
                          action: () {
                            Fluttertoast.showToast(msg: "Thermodynamics");
                          }),
                      ExploreCard(
                          topicName: "Physics",
                          author: "Anand Singh",
                          action: () {
                            Fluttertoast.showToast(msg: "Physics");
                          }),
                      ExploreCard(
                          topicName: "Mathematics",
                          author: "Shivansh Pandey",
                          action: () {
                            Fluttertoast.showToast(msg: "Mathematics");
                          }),
                      ExploreCard(
                          topicName: "CPPS",
                          author: "Gaurav Gupta",
                          action: () {
                            Fluttertoast.showToast(msg: "CPPS");
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
