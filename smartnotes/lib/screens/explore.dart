import 'package:flutter/material.dart';
import 'package:smartnotes/constants.dart';
import 'package:smartnotes/screens/note_details.dart';
// import 'package:smartnotes/screens/components/topic_tag.dart';

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
            Container(
              margin: const EdgeInsets.all(10),
              height: safeHeight * 0.08,
              width: safeWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: const Border(
                    top: BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                    bottom: BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                    left: BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                    right: BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                  )
                  // color: Colors.blueAccent,
                  ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 15.0,
                  ),
                  Icon(
                    Icons.search_outlined,
                    color: secondary,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  const Text(
                    'Search',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  )
                ],
              ),
            ),
            // Note Cards
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    // TopicTag(), // * Try to implement Topic Tag in explore page
                    GestureDetector(
                      // onTap: Navigator.push(context, ),
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10.0,
                            ),
                            Image.asset(
                              imageSrc,
                              height: safeHeight * 0.25,
                              width: safeWidth * 0.25,
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  title,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  author,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10.0,
                          ),
                          Image.asset(
                            imageSrc,
                            height: safeHeight * 0.25,
                            width: safeWidth * 0.25,
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Column(
                            children: [
                              Text(
                                title,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                author,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10.0,
                          ),
                          Image.asset(
                            imageSrc,
                            height: safeHeight * 0.25,
                            width: safeWidth * 0.25,
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Column(
                            children: [
                              Text(
                                title,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                author,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10.0,
                          ),
                          Image.asset(
                            imageSrc,
                            height: safeHeight * 0.25,
                            width: safeWidth * 0.25,
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Column(
                            children: [
                              Text(
                                title,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                author,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Expanded(
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.vertical,
                    //     itemCount: exploreCards.length,
                    //     itemBuilder: (BuildContext ctxt, int index) {
                    //       return exploreCards[index];
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Card exploreCard(imageSrc, title, text) {
  //    return Card(
  //      margin: const EdgeInsets.symmetric(horizontal: 15.0),
  //      child: Row(
  //        children: [
  //          const SizedBox(
  //            width: 10.0,
  //          ),
  //          Image.asset(
  //            imageSrc,
  //            height: safeHeight * 0.25,
  //            width: safeWidth * 0.25,
  //          ),
  //          const SizedBox(
  //            width: 15.0,
  //          ),
  //          Column(
  //            children: [
  //              Text(
  //                title,
  //                textAlign: TextAlign.left,
  //                style: const TextStyle(
  //                  fontSize: 18.0,
  //                  fontWeight: FontWeight.bold,
  //                ),
  //              ),
  //              Text(
  //                text,
  //                style: const TextStyle(
  //                  fontSize: 16.0,
  //                ),
  //            ),
  //            ],
  //         ),
  //        ],
  //      ),
  //    );
  // }
}
