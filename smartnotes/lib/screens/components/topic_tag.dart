import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smartnotes/constants.dart';
import 'package:smartnotes/screens/components/carousel.dart';

List<Card> tags = [
  const Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35.0),
        topRight: Radius.circular(35.0),
        bottomLeft: Radius.circular(35.0),
        bottomRight: Radius.circular(35.0),
      ),
    ),
    child: Text(
      "Physics",
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  const Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35.0),
        topRight: Radius.circular(35.0),
        bottomLeft: Radius.circular(35.0),
        bottomRight: Radius.circular(35.0),
      ),
    ),
    child: Text(
      "Chemistry",
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
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
            viewportFraction: 0.3,
            autoPlay: false,
            aspectRatio: 2.0,
          ),
          items: const [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                ),
              ),
              child: Text(
                "Physics",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ]),
    );
  }
}
