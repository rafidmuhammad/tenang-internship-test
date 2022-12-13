import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tenang_test/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/get-started', (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    kGradientColor2.withOpacity(1),
                    kGradientColor1.withOpacity(0.6),
                  ]),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/doctor.png',
                  width: 155,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Alesha",
                  style:
                      titleTextStyle.copyWith(fontSize: 50, color: kWhiteColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
