import 'package:flutter/material.dart';
import 'package:project_skillswap/splash.dart';
import 'package:project_skillswap/onboard.dart';
import 'package:project_skillswap/startup.dart';
import 'package:project_skillswap/login.dart';
import 'package:project_skillswap/signup.dart';
import 'package:project_skillswap/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkillSwap',
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash(),
        '/onboard': (context) => const OnboardView(),
        '/startup': (context) => const StartupView(),
        '/signup': (context) => const SignupView(),
        '/login': (context) => const LoginView(),
        '/home': (context) => const MyHome(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

