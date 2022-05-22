import 'package:flutter/material.dart';
import 'package:smartnotes/screens/Forums/components/model/subject.dart';
import 'package:smartnotes/screens/Forums/components/ui/app_color.dart';

class SubjectItem extends StatelessWidget {
  final Subject subject;

  const SubjectItem({Key? key, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: subject.gradient,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject.name,
                    style: const TextStyle(
                      color: AppColor.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subject.lecturer,
                    style: TextStyle(
                      color: AppColor.white.withOpacity(0.75),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Image.asset(
                subject.image,
                width: 70,
                height: 70,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
