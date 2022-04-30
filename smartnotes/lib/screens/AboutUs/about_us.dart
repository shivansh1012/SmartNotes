import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smartnotes/constants.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> contributors = [
      {
        "name": "Anand Singh Tanwar",
        "USN": "ENG19CT0005",
        "Contribution": "Frontend Dev"
      },
      {
        "name": "Gaurav Gupta",
        "USN": "ENG19CT0011",
        "Contribution": "Frontend and UI/UX"
      },
      {
        "name": "Shivansh Pandey",
        "USN": "ENG19CT0024",
        "Contribution": "FnF Dev"
      }
    ];
    return SafeArea(
        child: CarouselSlider.builder(
      options: CarouselOptions(
          enableInfiniteScroll: true,
          viewportFraction: 0.8,
          aspectRatio: 2.0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 1),
          height: 500),
      itemCount: contributors.length,
      itemBuilder: (context, index, realIndex) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: safeWidth,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [
                Color(0xFF701ebd),
                Color(0xFF873bcc),
                Color(0xFFfe4a97),
                Color(0xFFe17763),
                Color(0xFF68998c),
              ],
              // stops: [
              //   0.1,
              //   0.4,
              //   0.6,
              //   0.8,
              //   1
              // ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
          borderRadius: BorderRadius.circular(15.0),
          // border: const Border(
          //   top: BorderSide(
          //     width: 1.0,
          //     color: Colors.black,
          //   ),
          //   bottom: BorderSide(
          //     width: 1.0,
          //     color: Colors.black,
          //   ),
          //   left: BorderSide(
          //     width: 1.0,
          //     color: Colors.black,
          //   ),
          //   right: BorderSide(
          //     width: 1.0,
          //     color: Colors.black,
          //   ),
          // )
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          const SizedBox(height: 100),
          const CircleAvatar(backgroundColor: Colors.white, radius: 50),
          const SizedBox(height: 100),
          Text(contributors[index]['name'].toString(),
              style: const TextStyle(fontSize: 25, color: Colors.white)),
          const SizedBox(height: 25),
          Text(contributors[index]['Contribution'].toString(),
              style: const TextStyle(fontSize: 20, color: Colors.white))
        ]),
      ),
    ));
  }
}
