import 'package:flutter/material.dart';
import 'package:smartnotes/screens/Forums/components/home_data.dart';

import 'package:smartnotes/screens/Forums/components/subject_view.dart';
import 'package:smartnotes/screens/Forums/components/ui/widgets/subject_item.dart';

class Forum extends StatelessWidget {
  const Forum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: subjects.length,
                itemBuilder: (ctx, index) {
                  final subject = subjects[index];

                  // Subject Item
                  return GestureDetector(
                    child: SubjectItem(subject: subject),
                    onTap: () {
                      // Navigate to subject view
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => SubjectView(subject: subject),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
