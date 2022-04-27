import 'package:flutter/material.dart';
import 'package:smartnotes/screens/Forums/forum_details.dart';
import 'package:smartnotes/screens/components/content_card.dart';
import 'package:smartnotes/screens/components/search_bar.dart';

class Forum extends StatelessWidget {
  const Forum({Key? key}) : super(key: key);

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
                    // Forum cards
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForumDetails(),
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
