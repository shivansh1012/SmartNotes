import 'package:flutter/material.dart';

class ExploreCard extends StatelessWidget {
  final String topicName;
  final String author;
  final Function() action;
  const ExploreCard(
      {Key? key,
      required this.topicName,
      required this.author,
      required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              ListTile(
                title: Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: Text(topicName,
                        style: const TextStyle(fontSize: 18.0))),
                subtitle: Text(author, style: const TextStyle(fontSize: 16.0)),
                leading: const CircleAvatar(backgroundColor: Colors.pink),
                trailing: const Text.rich(TextSpan(children: [
                  TextSpan(text: "0 ", style: TextStyle(fontSize: 18)),
                  WidgetSpan(child: Icon(Icons.thumb_up, size: 22.0))
                ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
