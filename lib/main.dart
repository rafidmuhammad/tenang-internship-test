import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenang_test/cubit/auth_cubit.dart';
import 'package:tenang_test/cubit/page_cubit.dart';
import 'package:tenang_test/firebase_options.dart';
import 'package:tenang_test/ui/pages/get_started_page.dart';
import 'package:tenang_test/ui/pages/main_page.dart';
import 'package:tenang_test/ui/pages/sign_in_page.dart';
import 'package:tenang_test/ui/pages/sign_up.dart';
import 'package:tenang_test/ui/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tes Tenang',
        routes: {
          '/': (context) => const SplashPage(),
          '/get-started': (context) => const GetStartedPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/main': (context) => const MainPage(),
        },
      ),
    );
  }
}
