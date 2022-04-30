import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/models/course_model.dart';

class CourseInfo extends StatefulWidget {
  final String courseUID;
  const CourseInfo({Key? key, required this.courseUID}) : super(key: key);

  @override
  State<CourseInfo> createState() => _CourseInfoState();
}

class _CourseInfoState extends State<CourseInfo> {
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
    final basicCourseInfo = Column(
      children: <Widget>[
        Text(courseInfo.title.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 35.0)),
        const SizedBox(height: 30.0),
        Text(courseInfo.author.toString()),
        const SizedBox(height: 30.0),
        const Text("Free")
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: MediaQuery.of(context).size.height * 0.4,
          // decoration: const BoxDecoration(color: Colors.grey),
          // Image Intended
        ),
        Container(
          padding: const EdgeInsets.all(40.0),
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width,
          // allow when there is image
          // decoration: const BoxDecoration(color: Color.fromRGBO(58, 66, 86, 0.9)),
          child: Center(child: basicCourseInfo),
        ),
        Positioned(
            left: 8.0,
            top: 60.0,
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back, color: Colors.black)))
      ],
    );

    final bottomContent = Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: const [
          Text("Course Description"),
          SizedBox(height: 10),
          Text(
            "Fugiat in laborum ipsum dolore id officia nulla laborum aliquip. Aliqua officia aute adipisicing commodo velit laboris. Ut et commodo non dolor sint consequat non ipsum Lorem ad deserunt voluptate qui. Ut sint sunt officia ea anim sint ut excepteur esse anim. Tempor sint amet proident dolore ipsum excepteur.\n\nAliquip sunt esse non excepteur eiusmod ea enim consectetur amet. Ut nulla commodo veniam commodo exercitation fugiat eu anim. In fugiat veniam nisi incididunt qui voluptate. Tempor irure aliqua reprehenderit aute. Amet nulla enim deserunt excepteur laboris ad officia nisi eiusmod.\n\nEst in est quis sit cillum sint ut fugiat. Minim tempor veniam ullamco ullamco magna mollit enim reprehenderit aliquip sunt enim. Nulla laboris eu nulla elit. Ipsum cupidatat irure ad quis est id quis dolore.",
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );

    final joinCourse = Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: ElevatedButton(onPressed: () {}, child: const Text("Buy Course")),
    );
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(children: [topContent, bottomContent, joinCourse])),
    ));
  }
}
