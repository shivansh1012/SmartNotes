import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smartnotes/screens/note_details.dart';

var rng = Random();

List<Widget> noteCard = [
  GestureDetector(
    // ! Add Navigation to note details
    // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NoteDetails())),
    child: Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Column(
        children: [
          Image.network(
              "https://picsum.photos/1200/800?random=${rng.nextInt(100)}"),
          const Text(
            "Thermodynamics",
            style: TextStyle(
              fontSize: 16.0,
            ),
          )
        ],
      ),
    ),
  ),
  Card(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.0),
        topRight: Radius.circular(15.0),
      ),
    ),
    child: Column(
      children: [
        Image.network(
            "https://picsum.photos/1200/800?random=${rng.nextInt(100)}"),
        const Text(
          "Nuclear Chemistry",
          style: TextStyle(
            fontSize: 16.0,
          ),
        )
      ],
    ),
  ),
  Card(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.0),
        topRight: Radius.circular(15.0),
      ),
    ),
    child: Column(
      children: [
        Image.network(
            "https://picsum.photos/1200/800?random=${rng.nextInt(100)}"),
        const Text(
          "Generators",
          style: TextStyle(
            fontSize: 16.0,
          ),
        )
      ],
    ),
  ),
  Card(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.0),
        topRight: Radius.circular(15.0),
      ),
    ),
    child: Column(
      children: [
        Image.network(
            "https://picsum.photos/1200/800?random=${rng.nextInt(100)}"),
        const Text(
          "Gravity Explained",
          style: TextStyle(
            fontSize: 16.0,
          ),
        )
      ],
    ),
  ),
];

int index = 0;

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CarouselSlider(
        options: CarouselOptions(
          enableInfiniteScroll: false,
          viewportFraction: 0.6,
          autoPlay: false,
          aspectRatio: 2.0,
        ),
        items: noteCard
            .map(
              (note) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: note,
              ),
            )
            .toList(),
      ),
    );
  }
}
