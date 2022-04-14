import 'package:flutter/material.dart';
import 'package:smartnotes/constants.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15.0),
              height: safeHeight * 0.15,
              width: safeWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: secondary,
                ),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.amber,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    "Gaurav Gupta",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: secondary,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 35.0,
                vertical: 15.0,
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.blueAccent,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    "General",
                    style: TextStyle(
                      fontSize: 18,
                      color: secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 35.0,
                vertical: 15.0,
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.green,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    "Preferences",
                    style: TextStyle(
                      fontSize: 18,
                      color: secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
