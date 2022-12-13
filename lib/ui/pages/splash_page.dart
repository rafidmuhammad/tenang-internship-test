import 'package:flutter/material.dart';
import 'package:tenang_test/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              kGradientColor2.withOpacity(0.6),
              kGradientColor1.withOpacity(1),
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
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
      ),
    );
  }
}
