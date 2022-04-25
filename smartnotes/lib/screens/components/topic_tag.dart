import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

List<Card> tags = [
  Card(
    color: Colors.grey[100],
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35.0),
        topRight: Radius.circular(35.0),
        bottomLeft: Radius.circular(35.0),
        bottomRight: Radius.circular(35.0),
      ),
    ),
    child: const Align(
      alignment: Alignment.center,
      child: Text(
        "Physics",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  ),
  Card(
    color: Colors.grey[100],
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35.0),
        topRight: Radius.circular(35.0),
        bottomLeft: Radius.circular(35.0),
        bottomRight: Radius.circular(35.0),
      ),
    ),
    child: const Align(
      alignment: Alignment.center,
      child: Text(
        "Chemistry",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  ),
  Card(
    color: Colors.grey[100],
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35.0),
        topRight: Radius.circular(35.0),
        bottomLeft: Radius.circular(35.0),
        bottomRight: Radius.circular(35.0),
      ),
    ),
    child: const Align(
      alignment: Alignment.center,
      child: Text(
        "Biology",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  ),
  Card(
    color: Colors.grey[100],
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35.0),
        topRight: Radius.circular(35.0),
        bottomLeft: Radius.circular(35.0),
        bottomRight: Radius.circular(35.0),
      ),
    ),
    child: const Align(
      alignment: Alignment.center,
      child: Text(
        "Maths",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  ),
];

int index = 0;

class TopicTag extends StatelessWidget {
  const TopicTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CarouselSlider(
        options: CarouselOptions(
          enableInfiniteScroll: false,
          viewportFraction: 0.4,
          autoPlay: false,
          height: 50,
        ),
        items: tags
            .map(
              (tag) => Container(
                margin: const EdgeInsets.all(5.0),
                child: tag,
              ),
            )
            .toList(),
      ),
    );
  }
}
