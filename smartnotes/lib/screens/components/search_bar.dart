import 'package:flutter/material.dart';
import 'package:smartnotes/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: safeHeight * 0.08,
      width: safeWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          border: const Border(
            top: BorderSide(
              width: 1.0,
              color: Colors.black,
            ),
            bottom: BorderSide(
              width: 1.0,
              color: Colors.black,
            ),
            left: BorderSide(
              width: 1.0,
              color: Colors.black,
            ),
            right: BorderSide(
              width: 1.0,
              color: Colors.black,
            ),
          )
          // color: Colors.blueAccent,
          ),
      child: Row(
        children: [
          const SizedBox(
            width: 15.0,
          ),
          Icon(
            Icons.search_outlined,
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
    );
  }
}
