import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        margin: const EdgeInsets.all(10),
        // height: safeHeight * 0.08,
        // width: safeWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
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
            )),
        child: const TextField(
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: 20),
              hintText: 'Search',
              suffixIcon: Icon(Icons.search),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(20),
            )));
  }
}
