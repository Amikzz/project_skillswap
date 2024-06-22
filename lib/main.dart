import 'package:flutter/material.dart';
import 'package:project_skillswap/views/allskills.dart';
import 'package:project_skillswap/views/categories.dart';
import 'package:project_skillswap/views/splash.dart';
import 'package:project_skillswap/views/onboard.dart';
import 'package:project_skillswap/views/startup.dart';
import 'package:project_skillswap/views/login.dart';
import 'package:project_skillswap/views/signup.dart';
import 'package:project_skillswap/views/home.dart';
import 'package:project_skillswap/themes/theme_const.dart';
import 'package:project_skillswap/views/orders.dart';
import 'package:project_skillswap/views/notifications.dart';
import 'package:project_skillswap/views/instructionsharer.dart';
import 'package:project_skillswap/views/profile.dart';

import 'views/allproviders.dart';

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
      theme: lightMode,
      darkTheme: darkMode,
      title: 'SkillSwap',
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash(),
        '/onboard': (context) => const OnboardView(),
        '/startup': (context) => const StartupView(),
        '/signup': (context) => const SignupView(),
        '/login': (context) => const LoginView(),
        '/home': (context) => const MyHome(),
        '/orders': (context) => const Orders(),
        '/notifications': (context) => const Notifications(),
        '/profile': (context) => const Profile(),
        '/instructions': (context) => const Instructions(),
        '/categories': (context) => const SkillCategoriesPage(),
        '/allskills': (context) => const AllSkillsPage(),
        '/allproviders': (context) => const AllProviderPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}