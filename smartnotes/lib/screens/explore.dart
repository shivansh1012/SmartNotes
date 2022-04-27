import 'package:flutter/material.dart';
import 'package:smartnotes/screens/components/content_card.dart';
import 'package:smartnotes/screens/components/search_bar.dart';
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
            // Search Box
            const SearchBar(),
            // Note Cards
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: const [
                      TopicTag(),
                      ContentCard(),
                      ContentCard(),
                      ContentCard(),
                      ContentCard(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
