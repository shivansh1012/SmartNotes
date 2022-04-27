import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:smartnotes/constants.dart';
import 'package:smartnotes/views/mobile_view/mobile_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 6),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MobileView(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          width: safeWidth,
          child: TextLiquidFill(
            text: "Smart Notes",
            waveColor: Colors.white,
            boxBackgroundColor: primary,
            textStyle: const TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
            ),
            boxHeight: safeWidth,
          ),
        ),
      ),
    );
  }
}
