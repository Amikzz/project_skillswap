import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The splash screen of the app.
///
/// This page is shown when the app is first launched. It displays a logo and
/// then navigates to the appropriate page based on whether the user is logged
/// in or not.
class Splash extends StatefulWidget {
  /// Creates a [Splash] screen.
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  /// Navigates to the next page after the splash screen.
  ///
  /// If the user is logged in, it navigates to the home page. Otherwise, it
  /// navigates to the onboarding page.
  Future<void> _navigateToNextPage() async {
    // Simulate loading time (e.g., 3 seconds for the splash screen)
    await Future.delayed(const Duration(seconds: 3), () {});

    // Check if a token exists in shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null && token.isNotEmpty) {
      // If the token exists, navigate to the home page
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Otherwise, navigate to the onboarding screen
      Navigator.pushReplacementNamed(context, '/onboard');
    }
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
