import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/constants.dart';
import 'package:smartnotes/models/course_model.dart';

class CourseDetails extends StatefulWidget {
  final String courseUID;
  const CourseDetails({Key? key, required this.courseUID}) : super(key: key);

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  CourseModel courseInfo = CourseModel();

  @override
  void initState() {
    super.initState();
    fetchCourseInfo();
  }

  void fetchCourseInfo() async {
    try {
      await FirebaseFirestore.instance
          .collection("courses")
          .doc(widget.courseUID)
          .get()
          .then((value) {
        setState(() {
          courseInfo = CourseModel.fromMap(value.data());
        });
      });
    } catch (e) {
      Fluttertoast.showToast(msg: "Fetch Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: safeHeight * 0.25,
                  width: safeWidth,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/Thumbnail.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    child: const CircleAvatar(
                      radius: 15.0,
                      child: Icon(
                        Icons.chevron_left_outlined,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            // Note Heading
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      courseInfo.title.toString(),
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Fugiat in laborum ipsum dolore id officia nulla laborum aliquip. Aliqua officia aute adipisicing commodo velit laboris. Ut et commodo non dolor sint consequat non ipsum Lorem ad deserunt voluptate qui. Ut sint sunt officia ea anim sint ut excepteur esse anim. Tempor sint amet proident dolore ipsum excepteur.\n\nAliquip sunt esse non excepteur eiusmod ea enim consectetur amet. Ut nulla commodo veniam commodo exercitation fugiat eu anim. In fugiat veniam nisi incididunt qui voluptate. Tempor irure aliqua reprehenderit aute. Amet nulla enim deserunt excepteur laboris ad officia nisi eiusmod.\n\nEst in est quis sit cillum sint ut fugiat. Minim tempor veniam ullamco ullamco magna mollit enim reprehenderit aliquip sunt enim. Nulla laboris eu nulla elit. Ipsum cupidatat irure ad quis est id quis dolore.",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.thumb_up_outlined,
                        size: 25.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "15",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Icon(
                        Icons.comment_outlined,
                        size: 25.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "3",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
