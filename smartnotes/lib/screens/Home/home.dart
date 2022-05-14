import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/constants.dart';
import 'package:smartnotes/screens/components/carousel.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
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
                  Fluttertoast.showToast(msg: "Personal Notes Pressed")
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
          child: Column(
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
                        margin: const EdgeInsets.only(left: 80),
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
              const Carousel(),
              // Most Voted section
              Container(
                margin: const EdgeInsets.all(15),
                alignment: Alignment.topLeft,
                child: const Text(
                  "Most Voted",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Carousel(),
              // Bookmarks section
              Container(
                margin: const EdgeInsets.all(15),
                alignment: Alignment.topLeft,
                child: const Text(
                  "Bookmarks",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Carousel(),
            ],
          ),
        ),
      ),
    );
  }
}
