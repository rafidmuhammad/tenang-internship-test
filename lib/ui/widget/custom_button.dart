import 'package:flutter/material.dart';
import 'package:tenang_test/theme.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final String title;
  final Function() onPressed;
  final EdgeInsets margin;

  const CustomButton(
      {super.key,
      this.width = double.infinity,
      required this.onPressed,
      required this.title,
      this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: 50,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: kPrimaryColor1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25))),
          onPressed: onPressed,
          child: Text(
            title,
            style:
                body1TextStyle.copyWith(color: kWhiteColor, fontWeight: bold),
          )),
    );
  }
}
