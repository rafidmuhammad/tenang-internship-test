import 'package:flutter/material.dart';
import 'package:tenang_test/theme.dart';
import 'package:tenang_test/ui/widget/custom_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40, bottom: 20),
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/image_profile.png"))),
                ),
                Text(
                  "Anastasia",
                  style: titleTextStyle.copyWith(
                    fontSize: 30,
                  ),
                ),
                Text(
                  "anastasia@gmail.com",
                  style: subtitleTextStyle,
                ),
                CustomButton(
                  onPressed: () {},
                  title: "Log out",
                  margin: EdgeInsets.only(top: 50),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
