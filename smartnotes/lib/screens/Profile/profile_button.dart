import 'package:flutter/material.dart';
import 'package:smartnotes/constants.dart';

class ProfileButton extends StatelessWidget {
  final String buttonName;
  final IconData buttonIcon;
  final Function() action;
  final String link;
  const ProfileButton(
      {Key? key,
      required this.buttonName,
      required this.buttonIcon,
      required this.action,
      required this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 35.0,
          vertical: 15.0,
        ),
        child: Row(
          children: [
            // const CircleAvatar(
            //   radius: 20.0,
            //   backgroundColor: Colors.blueAccent,
            // ),
            Icon(buttonIcon, size: 20),
            const SizedBox(
              width: 15.0,
            ),
            Text(
              buttonName,
              style: TextStyle(
                fontSize: 18,
                color: secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
