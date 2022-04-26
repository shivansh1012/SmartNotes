import 'package:flutter/material.dart';
import 'package:smartnotes/screens/components/content_card.dart';
import 'package:smartnotes/screens/components/search_bar.dart';

class Classrooms extends StatelessWidget {
  const Classrooms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Column(
              children: const [
                // Searchbar
                SearchBar(),

                SizedBox(
                  height: 30,
                ),

                // Classroom cards
                ContentCard(),
                ContentCard(),
                ContentCard(),
                ContentCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
