import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenang_test/cubit/page_cubit.dart';
import 'package:tenang_test/ui/pages/get_started_page.dart';
import 'package:tenang_test/ui/pages/main_page.dart';
import 'package:tenang_test/ui/pages/profile_page.dart';
import 'package:tenang_test/ui/pages/sign_in_page.dart';
import 'package:tenang_test/ui/pages/sign_up.dart';
import 'package:tenang_test/ui/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tes Tenang',
        routes: {
          '/': (context) => const MainPage(),
          '/get-started': (context) => const GetStartedPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
        },
      ),
    );
  }
}
