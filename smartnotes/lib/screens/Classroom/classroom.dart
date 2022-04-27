import 'package:flutter/material.dart';
import 'package:smartnotes/screens/classroom_details.dart';
import 'package:smartnotes/screens/components/content_card.dart';
import 'package:smartnotes/screens/components/search_bar.dart';

class Classroom extends StatelessWidget {
  const Classroom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Searchbar
              const SearchBar(),

              const SizedBox(
                height: 15,
              ),

              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Column(
                  children: [
                    // Classroom cards
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ClassroomDetails(),
                        ),
                      ),
                      child: const ContentCard(),
                    ),
                    const ContentCard(),
                    const ContentCard(),
                    const ContentCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
