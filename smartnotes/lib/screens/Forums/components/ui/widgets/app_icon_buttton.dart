import 'package:flutter/material.dart';
import 'package:smartnotes/screens/Forums/components/ui/app_color.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;

  const AppIconButton({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(360),
      splashColor: AppColor.black.withOpacity(0.25),
      highlightColor: AppColor.black.withOpacity(0.4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: icon,
      ),
    );
  }
}
