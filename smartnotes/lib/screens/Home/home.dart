import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/constants.dart';
import 'package:smartnotes/screens/components/carousel.dart';
import 'package:firebase_database/firebase_database.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<Map<String, List>> _getHomeData() async {
    Map<String, List> data = {};
    DatabaseReference realtimeFirebase = FirebaseDatabase.instance.ref();
    final trendingNowSnapshot =
        await realtimeFirebase.child('trendingnow/').get();
    if (trendingNowSnapshot.exists) {
      data['trendingnow'] = trendingNowSnapshot.value as List;
    } else {
      data['trendingnow'] = [];
    }
    
    final freeCoursesSnapshot =
        await realtimeFirebase.child('freecourses/').get();
    if (freeCoursesSnapshot.exists) {
      data['freecourses'] = freeCoursesSnapshot.value as List;
    } else {
      data['freecourses'] = [];
    }
      // Fluttertoast.showToast(msg: data.toString());
    // print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text(
            'Smart Notes',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.black,
              fontFamily: 'LobsterTwo',
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () => {
                  // Navigator.pushNamed(context, '/notesView')
                  Fluttertoast.showToast(msg: "Home: Personal Notes Pressed")
                },
                icon: const Icon(
                  Icons.article_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: FutureBuilder<Map<String, List>>(
              future: _getHomeData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      // ---------------Continue Reading container----------------------
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: safeHeight * 0.2,
                        width: safeWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: accentLight,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 50.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Continue reading",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "Thermodynamics: Part 1",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 20),
                                child: const CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.amber,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ---------------Trending Now section---------------
                      Container(
                        margin: const EdgeInsets.all(15),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Trending Now",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Carousel(refList: snapshot.data!['trendingnow'] as List),

                      
                      Container(
                        margin: const EdgeInsets.all(15),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Free Courses",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Carousel(refList: snapshot.data!['freecourses'] as List),

                    ],
                  );
                } else {
                  return Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text('Awaiting Data...'),
                          )
                        ]),
                  );
                }
              }),
        ),
      ),
    );
  }
}
