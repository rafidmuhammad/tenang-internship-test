import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenang_test/cubit/auth_cubit.dart';
import 'package:tenang_test/cubit/page_cubit.dart';
import 'package:tenang_test/theme.dart';
import 'package:tenang_test/ui/widget/custom_button.dart';
import 'package:tenang_test/ui/widget/custom_text_field.dart';
import 'package:tenang_test/ui/widget/social_media_button.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  Widget pageHeader() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 53, bottom: 40),
        child: Column(
          children: [
            Container(
              width: 131,
              height: 113,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/doctor_login.png"))),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Alesha",
              style:
                  titleTextStyle.copyWith(fontSize: 50, color: kPrimaryColor1),
            ),
          ],
        ),
      ),
    );
  }

  Widget signInHeader() {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome back!",
            style: titleTextStyle,
          ),
          Text(
            "Sign in to continue.",
            style: subtitleTextStyle.copyWith(color: kAccentColor2),
          )
        ],
      ),
    );
  }

  Widget emailInput() {
    return CustomTextField(
      imageUrl: 'assets/icon_email.png',
      hintText: 'Email',
      margin: const EdgeInsets.only(bottom: 15),
      controller: emailController,
    );
  }

  Widget passwordInput() {
    return CustomTextField(
      imageUrl: 'assets/icon_pass.png',
      hintText: 'Password',
      margin: const EdgeInsets.only(bottom: 18),
      isObscure: true,
      controller: passwordController,
    );
  }

  Widget forgotPassword() {
    return Row(
      children: [
        const Spacer(),
        TextButton(
            onPressed: () {},
            child: Text(
              "Forgot Password?",
              style: body1TextStyle.copyWith(
                color: kPrimaryColor1,
              ),
            )),
      ],
    );
  }

  Widget signInButton() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
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
            context.read<AuthCubit>().signIn(
                email: emailController.text, password: passwordController.text);
          },
          title: "Sign in",
          margin: const EdgeInsets.only(top: 18, bottom: 15),
        );
      },
    );
  }

  Widget slash() {
    return Center(
        child: Text(
      "/",
      style: body1TextStyle.copyWith(color: kAccentColor2, fontWeight: bold),
    ));
  }

  Widget socialMediaButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return SocialMediaButton(
              iconWidth: 20,
              iconHeight: 20,
              imageUrl: 'assets/google.png',
              onPressed: () {
                context.read<AuthCubit>().signInWithGoogle();
              },
            );
          },
        ),
        SocialMediaButton(
          iconWidth: 15.67,
          iconHeight: 20,
          imageUrl: 'assets/apple.png',
          onPressed: () {},
        ),
        SocialMediaButton(
          iconWidth: 13,
          iconHeight: 22,
          imageUrl: 'assets/facebook.png',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget footer(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Do not have account?"),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sign-up');
            },
            child: const Text("Sign up!"))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                pageHeader(),
                signInHeader(),
                emailInput(),
                passwordInput(),
                forgotPassword(),
                signInButton(),
                slash(),
                const SizedBox(
                  height: 15,
                ),
                socialMediaButton(),
                const SizedBox(
                  height: 81,
                ),
                footer(context),
                const SizedBox(
                  height: 27,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
