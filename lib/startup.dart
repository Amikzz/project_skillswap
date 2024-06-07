import 'package:flutter/material.dart';
import 'package:project_skillswap/customWidgets/startup_elevated_button.dart';
import 'package:project_skillswap/login.dart';

class StartupView extends StatelessWidget {
  const StartupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Image(
                    image: AssetImage('images/onboardimg3.png'),
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 60),
                  const Text(
                    "Welcome to SkillSwap",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Register as a",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  const SizedBox(height: 30),
                  //Custom Elevated Button
                  StartupElevatedButton(onPressed: () {
                    Navigator.of(context).push(createRoute());
                    },
                    text: "Skill Seeker",
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  const SizedBox(height: 20),
                  //Custom Elevated Button
                  StartupElevatedButton(onPressed: () {
                    Navigator.of(context).push(createRoute());
                    },
                    text: "Skill Sharer",
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    foregroundColor: Theme.of(context).colorScheme.onSecondary,
                  ),
                ],
                  ),
            ),
            ),
    ],
        )
        );
  }
}

Route createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const LoginView(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}