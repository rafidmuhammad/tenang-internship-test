import 'package:flutter/material.dart';
import 'package:tenang_test/theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String imageUrl;
  final String hintText;
  final bool isObscure;
  final EdgeInsets margin;
  const CustomTextField(
      {super.key,
      this.imageUrl = "",
      required this.hintText,
      this.margin = EdgeInsets.zero,
      required this.controller,
      this.isObscure = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: margin,
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: textFieldColor, borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          (imageUrl.isNotEmpty
              ? Image.asset(
                  imageUrl,
                  width: 18,
                )
              : const SizedBox()),
          const SizedBox(
            width: 17,
          ),
          Expanded(
              child: TextFormField(
            controller: controller,
            obscureText: isObscure,
            style: body1TextStyle.copyWith(color: kAccentColor1),
            decoration: InputDecoration.collapsed(
              hintText: hintText,
              hintStyle: body1TextStyle.copyWith(color: kAccentColor2),
            ),
          )),
        ],
      ),
    );
  }
}
