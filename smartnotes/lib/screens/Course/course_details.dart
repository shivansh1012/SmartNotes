import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/models/course_model.dart';
import 'package:path/path.dart' as p;
import 'package:smartnotes/screens/MediaPlayer/media_player.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseDetails extends StatefulWidget {
  final String courseUID;
  const CourseDetails({Key? key, required this.courseUID}) : super(key: key);

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  Future<CourseModel> fetchCourseDetails() async {
    final rawData = await FirebaseFirestore.instance
        .collection("courses")
        .doc(widget.courseUID)
        .get();

    Fluttertoast.showToast(msg: "Course Details Fetch Complete");
    final courseDetails =
        CourseModel.fromMap(rawData.data() as Map<String, dynamic>);

    return courseDetails;
  }

  IconData getIcon(path) {
    final extension = p.extension(path);
    if (extension == ".pdf") {
      return Icons.picture_as_pdf;
    } else if (extension == ".doc" || extension == ".docx") {
      return Icons.description;
    } else if (extension == ".mp4" || extension == ".mkv") {
      return Icons.video_file_rounded;
    } else {
      return Icons.collections;
    }
  }

  @override
  Widget build(BuildContext context) {
    void _viewDocument(path) {
      String extension = p.extension(path);
      if (extension.startsWith(".mp4") || extension.startsWith(".mkv")) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MediaPlayer(videoUri: path)));
      } else {
        _launchUrl(Uri.parse(path));
      }
    }

    Widget _courseInfo(courseInfo) {
      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 28, right: 16),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Hero(
                    tag: courseInfo.title,
                    child: Material(
                        color: Colors.transparent,
                        child: Text(courseInfo.title,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 34,
                                fontWeight: FontWeight.bold)))),
                const SizedBox(height: 10),
                Text(courseInfo.authorRef.toString(),
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: courseInfo.document.length,
                    itemBuilder: (context, index) {
                      String key = courseInfo.document.keys.elementAt(index);
                      return Card(
                        color: const Color.fromARGB(255, 228, 224, 227),
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            _viewDocument(courseInfo.document[key].toString());
                          },
                          child: SizedBox(
                            width: 300,
                            child: ListTile(
                                leading: Icon(
                                  getIcon(key),
                                  size: 28,
                                ),
                                title: Text(
                                  key,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                ),
                                subtitle: Text(
                                  courseInfo.document[key].toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                )),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 22, right: 22, top: 40, bottom: 10),
                child: Material(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(360),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(360),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back,
                              size: 26,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: FutureBuilder<CourseModel>(
          future: fetchCourseDetails(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _courseInfo(snapshot.data);
            } else {
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Awaiting Data...'),
                      )
                    ]),
              );
            }
          }),
    );
  }

  void _launchUrl(Uri _url) async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url, mode: LaunchMode.externalNonBrowserApplication);
    }
  }
}
