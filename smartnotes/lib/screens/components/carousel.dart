import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smartnotes/screens/Course/note_details.dart';
import 'package:smartnotes/screens/Explore/explore_card.dart';

int index = 0;

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> noteCard = [
      {'title': "Thermodynamics", 'author': "Shiv"},
      {'title': "Thermo", 'author': "Shi"},
      {'title': "dynamics", 'author': "Shiva"},
      {'title': "TheDya", 'author': "Shivam"},
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
              topicName: noteCard[index]['title'].toString(),
              author: noteCard[index]['author'].toString(),
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
