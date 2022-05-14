import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TopicTag extends StatelessWidget {
  const TopicTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> tagList = ["Physics", "Chemistry", "Maths", "Computer"];
    return SafeArea(
      child: CarouselSlider.builder(
        options: CarouselOptions(
            enableInfiniteScroll: false,
            viewportFraction: 0.4,
            autoPlay: false,
            height: 50,
            disableCenter: false,
            initialPage: 1),
        itemCount: tagList.length,
        itemBuilder: (context, index, realIndex) => Container(
          margin: const EdgeInsets.all(5.0),
          child: Card(
            color: Colors.grey[100],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0),
                bottomLeft: Radius.circular(35.0),
                bottomRight: Radius.circular(35.0),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                tagList[index],
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
