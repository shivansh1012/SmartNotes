import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartnotes/screens/Forums/components/model/subject_stream.dart';
import 'package:smartnotes/screens/Forums/components/ui/app_color.dart';
import 'package:smartnotes/screens/Forums/components/ui/widgets/app_icon_buttton.dart';
import 'package:smartnotes/screens/Forums/components/ui/widgets/stream_type.dart';

class StreamItem extends StatelessWidget {
  final SubjectStream stream;
  const StreamItem({Key? key, required this.stream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.dark, width: 1.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stream.title,
                        style: const TextStyle(
                          color: AppColor.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat("MMM dd").format(stream.postedAt),
                        style: const TextStyle(
                          color: AppColor.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Type
                StreamType(type: stream.type),
              ],
            ),
          ),
          InkWell(
            splashColor: AppColor.black.withOpacity(0.05),
            highlightColor: AppColor.black.withOpacity(0.15),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: AppColor.dark,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppIconButton(
                    icon: Icon(Icons.comment),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Add class's comment",
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
