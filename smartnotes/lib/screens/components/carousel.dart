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
//         items: noteCard
//             .map(
//               (note) => Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 5),
//                 child: InkWell(
//                   onTap: () => {
//                     // Navigator.of(context)
//                     Navigator.pushNamed(context, '/noteDetails'),
//                   },
//                   child: Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                       side: const BorderSide(
//                         color: Colors.grey,
//                         width: 1.0,
//                       ),
//                     ),
//                     child: Container(
//                       padding: const EdgeInsets.all(5.0),
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 100,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               color: Colors.red,
//                               borderRadius: BorderRadius.circular(15.0),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5.0,
//                           ),
//                           Align(
//                             alignment: Alignment.topLeft,
//                             child: Align(
//                               alignment: Alignment.topRight,
//                               child: Container(
//                                 margin: const EdgeInsets.symmetric(
//                                     horizontal: 10.0),
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       note['title'].toString(),
//                                       textAlign: TextAlign.left,
//                                       style: const TextStyle(
//                                         fontSize: 18.0,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5.0,
//                                     ),
//                                     Text(
//                                       note['author'].toString(),
//                                       style: const TextStyle(
//                                         fontSize: 16.0,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
