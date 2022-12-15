import 'package:flutter/material.dart';
import 'package:tenang_test/theme.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  const DoctorCard(
      {super.key,
      required this.email,
      required this.name,
      required this.phone});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    size: 20,
                    Icons.person,
                    color: kPrimaryColor1,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    name,
                    style: subtitleTextStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    size: 20,
                    Icons.mail,
                    color: kPrimaryColor1,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    email,
                    style: body1TextStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.phone,
                    size: 20,
                    color: kPrimaryColor1,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    phone,
                    style: body1TextStyle,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
