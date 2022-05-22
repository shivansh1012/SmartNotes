import 'package:flutter/material.dart';
import 'package:smartnotes/screens/Forums/components/model/subject_stream.dart';
import 'package:smartnotes/screens/Forums/components/ui/app_color.dart';

class StreamType extends StatelessWidget {
  final SubjectStreamType type;

  const StreamType({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: (type == SubjectStreamType.material
                ? AppColor.material
                : Color.fromARGB(255, 228, 17, 17))
            .withOpacity(0.15),
        borderRadius: BorderRadius.circular(360),
      ),
      child: Text(
        type == SubjectStreamType.material ? "Material" : "Quiz",
        style: TextStyle(
          color: type == SubjectStreamType.material
              ? AppColor.material
              : Color.fromARGB(255, 228, 17, 17),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
