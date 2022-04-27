import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/screens/Explore/explore_card.dart';
import 'package:smartnotes/screens/components/search_bar.dart';
import 'package:smartnotes/screens/Explore/topic_tag.dart';

var imageSrc = 'assets/images/Thumbnail.png';
var title = 'New Heading';
var author = 'John Doe';

// List<Widget> exploreCards = [
//   Card(
//     margin: const EdgeInsets.symmetric(horizontal: 15.0),
//     child: Row(
//       children: [
//         const SizedBox(
//           width: 10.0,
//         ),
//         Image.asset(
//           imageSrc,
//           height: safeHeight * 0.25,
//           width: safeWidth * 0.25,
//         ),
//         const SizedBox(
//           width: 15.0,
//         ),
//         Column(
//           children: [
//             Text(
//               title,
//               textAlign: TextAlign.left,
//               style: const TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               text,
//               style: const TextStyle(
//                 fontSize: 16.0,
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   ),
//   Card(
//     margin: const EdgeInsets.symmetric(horizontal: 15.0),
//     child: Row(
//       children: [
//         const SizedBox(
//           width: 10.0,
//         ),
//         Image.asset(
//           imageSrc,
//           height: safeHeight * 0.25,
//           width: safeWidth * 0.25,
//         ),
//         const SizedBox(
//           width: 15.0,
//         ),
//         Column(
//           children: [
//             Text(
//               title,
//               textAlign: TextAlign.left,
//               style: const TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               text,
//               style: const TextStyle(
//                 fontSize: 16.0,
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   ),
// ];

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

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
                // scrollDirection: Axis.vertical,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      const TopicTag(),
                      ExploreCard(
                          topicName: "Thermodynamics",
                          autor: "Gaurav Gupta",
                          action: () {
                            Fluttertoast.showToast(msg: "Thermodynamics");
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      ExploreCard(
                          topicName: "Physics",
                          autor: "Anand Singh",
                          action: () {
                            Fluttertoast.showToast(msg: "Physics");
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      ExploreCard(
                          topicName: "Mathematics",
                          autor: "Shivansh Pandey",
                          action: () {
                            Fluttertoast.showToast(msg: "Mathematics");
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      ExploreCard(
                          topicName: "CPPS",
                          autor: "Gaurav Gupta",
                          action: () {
                            Fluttertoast.showToast(msg: "CPPS");
                          }),
                      const SizedBox(
                        height: 15,
                      ),
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
