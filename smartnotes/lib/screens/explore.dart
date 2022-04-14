import 'package:flutter/material.dart';
import 'package:smartnotes/constants.dart';
import 'package:smartnotes/screens/components/topic_tag.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: safeHeight * 0.08,
                width: safeWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.blueAccent,
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15.0,
                    ),
                    Image.asset(
                      'assets/icons/Search.png',
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
              Row(
                children: [
                  // TopicTag(), // * Try to implement Topic Tag in explore page
                  Flexible(
                    child: Card(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/Thumbnail.png',
                            height: safeHeight * 0.25,
                            width: safeWidth * 0.25,
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Column(
                            children: const [
                              Text(
                                "Heading",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Lorem ipsum description for\nthe above heading ...",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
