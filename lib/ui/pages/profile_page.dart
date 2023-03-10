import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenang_test/cubit/auth_cubit.dart';
import 'package:tenang_test/theme.dart';
import 'package:tenang_test/ui/widget/custom_button.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  User? user = FirebaseAuth.instance.currentUser;

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
                  margin: const EdgeInsets.only(top: 40, bottom: 20),
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/image_profile.png"))),
                ),
                Column(
                  children: [
                    if (user != null) ...[
                      Text(
                        "${user!.displayName}",
                        style: titleTextStyle.copyWith(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        "${user!.email}",
                        style: subtitleTextStyle,
                      ),
                    ] else ...[
                      const SizedBox()
                    ]
                  ],
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error),
                        ),
                      );
                    } else if (state is AuthInitial) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/sign-in', (route) => false);
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
                        context.read<AuthCubit>().signOut();
                      },
                      title: "Log out",
                      margin: const EdgeInsets.only(top: 50),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
