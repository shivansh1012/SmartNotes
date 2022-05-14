import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/screens/Explore/explore_card.dart';

class PersonalNotes extends StatefulWidget {
  const PersonalNotes({Key? key}) : super(key: key);

  @override
  State<PersonalNotes> createState() => _PersonalNotesState();
}

class _PersonalNotesState extends State<PersonalNotes> {
  List noteList = [];

  // TODO: Fetch personal notes data from firebase and store in noteList (the way its done in explore)

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 15.0,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ExploreCard(
                          topicName: noteList[index]['title'],
                          author: noteList[index]['author'],
                          action: () {
                            Fluttertoast.showToast(msg: 'Card clicked');
                            // TODO: Create a dynamic page routing to route to the correct personal note detail
                            // Navigator.pushNamed(context, '/personalNoteDetails');
                          });
                    },
                  ),
                ),
              ],
            ),
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     const Text(
            //       'Personal Notes',
            //       style: TextStyle(fontSize: 22.0),
            //     ),
            //     const SizedBox(
            //       height: 30,
            //     ),
            //     ExploreCard(
            //       topicName: 'Finite Automata',
            //       author: 'Shivansh Pandey',
            //       action: () {
            //         Navigator.pushNamed(context, '/noteDetails');
            //       },
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
