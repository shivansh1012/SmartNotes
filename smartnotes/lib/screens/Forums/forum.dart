import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/screens/Forums/forum_details.dart';
import 'package:smartnotes/screens/components/content_card.dart';
import 'package:smartnotes/screens/components/search_bar.dart';

class Forum extends StatelessWidget {
  const Forum({Key? key}) : super(key: key);

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
                  Fluttertoast.showToast(msg: "Personal Notes clicked"),
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
