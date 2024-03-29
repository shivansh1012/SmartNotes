import 'package:flutter/material.dart';

class TopicCategory extends StatefulWidget {
  final Function(bool isSelected)? onPressed;
  final String? text;

  const TopicCategory({Key? key, this.onPressed, this.text}) : super(key: key);

  @override
  State<TopicCategory> createState() => _TopicCategoryState();
}

class _TopicCategoryState extends State<TopicCategory> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
            widget.onPressed!(isSelected);
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: isSelected
                    ? const Color.fromARGB(255, 162, 193, 254)
                    : const Color.fromARGB(255, 225, 225, 225),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                            color: const Color(0xff4A80F0).withOpacity(0.3),
                            offset: const Offset(0, 4),
                            blurRadius: 20),
                      ]
                    : [],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    widget.text!,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
