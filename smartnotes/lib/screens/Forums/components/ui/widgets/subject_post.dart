import 'package:flutter/material.dart';
import 'package:smartnotes/screens/Forums/components/ui/app_color.dart';

class SubjectPost extends StatelessWidget {
  const SubjectPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              style: const TextStyle(
                color: AppColor.black,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: "Search Here",
                hintStyle: TextStyle(
                  color: AppColor.black.withOpacity(0.7),
                  fontSize: 12,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
