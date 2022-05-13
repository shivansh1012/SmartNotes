import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smartnotes/models/course_model.dart';
import 'package:smartnotes/screens/Course/note_details.dart';
import 'package:smartnotes/screens/Explore/explore_card.dart';

int index = 0;

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CourseModel> noteCard = [
      CourseModel(
          title: "Thermodynamics",
          description: "",
          coverImageURL:
              "https://firebasestorage.googleapis.com/v0/b/smartnotes-46d96.appspot.com/o/notesA1_comparison.png?alt=media&token=bd5f1a19-5cdc-4534-ac49-f2b16f9e2eb9"),
      CourseModel(
          title: "Thermodynamics1",
          description: "",
          coverImageURL:
              "https://firebasestorage.googleapis.com/v0/b/smartnotes-46d96.appspot.com/o/notesA1_comparison.png?alt=media&token=bd5f1a19-5cdc-4534-ac49-f2b16f9e2eb9"),
      CourseModel(
          title: "Thermodynamics3",
          description: "",
          coverImageURL:
              "https://firebasestorage.googleapis.com/v0/b/smartnotes-46d96.appspot.com/o/notesA1_comparison.png?alt=media&token=bd5f1a19-5cdc-4534-ac49-f2b16f9e2eb9"),
      CourseModel(
          title: "Thermodynamics4",
          description: "",
          coverImageURL:
              "https://firebasestorage.googleapis.com/v0/b/smartnotes-46d96.appspot.com/o/notesA1_comparison.png?alt=media&token=bd5f1a19-5cdc-4534-ac49-f2b16f9e2eb9"),
    ];
    return SafeArea(
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: 250,
          enableInfiniteScroll: false,
          viewportFraction: 0.8,
          autoPlay: false,
          aspectRatio: 2.0,
        ),
        itemCount: noteCard.length,
        itemBuilder: (context, index, realIndex) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: ExploreCard(
              courseData: noteCard[index],
              action: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NoteDetails(),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
