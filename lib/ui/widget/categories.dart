import 'package:flutter/material.dart';
import 'package:tenang_test/theme.dart';

class Categories extends StatelessWidget {
  final String category;
  const Categories({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: kAccentColor3),
        child: Text(
          textAlign: TextAlign.center,
          category,
          style: body2TextStyle.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
