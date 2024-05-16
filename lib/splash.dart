import 'package:flutter/material.dart';
import 'package:project_skillswap/onboard.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardView())
    );
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    home: Scaffold(
      body: Center(
          child: Image(
            image: AssetImage('images/SkillSwap-removebg-preview.png')
          )
      ),
    ),
        debugShowCheckedModeBanner: false,
    );
  }
}
