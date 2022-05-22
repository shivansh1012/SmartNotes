import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smartnotes/models/course_model.dart';
import 'package:smartnotes/models/user_model.dart';
import 'package:smartnotes/screens/Course/course_preview.dart';
import 'package:smartnotes/screens/Explore/explore_card.dart';

class Carousel extends StatelessWidget {
  final List refList;
  const Carousel({Key? key, required this.refList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<CourseModel>> _getCourseData() async {
      List<CourseModel> data = [];
      for (var ref in refList) {
        final rawCourseData = await FirebaseFirestore.instance
            .collection("courses")
            .doc(ref)
            .get();
        CourseModel tempCourseInfo = CourseModel.fromMap(rawCourseData);
        final rawUserData = await FirebaseFirestore.instance
            .doc(tempCourseInfo.authorRef!.path)
            .get();
        tempCourseInfo.setAuthorInfo(UserModel.fromMap(rawUserData));
        tempCourseInfo.setId(ref);
        data.add(tempCourseInfo);
      }
      // Fluttertoast.showToast(msg: "Carousel:" + data.toString());
      return data;
    }

    return SafeArea(
      child: FutureBuilder<List<CourseModel>>(
          future: _getCourseData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CarouselSlider.builder(
                options: CarouselOptions(
                  height: 250,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.8,
                  autoPlay: false,
                  aspectRatio: 2.0,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index, realIndex) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: ExploreCard(
                      courseData: snapshot.data![index],
                      action: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoursePreview(
                                courseUID: snapshot.data![index].id.toString()),
                          ),
                        );
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
          }),
    );
  }
}
