import 'package:flutter/material.dart';
import 'package:smartnotes/screens/Forums/components/model/student.dart';
import 'package:smartnotes/screens/Forums/components/ui/app_color.dart';
import 'package:smartnotes/screens/Forums/components/ui/widgets/app_icon_buttton.dart';

class StudentItem extends StatelessWidget {
  final Student student;

  const StudentItem({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(360),
            child: Image.asset(
              student.avatar,
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.name,
                  style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  student.email,
                  style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          AppIconButton(
            icon: const Icon(Icons.chevron_right,
                size: 24, color: AppColor.black),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
