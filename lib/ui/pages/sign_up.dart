import 'package:flutter/material.dart';
import 'package:tenang_test/theme.dart';
import 'package:tenang_test/ui/widget/custom_button.dart';
import 'package:tenang_test/ui/widget/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Widget header() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Sign up",
                style: titleTextStyle,
              ),
              Text(
                "create new account",
                style: subtitleTextStyle.copyWith(color: kAccentColor2),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget fullnameInput() {
    return const CustomTextField(
      hintText: 'Fullname',
      margin: EdgeInsets.only(top: 32, bottom: 15),
    );
  }

  Widget emailInput() {
    return const CustomTextField(
      hintText: 'Email',
      margin: EdgeInsets.only(bottom: 15),
    );
  }

  Widget passwordInput() {
    return const CustomTextField(
      hintText: 'Password',
      margin: EdgeInsets.only(bottom: 15),
      isObscure: true,
    );
  }

  bool? check = false;
  Widget tac() {
    return CheckboxListTile(
      title: Text(
        "By creating an account you agree to our Terms of Service and Privacy Policy",
        style: body1TextStyle,
        textAlign: TextAlign.left,
      ),
      value: check,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (bool? value) {
        setState(() {
          check = value;
        });
      },
    );
  }

  Widget signUpButton() {
    return CustomButton(
      onPressed: () {},
      title: "Sign up",
      margin: EdgeInsets.only(top: 18),
    );
  }

  Widget footer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Already have account?"),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sign-in');
              },
              child: const Text("Sign in!"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: ListView(
            children: [
              header(),
              fullnameInput(),
              emailInput(),
              passwordInput(),
              tac(),
              signUpButton(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.28,
              ),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
