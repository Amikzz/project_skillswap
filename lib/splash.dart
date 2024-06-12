import 'package:flutter/material.dart';

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
    Navigator.pushNamed(context, '/onboard');
  }

  @override
  Widget build(BuildContext context) {
    // Detect current brightness (light or dark mode)
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Center(
        child: Image.asset(
          isDarkMode
              ? 'images/SkillSwap_Logo_Dark.png'
              : 'images/SkillSwap_Logo_Light.png',
        ),
      ),
    );
  }
}
