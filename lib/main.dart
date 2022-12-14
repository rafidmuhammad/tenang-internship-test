import 'package:flutter/material.dart';
import 'package:tenang_test/ui/pages/get_started_page.dart';
import 'package:tenang_test/ui/pages/sign_in_page.dart';
import 'package:tenang_test/ui/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tes Tenang',
      routes: {
        '/': (context) => const SignInPage(),
        '/get-started': (context) => const GetStartedPage()
      },
    );
  }
}
