import 'package:flutter/material.dart';
import 'package:tenang_test/theme.dart';

class SocialMediaButton extends StatelessWidget {
  final String imageUrl;
  final Function() onPressed;
  final double iconWidth;
  final double iconHeight;
  const SocialMediaButton(
      {super.key,
      required this.imageUrl,
      required this.onPressed,
      required this.iconWidth,
      required this.iconHeight});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            //padding: EdgeInsets.all(30),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: kAccentColor2, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Image.asset(
            imageUrl,
            width: iconWidth,
            height: iconHeight,
          ),
        ],
      ),
    );
  }
}
