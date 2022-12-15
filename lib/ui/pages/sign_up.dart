import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenang_test/cubit/auth_cubit.dart';
import 'package:tenang_test/cubit/page_cubit.dart';
import 'package:tenang_test/theme.dart';
import 'package:tenang_test/ui/widget/custom_button.dart';
import 'package:tenang_test/ui/widget/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  Widget header() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          const Spacer(),
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
    return CustomTextField(
      hintText: 'Fullname',
      margin: const EdgeInsets.only(top: 32, bottom: 15),
      controller: nameController,
    );
  }

  Widget emailInput() {
    return CustomTextField(
      hintText: 'Email',
      margin: const EdgeInsets.only(bottom: 15),
      controller: emailController,
    );
  }

  Widget passwordInput() {
    return CustomTextField(
      hintText: 'Password',
      margin: const EdgeInsets.only(bottom: 15),
      isObscure: true,
      controller: passwordController,
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
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
          //
          context.read<PageCubit>().setPage(0);
        } else if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red[700],
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return CustomButton(
          onPressed: () {
            if (check == true) {
              context.read<AuthCubit>().signUp(
                  email: emailController.text,
                  password: passwordController.text,
                  fullname: nameController.text);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text(
                      "Please agree to our Term of Service and Privacy Policy"),
                  backgroundColor: Colors.red[700],
                ),
              );
            }
          },
          title: "Sign up",
          margin: const EdgeInsets.only(top: 18),
        );
      },
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
