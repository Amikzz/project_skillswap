import 'package:flutter/material.dart';
import 'package:project_skillswap/skillInfoPages/copywriting.dart';
import 'package:project_skillswap/skillInfoPages/posterhanging.dart';
import 'package:project_skillswap/skillInfoPages/webdevelopment.dart';
import 'package:project_skillswap/skillInfoPages/woodwork.dart';
import 'package:project_skillswap/splash.dart';
import 'package:project_skillswap/onboard.dart';
import 'package:project_skillswap/startup.dart';
import 'package:project_skillswap/login.dart';
import 'package:project_skillswap/signup.dart';
import 'package:project_skillswap/home.dart';
import 'package:project_skillswap/themes/theme_const.dart';
import 'package:project_skillswap/orders.dart';
import 'package:project_skillswap/notifications.dart';
import 'package:project_skillswap/instructionsharer.dart';
import 'package:project_skillswap/profile.dart';
import 'package:project_skillswap/skillInfoPages/painting.dart';

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
        '/trendingpaint': (context) => const Painting(),
        '/trendingwood': (context) => const WoodWork(),
        '/trendingweb': (context) => const WebDevelopment(),
        '/trendingposter': (context) => const PosterHanging(),
        '/trendingcopy': (context) => const CopyWriting(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}